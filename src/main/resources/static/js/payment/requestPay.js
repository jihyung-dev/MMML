// portone v1사용
// portone v2에서 추가된 기능까지는 필요하지 않음. 애플페이, 구글페이, 카드 가맹점과 직접 연결 등 여러가지 변경되었지만 필요없다고 판단됨.

// /**
//  * portOne 결제 요청 스크립트
//  */
// const IMP = window.IMP;
// IMP.init("imp87001801"); // 예: 'imp00000000'
//
// /**
//  * 결제 시작 함수
//  */
// function startPayment(orderId, amount, buyer = {}){
//     // DB에 ORDER_MAIN 생성
//     IMP.request_pay(
//         {
//         pg: "html5_inicis.INIpayTest",
//         pay_method: "card",
//         merchant_uid: `payment-${crypto.randomUUID()}`, // 주문 고유 번호
//         name: "노르웨이 회전 의자",
//         amount: 100,
//         buyer_email: "gildong@gmail.com",
//         buyer_name: "홍길동",
//         buyer_tel: "010-4242-4242",
//         buyer_addr: "서울특별시 강남구 신사동",
//         buyer_postcode: "01181",
//     }, function(rsp){
//         // 1) portOne 결제창 내부 성공 여부
//         if(rsp.success){
//             console.log("결제요청성공", rsp)
//             fetch(`/payment/verify?imp_uid=${rsp.imp_uid}`)
//             // 2) 결제 검증 요청 API(spring 서버에 요청 예정);
//         } else {
//             console.error("결제 실패: ", rsp.error_msg);
//             // ORDER_MAIN에서 CANCEL로 상태 변경
//         }
//     });
// }


/**
* 결제 시작 함수
* @param orderId: OrderMain ID
* @param merchantUid: 서버에서 생성한 주문 고유 번호
* @param amount: 최종 결제 금액
* @param buyerId: 구매자 ID
*/

const IMP = window.IMP;
IMP.init("imp87001801");

function startPayment(orderId, merchantUid, amount, buyerId){

    console.log("startPayment 함수 내부 진입. IMP.request_pay 실행 예정.");

    // 💡 문자열로 넘어왔을 경우 Number()로 명시적 변환
    const numericAmount = Number(amount);

    // 💡 결제 요청 데이터 준비 (임시값 대신 실제값 사용)
    IMP.request_pay(
        {
            pg: "html5_inicis.INIpayTest",
            pay_method: "card",
            merchant_uid: merchantUid, //💡 주문 고유 번호
            name: "핫딜 상품 결제", // 상품명
            amount: numericAmount, // 💡 실제 결제 금액 사용
            // buyer_email: "gildong@gmail.com", // 필요 시 실제 buyer 정보 사용
            buyer_name: buyerId, // 회원 ID 또는 이름
            // ... (배송지 정보 등)
            buyer_email: "gildong@gmail.com",
//         buyer_name: "홍길동",
            buyer_tel: "010-4242-4242",
            buyer_addr: "서울특별시 강남구 신사동",
            buyer_postcode: "01181",

        }, function(rsp){
            // 1) portOne 결제창 내부 성공 여부
            if(rsp.success){
                console.log("결제 요청 성공", rsp);

                // 2) 💡 [핵심] 서버의 결제 검증 및 재고 차감 API 호출
                fetch("/payment/verify", { // 💡 API 경로 확인 (PaymentApi Controller의 경로)
                    method: "POST",
                    headers: {
                        "Content-Type": "application/json",
                    },
                    body: JSON.stringify({
                        merchant_uid: rsp.merchant_uid,
                        imp_uid: rsp.imp_uid,
                        pg_tid: rsp.pg_tid,
                        amount: rsp.paid_amount // 실제 결제된 금액
                    })
                })
                    .then(response => {
                        if (!response.ok) {
                            // 서버 처리 실패 (예: 재고 부족, 금액 불일치)
                            throw new Error("서버 결제 검증/재고 차감 실패");
                        }
                        return response.json();
                    })
                    .then(data => {
                        alert('결제가 완료되었습니다!');
                        // 3) 성공 페이지 이동
                        window.location.href = `/hotdeal/order/success?merchantUid=${rsp.merchant_uid}`;
                    })
                    .catch(error => {
                        console.error("서버 처리 오류: ", error);
                        alert('결제 검증 중 오류가 발생했습니다. 고객센터에 문의하세요.');
                        // 💡 [필수] 서버에서 결제 취소 요청 API (PG사) 호출 로직이 필요합니다.
                        // window.location.href = `/hotdeal/order/fail?msg=Server_Error`;
                    });

            } else {
                // 💡 결제 실패/취소 (결제창에서 취소)
                console.error("결제 실패: ", rsp.error_msg);
                alert("결제가 취소되었습니다.");

                // OrderMain 상태 변경 로직은 필요하다면 여기에 추가 (PENDING -> CANCEL)
                // fetch('/hotdeal/order/cancel_pending?merchant_uid=' + merchantUid, ...);
            }
        });
}

/*
* 주문 수정 요청 처리 (서버 API 호출 후 이전 페이지로 이동)
* @param {string} merchantUid 주문 고유 ID
* @param {string} orderId DB 주문 ID
*/
function handleOrderModification(merchantUid, orderId) {
    // 1. 서버에 주문 취소/수정 요청 API 호출 (GET 또는 POST)
    // 이 API는 DB에서 현재 PENDING 주문을 찾아 상태를 취소로 변경하고 재고를 원복해야 합니다.
    fetch(`/hotdeal/order/cancel_pending?merchant_uid=${merchantUid}`, {
        method: 'GET', // 또는 'POST'를 사용하여 보안 강화
    })
        .then(response => {
            if (!response.ok) {
                throw new Error('주문 수정/취소 처리 중 서버 오류가 발생했습니다.');
            }
            return response.json();
        })
        .then(data => {
            if (data.ok) {

                // 2. 브라우저 히스토리를 이용해 이전 페이지(상품 상세/주문 페이지)로 돌아갑니다.
                window.history.back();
            } else {
                alert('주문 수정 처리 실패: ' + data.msg);
            }
        })
        .catch(error => {
            console.error('주문 수정 오류:', error);
            alert('주문 수정 처리 중 통신 오류가 발생했습니다.');
        });
}
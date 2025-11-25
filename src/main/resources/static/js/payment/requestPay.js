// portone v1사용
// portone v2에서 추가된 기능까지는 필요하지 않음. 애플페이, 구글페이, 카드 가맹점과 직접 연결 등 여러가지 변경되었지만 필요없다고 판단됨.

/**
 * portOne 결제 요청 스크립트
 */
const IMP = window.IMP;
IMP.init("imp87001801"); // 예: 'imp00000000'

/**
 * 결제 시작 함수
 */
function startPayment(orderId, amount, buyer = {}){
    // DB에 ORDER_MAIN 생성
    IMP.request_pay(
        {
        pg: "html5_inicis.INIpayTest",
        pay_method: "card",
        merchant_uid: `payment-${crypto.randomUUID()}`, // 주문 고유 번호
        name: "노르웨이 회전 의자",
        amount: 100,
        buyer_email: "gildong@gmail.com",
        buyer_name: "홍길동",
        buyer_tel: "010-4242-4242",
        buyer_addr: "서울특별시 강남구 신사동",
        buyer_postcode: "01181",
    }, function(rsp){
        // 1) portOne 결제창 내부 성공 여부
        if(rsp.success){
            console.log("결제요청성공", rsp)
            fetch(`/payment/verify?imp_uid=${rsp.imp_uid}`)
            // 2) 결제 검증 요청 API(spring 서버에 요청 예정);
        } else {
            console.error("결제 실패: ", rsp.error_msg);
            // ORDER_MAIN에서 CANCEL로 상태 변경
        }
    });
}
/**
 * payment-interceptor.js
 *
 * 목적:
 *  1) 기존 startPayment 코드를 전혀 건드리지 않고, IMP.request_pay 호출을 가로채서
 *     결제 성공 시 자동으로 서버의 /payment/verify 엔드포인트에 POST 요청을 보냄.
 *  2) 팀원이 알아보기 쉽게 주석을 충분히 넣음.
 *
 * 사용법:
 *  1) 이 파일을 기존 startPayment 스크립트보다 먼저 로드하세요.
 *  2) 기존 startPayment 파일은 전혀 수정하지 않습니다.
 *
 * 주의:
 *  - IMP 전역 객체가 아직 없다면 (외부 SDK 로딩 순서 문제) 이 코드가 실행될 때까지
 *    폴백으로 대기 후 래핑합니다.
 */

/* ----- 설정 (필요하면 수정) ----- */
const PAYMENT_VERIFY_ENDPOINT = '/payment/verify'; // 서버측 엔드포인트 (POST, JSON)

/* ----- 내부 유틸 ----- */
function waitForGlobal(name, timeout = 5000) {
    return new Promise((resolve, reject) => {
        const start = Date.now();
        (function check() {
            if (window[name]) return resolve(window[name]);
            if (Date.now() - start > timeout) return reject(new Error(name + ' not found'));
            setTimeout(check, 50);
        })();
    });
}

/* ----- 실제 래퍼 로직 ----- */
(async function initInterceptor() {
    try {
        // 기다려서 IMP 객체가 준비되면 원본 함수를 보관하고 대체한다
        const IMP = await waitForGlobal('IMP', 10000); // 10s 대기
        if (!IMP) {
            console.warn('[payment-interceptor] IMP not available, interceptor disabled.');
            return;
        }

        // 이미 래핑되어 있으면 중복 래핑 방지
        if (IMP.__original_request_pay_wrapped) {
            console.info('[payment-interceptor] IMP.request_pay already wrapped.');
            return;
        }

        // 원본 함수 보관
        const originalRequestPay = IMP.request_pay.bind(IMP);

        // 대체 함수
        IMP.request_pay = function (options, callback) {
            // (1) 안전하게 기존 콜백을 감싸는 래퍼를 만든다
            const wrappedCallback = async function (rsp) {
                try {
                    // 먼저 기존 콜백 동작(원 작성자의 로직)을 그대로 실행
                    if (typeof callback === 'function') {
                        try { callback(rsp); } catch (e) {
                            console.error('[payment-interceptor] original callback error', e);
                        }
                    }

                    // (2) 결제 성공 시에만 서버 검증 요청 자동 전송
                    if (rsp && rsp.success) {
                        // 기본적으로 imp_uid, merchant_uid, paid_amount(또는 amount)를 보낸다.
                        const payload = {
                            imp_uid: rsp.imp_uid,
                            merchant_uid: rsp.merchant_uid,
                            amount: rsp.paid_amount !== undefined ? rsp.paid_amount : rsp.amount,
                            // 기존 코드가 생성하는 내부 orderId가 있다면 여기에 포함할 수 있음.
                            // orderId: <yourLocalOrderIdIfAvailable>
                        };

                        // POST로 전송 (JSON)
                        try {
                            const resp = await fetch(PAYMENT_VERIFY_ENDPOINT, {
                                method: 'POST',
                                headers: { 'Content-Type': 'application/json' },
                                body: JSON.stringify(payload),
                                credentials: 'same-origin' // 세션 연동 필요시
                            });
                            const json = await resp.json();
                            if (resp.ok && json.ok) {
                                console.info('[payment-interceptor] server verification success', json);
                                // 필요하면 여기서 UI 변경 호출 가능(예: 알림)
                            } else {
                                console.warn('[payment-interceptor] server verification failed', json);
                                // 검증 실패 시, 필요하면 추가 복구 로직을 호출하거나
                                // 서버에 주문 취소 API를 요청하도록 할 수 있음.
                            }
                        } catch (err) {
                            console.error('[payment-interceptor] verification request error', err);
                        }
                    }
                } catch (outerErr) {
                    console.error('[payment-interceptor] wrappedCallback error', outerErr);
                }
            };

            // (3) 원본 request_pay 호출 (콜백은 wrappedCallback으로 대체하여 원작성자 콜백이 먼저 호출되게 함)
            return originalRequestPay(options, wrappedCallback);
        };

        // 표시용 플래그
        IMP.__original_request_pay_wrapped = true;
        console.info('[payment-interceptor] IMP.request_pay wrapped successfully.');
    } catch (err) {
        console.error('[payment-interceptor] init failed', err);
    }
})();

function sendEmailAuth(){
    const email = document.getElementById("emailInput").value.trim();

    if(!email){
        alert("이메일을 입력해주세요.");
        return;
    }

    fetch("/request/mail?email=" + email)
        .then(res => res.text())
        .then(result => {
            if(result === "success"){
                // 인증 입력란 보여주기
                document.getElementById("authCodeBox").classList.add("show-input");
                alert("인증 메일을 발송했습니다.");
            }else{
                alert("메일 발송에 실패했습니다. 이메일 주소를 다시 확인해주세요.");
            }
        })
        .catch(() => alert("메일 요청 중 오류가 발생했습니다."));
}

function sendAuthMail(){
    const email = document.getElementById("emailInput").value.trim();
    const inputCode = document.getElementById("authCodeInput").value.trim();
    if(!inputCode){
        alert("인증번호를 입력해주세요.");
        return;
    }

    fetch("/request/check_mail?email=" + email + "&inputCode=" + inputCode)
        .then(res => res.text())
        .then(result => {
            if(result === "true"){
                document.getElementById("isEmailVerified").value = "true";
                alert("이메일 인증 성공!");
            } else {
                alert("인증번호가 올바르지 않습니다.");
            }
        })
        .catch(() => alert("인증 처리 중 오류가 발생했습니다."));
}

// 이메일 인증 확인 후 제출
document.addEventListener("DOMContentLoaded", () => {
    document.querySelector("#findIdForm").addEventListener("submit", (e) => {
        const verified = document.getElementById("isEmailVerified").value;

        if (verified !== "true") {
            e.preventDefault();   // 폼 전송 중단
            alert("이메일 인증을 먼저 완료해주세요.");

            // 인증 UI 다시 보여주기
            document.getElementById("authCodeBox").classList.add("show-input");
            return false;
        }
    });
});
document.addEventListener("DOMContentLoaded", () => {
    window.addEventListener("DOMContentLoaded", () => {

        const form = document.getElementById("joinForm");
        const emailInput = document.getElementById("emailInput");
        const authBox = document.getElementById("authCodeBox");
        const verifiedFlag = document.getElementById("isEmailVerified");
        // 가입 제출 방지
        form.addEventListener("submit", (e) => {
            console.log("submit try");

            if (verifiedFlag.value !== "true") {
                console.log("prevent submit");
                e.preventDefault();
                alert("이메일 인증을 완료해주세요.");
                authBox.classList.add("show-input");
                return false;
            }
        });
    });
});
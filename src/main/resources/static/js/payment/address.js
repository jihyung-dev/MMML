const addAddressForm=document.getElementById("addAddressForm");
const addressModalBtn=document.getElementById("addressModalBtn");
const addressMsg=document.getElementById("addressMsg");
const addressListBox=document.getElementById("addressListBox");
const selectedAddress=document.getElementById("selectedAddress");
let currentSelectedAddress = null; //현재 선택(표시)된 주소 id 저장 (초기값 null)

//배송지 검색 카카오 api
function openPostcode() {
    new daum.Postcode({
        oncomplete: function(data) {
            console.log(data)
            console.log(document.querySelector("input[name='addressLine1']"))
            addAddressForm.addressLine1.value = data.roadAddress;
            addAddressForm.zipcode.value = data.zonecode;
        }
    }).open();
};

const renderAddressSelected=(address)=>{
    return`   <!-- 배송지명 + 기본배송지 표시 -->
                <input type="hidden" name="recipientName" value="${address.recipientName}">
                <input type="hidden" name="addressLine1" value="${address.addressLine1}">
                <input type="hidden" name="addressLine2" value="${address.addressLine2}">
                <input type="hidden" name="zipCode" value="${address.zipcode}">
                <input type="hidden" name="phone" value="${address.phone}">
                <input type="hidden" name="requestMessage" value="${address.requestMessage}">
                <h5>
                    <span>${address.addressName}</span>
                    <span class="badge bg-primary ms-1">${address.isDefault ? '기본배송지':''}</span>
                </h5>

                <!-- 받는 사람 -->
                <p class="mb-1">
                    <strong>받는 사람:</strong>
                    <span id="recipientName">${address.recipientName}</span>
                </p>

                <!-- 주소 -->
                <p class="mb-1">
                    <strong>주소:</strong>
                    <span id="addressLine1">${address.addressLine1}</span>
                    <span id="addressLine2">${address.addressLine2}</span>
                </p>

                <!-- 우편번호 -->
                <p class="mb-1">
                    <strong>우편번호:</strong>
                    <span id="zipcode">${address.zipcode}</span>
                </p>

                <!-- 연락처 -->
                <p class="mb-1">
                    <strong>연락처:</strong>
                    <span id="phone">${address.phone}</span>
                </p>

                <!-- 요청사항 -->
                <p class="mb-1">
                    <strong>요청사항:</strong>
                    <span id="requestMeassage">${address.requestMessage}</span>
                </p>`;
}
//화면에 최초로 출력될 기본 배송지 조회
const loadSelectedAddress=async(id)=>{
    let url;
    if (!id) {
        url = "/api/address/default";
    } else {
        url = `/api/address/${id}`;
    }
    const response = await fetch(url);
    if (response.ok) {
        const address = await response.json();
        if (address) {
            selectedAddress.innerHTML = renderAddressSelected(address);
            // 현재 선택 id 저장 (assume address.id 존재)
            currentSelectedAddressId = address.id || null;
        } else {
            currentSelectedAddressId = null;
        }
    } else if (response.status === 404) {
        selectedAddress.innerHTML = `<div>"배송지 변경"을 누르고 배송지를 등록하거나 선택하세요.</div>`;
        currentSelectedAddressId = null;
    } else if (response.status === 400) {
        if (confirm("로그인 후 이용하세요")) {
            location.href = "/login";
        }
        currentSelectedAddressId = null;
    } else {
        addressMsg.innerText = "서버 오류입니다. 다시 시도하세요."
        currentSelectedAddressId = null;
    }
}
loadSelectedAddress();
const renderAddress = (item) => {
    return`
 <div onclick="selectAddress(${item.id})"
       class="list-group-item list-group-item-action ${item.isDefault ? 'address-default' : 'address-normal'} address-card-${item.id}"
       data-id="${item.id}">

    <div class="py-3 px-2">
        <div class="d-flex justify-content-between">
            <h5 class="card-title">${item.addressName}</h5>
            <div>
                <button class="btn btn-sm btn-outline-success"
                        onclick="setDefault(event, ${item.id})" ${item.isDefault ? "hidden" : ""}>
                    기본 배송지로 변경
                </button>
                <span>${item.isDefault ? "기본배송지" : ""}</span>
            </div>
        </div>
        <div class="card-text my-2">
            <strong>받는 사람:</strong> ${item.recipientName}<br>
            <strong>주소:</strong> ${item.addressLine1} ${item.addressLine2 || ""}<br>
            <strong>우편번호:</strong> ${item.zipcode}<br>
            <strong>연락처:</strong> ${item.phone}<br>
            <strong>요청사항:</strong> ${item.requestMessage || "-"}<br>
        </div>
        <div class="d-flex justify-content-end">
            <button class="btn btn-outline-primary me-1" onclick="editAddress(event, ${item.id})">수정</button>
            <button class="btn btn-outline-danger me-1" onclick="deleteAddress(event, ${item.id})">삭제</button>
        </div>
    </div>
</div>        `;
};

// 기본배송지 변경 함수
async function setDefault(e, id) {
    // 버튼 클릭이 부모의 selectAddress 이벤트로 전파되는 것을 막음
    if (e && e.stopPropagation) e.stopPropagation();

    if (!confirm('이 주소를 기본 배송지로 설정하시겠습니까?')) return;

    try {
        const response = await fetch(`/api/address/default/${id}`, {
            method: 'PUT',
            headers: {
                'Content-Type': 'application/json'
            }
        });

        if (response.ok) {
            // 성공 메시지 (원하면 toast로 바꾸세요)
            addressMsg.innerText = "기본배송지로 설정되었습니다.";
            // 주소 목록과 선택된 기본주소 다시 로드
            await loadAddressList();         // 아래에 구현한 함수
            await loadSelectedAddress();     // 기존에 있던 함수 (기본주소 불러오기)
        } else if (response.status === 401) {
            if (confirm("로그인 후 이용하세요")) location.href = "/login";
        } else {
            const text = await response.text();
            addressMsg.innerText = text || "기본배송지 변경 실패";
        }
    } catch (err) {
        console.error(err);
        addressMsg.innerText = "네트워크 오류. 다시 시도하세요.";
    }
}

const renderAddressList=(addressList)=>{
    if(addressList && addressList.length>0){
        let html="";
        for(let address of addressList){
            html+=renderAddress(address);
        }
        addressListBox.innerHTML=html;
    }else {
        addressListBox.innerHTML= "<p class='text-muted'>등록된 배송지가 없습니다.</p>";
    }

}
const loadAddressList = async () => {
    try {
        const res = await apiFetch('/api/address');
        if (!res.ok) {
            // 에러 처리...
            return;
        }
        const list = await res.json();
        renderAddressList(list); // renderAddressList는 innerHTML 교체
    } catch (err) {
        console.error(err);
    }
};


//CSRF 토큰 없이 주소 삭제/수정 함수
async function apiFetch(url, options = {}) {
    const base = { credentials: 'same-origin' };
    return fetch(url, Object.assign(base, options));
}


// 1) 삭제 함수
async function deleteAddress(e, id) {
    if (e && e.stopPropagation) e.stopPropagation();
    console.log('[deleteAddress] called id=', id);

    if (!confirm('정말 이 배송지를 삭제하시겠습니까?')) return;

    try {
        const res = await apiFetch(`/api/address/${id}`, { method: 'DELETE' });
        console.log('[deleteAddress] response status=', res.status);

        if (res.ok) {
            // ************************************************
            // 핵심 수정 부분:
            // 1) 수동 DOM 제거 대신, loadAddressList()를 호출하여 목록을 서버 상태와 완전히 동기화합니다.
            //    (이 함수가 addressListBox의 innerHTML을 갱신합니다.)
            await loadAddressList(); // <--- 이 부분을 추가/주석 해제

            // 2) 만약 삭제된 주소가 현재 '선택 영역'에 표시된 주소라면 선택 영역을 갱신합니다.
            if (currentSelectedAddressId && String(currentSelectedAddressId) === String(id)) {
                selectedAddress.innerHTML = `<div class="text-muted">선택된 배송지가 삭제되었습니다. 다른 배송지를 선택하거나 새로 등록하세요.</div>`;
                currentSelectedAddressId = null;
                // 기본 배송지 갱신 (선택 영역 재로드)
                await loadSelectedAddress();
            }
            // ************************************************

            addressMsg.innerText = "삭제되었습니다.";

            // (참고: 기존의 수동 DOM 제거 및 '남은 주소 없음' 체크 로직은
            //       loadAddressList() 호출로 인해 모두 불필요해집니다.)

        } else {
            const text = await res.text().catch(()=>null);
            addressMsg.innerText = text || `삭제 실패(${res.status})`;
            console.warn('[deleteAddress] failed:', res.status, text);
        }
    } catch (err) {
        console.error(err);
        addressMsg.innerText = "네트워크 오류. 다시 시도하세요.";
    }
}

// 2) 편집(수정) 클릭 => 모달 폼 채우기
async function editAddress(e, id) {
    if (e && e.stopPropagation) e.stopPropagation();

    try {
        const res = await apiFetch(`/api/address/${id}`, { method: "GET" });

        if (!res.ok) {
            addressMsg.innerText = "배송지를 불러올 수 없습니다.";
            return;
        }

        const item = await res.json();

        // 폼 채우기
        document.getElementById("addressName").value = item.addressName || "";
        document.getElementById("recipientName").value = item.recipientName || "";
        document.getElementById("addressLine1").value = item.addressLine1 || "";
        document.getElementById("addressLine2").value = item.addressLine2 || "";
        document.getElementById("zipcode").value = item.zipcode || "";
        document.getElementById("phone").value = item.phone || "";
        document.getElementById("requestMessage").value = item.requestMessage || "";

        // hidden ID 생성
        let editing = document.getElementById("editingAddressId");
        if (!editing) {
            editing = document.createElement("input");
            editing.id = "editingAddressId";
            editing.type = "hidden";
            editing.name = "id";
            addAddressForm.appendChild(editing);
        }
        editing.value = item.id;

        // 버튼 문구 변경
        const btn = addAddressForm.querySelector("button[type='submit']");
        btn.innerText = "수정 저장";

        // 모달 열기
        addressModalBtn.click();

    } catch (err) {
        console.error(err);
        addressMsg.innerText = "수정할 주소를 불러오는 중 오류 발생";
    }
}



addressModalBtn.addEventListener("click", loadAddressList);
const addAddressFormSubmitHandler= async (e)=>{
    e.preventDefault();


    const editingInput = document.getElementById("editingAddressId");
    const isEditing = editingInput && editingInput.value;

    // formData -> json
    const formData = new FormData(e.target);
    const jsonData = Object.fromEntries(formData.entries());

    // 만약 editing이면 id 필드 값은 hidden input에 있음 -> jsonData에 이미 포함될 것
    const url= isEditing ? "/api/address" : "/api/address";
    const method= isEditing ? "PUT" : "POST";

    const headers = {
        "Content-Type": "application/json"
    };
    if (CSRF_TOKEN) headers[CSRF_HEADER] = CSRF_TOKEN;

    try {
        const response = await fetch(url, {
            method,
            headers,
            body: JSON.stringify(jsonData)
        });

        if(resonse.ok){
        alert(isEditing ? "수정 성공" : "등록 성공");
            // 상태 초기화
            if (isEditing) {
                editingInput.value = "";
                const submitBtn = addAddressForm.querySelector("button[type='submit']");
                if (submitBtn) submitBtn.innerText = "등록";
            }
            // 폼 초기화
            addAddressForm.reset();
            document.getElementById("addressLine1").value = "";
            document.getElementById("zipcode").value = "";

        await loadAddressList();
        await loadSelectedAddress();

        } else if (response.status === 400) {
            const errorText = await response.text();
            addressMsg.innerText = errorText || "입력 값이 잘못되었습니다.";
        } else if (response.status === 401) {
            if (confirm("로그인 후 이용하세요")) location.href = "/login";
        } else {
            addressMsg.innerText = "서버 오류가 발생했습니다. 다시 시도해주세요.";
        }
    } catch (err) {
        console.error(err);
        addressMsg.innerText = "네트워크 오류. 다시 시도하세요.";
    }
};

// 반드시 submit 핸들러 연결 (이미 연결되어 있으면 중복 주의)
addAddressForm.removeEventListener("submit", addAddressFormSubmitHandler);
addAddressForm.addEventListener("submit", async (e) => {
    e.preventDefault();

    const editing = document.getElementById("editingAddressId");
    const isEditing = editing && editing.value;

    const formData = new FormData(e.target);
    const json = Object.fromEntries(formData.entries());

    const method = isEditing ? "PUT" : "POST";

    try {
        const response = await apiFetch("/api/address", {
            method,
            headers: {
                "Content-Type": "application/json"
            },
            body: JSON.stringify(json)
        });

        if (response.ok) {
            alert(isEditing ? "수정되었습니다." : "등록되었습니다.");

            // 초기화
            if (isEditing) {
                editing.remove();
                addAddressForm.querySelector("button[type='submit']").innerText = "등록";
            }

            addAddressForm.reset();

            await loadAddressList();
            await loadSelectedAddress();

        } else {
            const msg = await response.text();
            addressMsg.innerText = msg || "저장 실패";
        }
    } catch (err) {
        console.error(err);
        addressMsg.innerText = "네트워크 오류 발생";
    }
});

const selectAddress = (id) => {
    loadSelectedAddress(id);

    // 모든 카드에서 선택 클래스 제거
    document.querySelectorAll(".list-group-item").forEach(item => {
        item.classList.remove("address-selected");
    });

    // 클릭한 카드에 선택 효과 추가
    const selectedCard = document.querySelector(`.address-card-${id}`);
    if (selectedCard) {
        selectedCard.classList.add("address-selected");
    }
};


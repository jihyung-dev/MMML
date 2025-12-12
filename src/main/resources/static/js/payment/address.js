const addAddressForm=document.getElementById("addAddressForm");
const addressModalBtn=document.getElementById("addressModalBtn");
const addressMsg=document.getElementById("addressMsg");
const addressListBox=document.getElementById("addressListBox");
const selectedAddress=document.getElementById("selectedAddress");
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
    if(!id){
        url="/api/address/default";
    }else{
        url=`/api/address/${id}`;
    }
    const response=await fetch(url);
    if(response.ok){
        const address= await response.json();
        if(address){
            selectedAddress.innerHTML=renderAddressSelected(address);
        }
    }else if(response.status===404){
        selectedAddress.innerHTML=`<div>"배송지 변경"을 누르고 배송지를 등록하거나 선택하세요.</div>`;
    }else if(response.status===400){
        if(confirm("로그인 후 이용하세요")){
            location.href="/login";
        }
    }else{
        addressMsg.innerText="서버 오류입니다. 다시 시도하세요."
    }

}
loadSelectedAddress();
const renderAddress = (item) => {
    return`
 <div   onclick="selectAddress(${item.id})"
        class="list-group-item list-group-item-action ${item.isDefault ? 'border-primary' : ''}">
    <div class="py-3 px-2">
        <div class="d-flex justify-content-between">
            <h5 class="card-title">${item.addressName}</h5>
            <div>
                <button class="btn btn-sm btn-outline-success"
                        onclick="setDefault(${item.id})" ${item.isDefault ? "hidden" : ""}>
                    기본 배송지 변경
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
            <button class="btn btn-outline-primary me-1" onclick="editAddress(${item.id})">수정</button>
            <button class="btn btn-outline-danger me-1" onclick="deleteAddress(${item.id})">삭제</button>
        </div>
    </div>
</div>        `;
};


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
    let url="/api/address";
    const response = await fetch(url);
    if(response.ok){
        const addressList= await response.json();
        renderAddressList(addressList);

    }else if(response.status===400){
        if(confirm("로그인 후 이용하세요")){
            location.href="/login";
        }
    }else{
        addressMsg.innerText="서버 오류입니다. 다시 시도하세요."
    }
}
addressModalBtn.addEventListener("click", loadAddressList);
const addAddressFormSubmitHandler= async (e)=>{
    e.preventDefault();
    let url="/api/address";
    const formData=new FormData(e.target);
    const jsonData=Object.fromEntries(formData.entries());
    const options={
        method:"POST",
        headers:{
            "Content-Type":"application/json"
        },
        body:JSON.stringify(jsonData)
    }
    const resonse=await fetch(url,options);
    if(resonse.ok){
        alert("등록 성공")
        await loadAddressList();
        // 폼 초기화
        addAddressForm.reset();

        // 주소 검색 필드 readonly라서 일부 브라우저 자동 초기화 안될 수 있어서 직접 초기화
        document.getElementById("addressLine1").value = "";
        document.getElementById("zipcode").value = "";

    } else if(resonse.status === 400){
        const errorText = await resonse.text();
        addressMsg.innerText = errorText || "입력 값이 잘못되었습니다.";
        //alert(errorText);
    } else {
        addressMsg.innerText = "서버 오류가 발생했습니다. 다시 시도해주세요.";
    }
};
const selectAddress=(id)=>{
    loadSelectedAddress(id);
}

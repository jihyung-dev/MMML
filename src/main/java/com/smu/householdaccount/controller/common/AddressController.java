package com.smu.householdaccount.controller.common;

import com.smu.householdaccount.dto.MemberAddressValid;
import com.smu.householdaccount.entity.common.Member;
import com.smu.householdaccount.entity.common.MemberAddress;
import com.smu.householdaccount.service.common.AddressService;
import jakarta.validation.Valid;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.support.DefaultMessageSourceResolvable;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;

import javax.swing.text.html.Option;
import java.util.List;
import java.util.Optional;

@RestController
@RequestMapping("/api/address")
@RequiredArgsConstructor(onConstructor_ = @Autowired)
public class AddressController {

    private final AddressService addressService;

    @GetMapping
    public ResponseEntity<List<MemberAddress>> getAddress(
            @SessionAttribute(value = "loginUser",required = false) Member loginUser
    ){
        if(loginUser==null) return ResponseEntity.badRequest().build();

        List<MemberAddress> memberAddressList=addressService.getAddressesByMemberId(loginUser.getMemberId());

        return ResponseEntity.ok(memberAddressList);
    }


    @GetMapping("/default")
    public ResponseEntity<MemberAddress> getDefaultAddress(
            @SessionAttribute(value = "loginUser",required = false) Member loginUser
    ){

        if(loginUser==null) return ResponseEntity.badRequest().build();

        MemberAddress memberAddress=addressService.getDefaultAddress(loginUser.getMemberId());

        if(memberAddress==null) return ResponseEntity.notFound().build();

        return ResponseEntity.ok(memberAddress);
    }
    @GetMapping("/{id}")
    public ResponseEntity<MemberAddress> getAddress(
            @PathVariable Long id,
            @SessionAttribute(value = "loginUser",required = false) Member loginUser
    ){

        if(loginUser==null) return ResponseEntity.badRequest().build();

        Optional<MemberAddress> memberAddress=addressService.getAddressById(id);

        if(memberAddress.isEmpty()) return ResponseEntity.notFound().build();

        return ResponseEntity.ok(memberAddress.get());
    }

    @PostMapping
    public ResponseEntity<?> addAddress(

            @Valid @RequestBody MemberAddressValid dto,
            BindingResult bindingResult,

            @SessionAttribute(value = "loginUser", required = false) Member loginUser
    ){
        if (loginUser == null) {
            return ResponseEntity.status(HttpStatus.UNAUTHORIZED).body("로그인이 필요합니다.");
        }

        // validation 오류 처리
        if (bindingResult.hasErrors()) {
            String errorMessage = bindingResult.getFieldErrors()
                    .stream()
                    .map(DefaultMessageSourceResolvable::getDefaultMessage)
                    .findFirst()
                    .orElse("입력값이 올바르지 않습니다.");

            return ResponseEntity.badRequest().body(errorMessage);
        }

        // DTO → Entity 변환
        MemberAddress address = new MemberAddress();
        address.setMemberId(loginUser.getMemberId());
        address.setAddressName(dto.getAddressName());
        address.setRecipientName(dto.getRecipientName());
        address.setAddressLine1(dto.getAddressLine1());
        address.setAddressLine2(dto.getAddressLine2());
        address.setZipcode(dto.getZipcode());
        address.setPhone(dto.getPhone());
        address.setRequestMessage(dto.getRequestMessage());

        MemberAddress saved = addressService.addAddress(address);

        return ResponseEntity.ok(saved);
    }
    @PutMapping
    public ResponseEntity<MemberAddress> modifyAddress(
            @RequestBody MemberAddress memberAddress,
            @SessionAttribute(value = "loginUser",required = false) Member loginUser
    ){
        if(loginUser==null) return ResponseEntity.badRequest().build();
        MemberAddress address=addressService.modifyAddress(memberAddress);
        return ResponseEntity.ok(address);
    }


    //새로 추가한 기본배송지 변경 엔드포인트(PUT /api/address/default/{id})
    @PutMapping("/default/{id}")
    public ResponseEntity<?> setDefaultAddress(
            @PathVariable("id") Long addressId,
            @SessionAttribute(value = "loginUser", required = false) Member loginUser
    ) {
        if (loginUser == null) {
            return ResponseEntity.status(HttpStatus.UNAUTHORIZED).body("로그인이 필요합니다.");
        }

        boolean success = addressService.modifyDefaultAddress(loginUser.getMemberId(), addressId);
        if (success) {
            return ResponseEntity.ok().body("기본배송지로 변경되었습니다.");
        } else {
            return ResponseEntity.status(HttpStatus.BAD_REQUEST).body("기본배송지 변경에 실패했습니다.");
        }
    }


    //배송지 삭제
    @DeleteMapping("/{id}")
    public ResponseEntity<?> deleteAddress(
            @PathVariable Long id,
            @SessionAttribute(value = "loginUser", required = false) Member loginUser
    ) {
        if (loginUser == null) {
            return ResponseEntity.status(HttpStatus.UNAUTHORIZED).body("로그인이 필요합니다.");
        }

        boolean deleted = addressService.deleteAddress(id);
        if (!deleted) return ResponseEntity.badRequest().body("삭제 실패");

        return ResponseEntity.ok().build();
    }
}

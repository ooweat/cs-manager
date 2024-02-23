package kr.co.company.auth.domain;

import kr.co.company.common.domain.BaseTimeEntity;
import lombok.AccessLevel;
import lombok.Getter;
import lombok.NoArgsConstructor;

@Getter
@NoArgsConstructor(access = AccessLevel.PRIVATE)
public class Member extends BaseTimeEntity {
    
    private long seq;            //자동증가번호
    private String userId;            //id
    private String userPass;    //password
    private String userName;        //이름
    private String userPhone;        //연락처
    private int companySeq;        //회사 SEQ
    private String organization;    //부서
    private String userEmail;        //이메일
    private String userLevel;        //회원등급
    private String companyName;
    
    /*private boolean isFirstLogin = true;
    private String token;*/
    
    
    public Member(String userId, String userPass) {
        this.userId = userId;
        this.userPass = userPass;
    }
}

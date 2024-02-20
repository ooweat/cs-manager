package kr.co.company.auth.application.dto;

import lombok.Builder;
import lombok.Getter;

@Getter
public class LoginRequest {

    private String userId;
    private String userPass;
    
    public LoginRequest(final String userId, final String userPass) {
        this.userId = userId;
        this.userPass = userPass;
    }
}

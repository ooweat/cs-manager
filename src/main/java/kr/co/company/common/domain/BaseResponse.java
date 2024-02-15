package kr.co.company.common.domain;

import kr.co.company.common.ResponseCode;
import lombok.Getter;

@Getter
public class BaseResponse {
    private String code;
    private String message;
    private String description;
    
    public BaseResponse(ResponseCode responseCode) {
        this.code = responseCode.getCode();
        this.message = responseCode.getMessage();
        this.description = responseCode.getDescription();
    }
}

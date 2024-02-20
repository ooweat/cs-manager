package kr.co.company.cs.application.dto;

import lombok.Getter;

@Getter
public class SettingRequest {
    private int page;
    private String searchValue;
    
    public SettingRequest(final int page, final String searchValue) {
        this.page = page;
        this.searchValue = searchValue;
    }
}

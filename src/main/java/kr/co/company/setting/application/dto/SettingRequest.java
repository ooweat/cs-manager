package kr.co.company.setting.application.dto;

import lombok.Getter;

@Getter
public class SettingRequest {
    private int seq;
    private int page;
    private String searchValue;
    private String settingType;
    
    public SettingRequest(final int page, final String searchValue) {
        this.page = page;
        this.searchValue = searchValue;
    }
}

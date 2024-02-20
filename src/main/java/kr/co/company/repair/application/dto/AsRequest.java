package kr.co.company.repair.application.dto;

import lombok.Getter;

@Getter
public class AsRequest {
    
    private int page;
    private String searchType;
    private String searchValue;
    
    public AsRequest(final int page, final String searchType, final String searchValue) {
        this.page = page;
        this.searchType = searchType;
        this.searchValue = searchValue;
    }
}

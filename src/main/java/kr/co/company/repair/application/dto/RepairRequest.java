package kr.co.company.repair.application.dto;

import lombok.Getter;

@Getter
public class RepairRequest {
    
    private int page;
    private String searchType;
    private String searchValue;
    private String sDate;
    private String eDate;
    
    public RepairRequest(final int page, final String searchType, final String searchValue,
        String sDate, String eDate) {
        this.page = page;
        this.searchType = searchType;
        this.searchValue = searchValue;
        this.sDate = sDate+ " 00:00:00";
        this.eDate = eDate+ " 23:59:59";
    }
}

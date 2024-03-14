package kr.co.company.as.application.dto;

import lombok.Getter;

@Getter
public class AsRequest {
    
    private int page;
    private String searchType;
    private String searchValue;
    private String partnerGroup;
    private String progressGroup;
    private String sDate;
    private String eDate;
    private int ptnCompSeq;
    
    public AsRequest(final int page, final String searchType, final String searchValue,
        String sDate, String eDate, int ptnCompSeq) {
        this.page = page;
        this.searchType = searchType;
        this.searchValue = searchValue;
        this.sDate = sDate + " 00:00:00";
        this.eDate = eDate + " 23:59:59";
        this.ptnCompSeq = ptnCompSeq;
    }
}

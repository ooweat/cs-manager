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
        final String partnerGroup, final String progressGroup, final String sDate, final String eDate, final int ptnCompSeq) {
        this.page = page;
        this.searchType = searchType;
        this.searchValue = searchValue;
        this.partnerGroup = partnerGroup;
        this.progressGroup = progressGroup;
        this.sDate = sDate + " 00:00:00";
        this.eDate = eDate + " 23:59:59";
        this.ptnCompSeq = ptnCompSeq;
    }
}

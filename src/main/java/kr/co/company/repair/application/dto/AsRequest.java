package kr.co.company.repair.application.dto;

import java.util.Map;
import lombok.Builder;
import lombok.Getter;

@Getter
public class AsRequest {
    private int page;
    private String sDate;
    private String eDate;
    
    @Builder
    public AsRequest(final int page, final String sDate, final String eDate) {
        this.page = page;
        this.sDate = sDate;
        this.eDate = eDate;
    }
}

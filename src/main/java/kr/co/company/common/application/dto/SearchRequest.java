package kr.co.company.common.application.dto;

import lombok.Getter;

@Getter
public class SearchRequest {
    private String searchType;
    private String searchData;
    private String sDate;
    private String eDate;
}

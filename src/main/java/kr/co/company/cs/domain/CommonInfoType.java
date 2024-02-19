package kr.co.company.cs.domain;

import kr.co.company.common.domain.BaseTimeEntity;
import lombok.Getter;

@Getter
public class CommonInfoType extends BaseTimeEntity{
    private int seq;
    private String name;
    private String type;
    int page;
}

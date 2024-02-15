package kr.co.company.common.domain;

import java.time.LocalDateTime;
import lombok.Getter;

@Getter
public abstract class BaseTimeEntity {
    private LocalDateTime createDate;
    private LocalDateTime modifyDate;
}

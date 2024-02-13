package kr.co.company.common;

import java.time.LocalDateTime;
import lombok.Getter;

@Getter
public abstract class BaseTimeEntity {
    private LocalDateTime createDate;
    private LocalDateTime modifyDate;
}

package kr.co.company.repair.mappers;

import java.util.List;
import kr.co.company.repair.application.dto.AsRequest;
import kr.co.company.repair.domain.As;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface RepairMapper {
    List<As> findAllByDate(AsRequest asRequest);
}
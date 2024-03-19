package kr.co.company.repair.mappers;

import java.util.List;
import kr.co.company.as.domain.CommonInfoType;
import kr.co.company.repair.application.dto.RepairRequest;
import kr.co.company.as.domain.As;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface RepairMapper {
    List<As> findAllByRequest(RepairRequest repairRequest);
    As findRepairByAsNo(String asNo);
    boolean patchRepair(String asNo, As as);
    boolean createRepair(As as);
    boolean deleteRepair(String asNo);
    List<CommonInfoType> findTerminalModelCount(RepairRequest repairRequest);
    List<CommonInfoType> findErrorTop5(RepairRequest repairRequest);
}

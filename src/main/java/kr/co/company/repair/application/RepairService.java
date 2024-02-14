package kr.co.company.repair.application;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import kr.co.company.repair.application.dto.AsRequest;
import kr.co.company.repair.domain.As;
import kr.co.company.repair.mappers.RepairMapper;
import org.springframework.stereotype.Service;

@Service
public class RepairService {
    private final RepairMapper repairMapper;
    public RepairService(RepairMapper repairMapper){
        this.repairMapper = repairMapper;
    }
    public Map<String, Object> findAllByDate(AsRequest asRequest) {
        Map<String, Object> response = new HashMap<>();
        List<As> list = repairMapper.findAllByDate(asRequest);
        //Page<As> list = (Page<As>) repairMapper.findAllByDate(asRequest);
        //response.put("page", new PageNavigation((Page<?>) list));
        response.put("data", list);
        return response;
    }
}

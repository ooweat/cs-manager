package kr.co.company.as.application;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import kr.co.company.as.application.dto.AsRequest;
import kr.co.company.as.domain.CommonInfoType;
import kr.co.company.as.mappers.AsMapper;
import kr.co.company.repair.application.dto.RepairRequest;
import org.springframework.stereotype.Service;

@Service
public class AsService {
    
    private final AsMapper asMapper;
    
    public AsService(AsMapper asMapper) {
        this.asMapper = asMapper;
    }
    
    public Map<String, Object> findThisMonthAsCount(AsRequest asRequest) {
        Map<String, Object> response = new HashMap<>();
        List<CommonInfoType> list = asMapper.findThisMonthAsCount(
            String.valueOf(asRequest.getPtnCompSeq()));
        response.put("data", list);
        return response;
    }
    
}

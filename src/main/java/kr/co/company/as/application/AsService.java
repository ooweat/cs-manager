package kr.co.company.as.application;

import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import kr.co.company.as.application.dto.AsRequest;
import kr.co.company.as.domain.As;
import kr.co.company.as.domain.CommonInfoType;
import kr.co.company.as.mappers.AsMapper;
import kr.co.company.common.domain.PageNavigation;
import kr.co.company.repair.application.dto.RepairRequest;
import org.springframework.stereotype.Service;

@Service
public class AsService {
    
    private final AsMapper asMapper;
    
    public AsService(AsMapper asMapper) {
        this.asMapper = asMapper;
    }
    
    public Map<String, Object> findAsCount(AsRequest asRequest) {
        Map<String, Object> response = new HashMap<>();
        List<CommonInfoType> list = asMapper.findAsCount(
            String.valueOf(asRequest.getPtnCompSeq()));
        response.put("data", list);
        return response;
    }
    
    public Map<String, Object> findAsTop5(AsRequest asRequest) {
        Map<String, Object> response = new HashMap<>();
        List<As> list = asMapper.findAsTop5(String.valueOf(asRequest.getPtnCompSeq()));
        response.put("data", list);
        return response;
    }
    
    public Map<String, Object> findAllByRequest(AsRequest asRequest) {
        Map<String, Object> response = new HashMap<>();
        PageHelper.startPage(asRequest.getPage(), 10);
        Page<As> list = (Page<As>) asMapper.findAllByRequest(asRequest);
        response.put("page", new PageNavigation(list));
        response.put("data", list);
        return response;
    }
    
    public As findAsByAsNo(String asNo) {
        return asMapper.findAsByAsNo(asNo);
    }
}

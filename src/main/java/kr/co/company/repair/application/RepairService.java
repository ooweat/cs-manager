package kr.co.company.repair.application;

import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.HashMap;
import java.util.Map;
import kr.co.company.common.ResponseCode;
import kr.co.company.common.domain.BaseResponse;
import kr.co.company.common.domain.PageNavigation;
import kr.co.company.repair.application.dto.AsRequest;
import kr.co.company.repair.domain.As;
import kr.co.company.repair.mappers.RepairMapper;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
public class RepairService {
    
    private final RepairMapper repairMapper;
    
    public RepairService(RepairMapper repairMapper) {
        this.repairMapper = repairMapper;
    }
    
    public Map<String, Object> findAllByRequest(AsRequest asRequest) {
        Map<String, Object> response = new HashMap<>();
        PageHelper.startPage(asRequest.getPage(), 10);
        Page<As> list = (Page<As>) repairMapper.findAllByRequest(asRequest);
        response.put("page", new PageNavigation(list));
        response.put("data", list);
        return response;
    }
    
    public As findRepairByAsNo(String asNo) {
        return repairMapper.findRepairByAsNo(asNo);
    }
    
    public BaseResponse patchRepair(String asNo, As as) {
        if (repairMapper.patchRepair(asNo, as)) {
            return new BaseResponse(ResponseCode.SUCCESS_INSERT);
        } else {
            return new BaseResponse(ResponseCode.ERROR_INSERT);
        }
    }
    
    @Transactional
    public BaseResponse createRepair(As as) {
        As as2 = new As(makeAsNo(), as);
        System.out.println(as2.getAsNo());
        if (repairMapper.createRepair(as2)) {
            return new BaseResponse(ResponseCode.SUCCESS_INSERT);
        } else {
            return new BaseResponse(ResponseCode.ERROR_INSERT);
        }
    }
    
    //asNo: 연월일시분초 + 4자리 숫자
    private String makeAsNo() {
        return LocalDateTime.now()
            .format(DateTimeFormatter.ofPattern("yyMMddHHmmss"))
            +String.format("%04d", (int)(Math.random()*100) + 1);
    }
}

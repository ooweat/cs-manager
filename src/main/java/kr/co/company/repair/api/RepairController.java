package kr.co.company.repair.api;

import java.util.Map;
import kr.co.company.common.domain.BaseResponse;
import kr.co.company.repair.application.RepairService;
import kr.co.company.repair.application.dto.AsRequest;
import kr.co.company.repair.domain.As;
import lombok.extern.slf4j.Slf4j;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PatchMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@Slf4j
@RestController
@RequestMapping("/api/")
public class RepairController {
    
    private final RepairService repairService;
    
    public RepairController(final RepairService repairService) {
        this.repairService = repairService;
    }
    
    @GetMapping(value = "/repairs")
    public ResponseEntity<Map> repairs(AsRequest asRequest) {
        return ResponseEntity.ok(repairService.findAllByRequest(asRequest));
    }
    
    @PostMapping(value = "/repair", produces = MediaType.APPLICATION_JSON_VALUE, consumes = MediaType.APPLICATION_JSON_VALUE)
    public ResponseEntity<BaseResponse> createRepair(@RequestBody As as) {
        return ResponseEntity.ok(repairService.createRepair(as));
    }
    
    @PatchMapping(value = "/repairs/{asNo}", produces = MediaType.APPLICATION_JSON_VALUE, consumes = MediaType.APPLICATION_JSON_VALUE)
    public ResponseEntity<BaseResponse> patchRepair(@PathVariable final String asNo,
        @RequestBody As as) {
        return ResponseEntity.ok(repairService.patchRepair(asNo, as));
    }
    
    @GetMapping("/repairs/{asNo}")
    public ResponseEntity<As> findRepairByAsNo(@PathVariable final String asNo) {
        return ResponseEntity.ok(repairService.findRepairByAsNo(asNo));
    }
    
}

package kr.co.company.repair.api;

import java.io.IOException;
import java.util.Map;
import javax.servlet.http.HttpServletResponse;
import kr.co.company.as.domain.As;
import kr.co.company.common.domain.BaseResponse;
import kr.co.company.repair.application.RepairService;
import kr.co.company.repair.application.dto.RepairRequest;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PatchMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/api/")
public class RepairController {
    
    private final RepairService repairService;
    
    public RepairController(final RepairService repairService) {
        this.repairService = repairService;
    }
    
    @GetMapping(value = "/repairs")
    public ResponseEntity<Map> repairs(RepairRequest repairRequest) {
        System.out.println(repairRequest.getSDate());
        return ResponseEntity.ok(repairService.findAllByRequest(repairRequest));
    }
    
    @GetMapping("/repairs/{asNo}")
    public ResponseEntity<As> findRepairByAsNo(@PathVariable final String asNo) {
        return ResponseEntity.ok(repairService.findRepairByAsNo(asNo));
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
    
    @DeleteMapping("/repairs/{asNo}")
    public ResponseEntity<BaseResponse> deleteRepair(@PathVariable final String asNo) {
        return ResponseEntity.ok(repairService.deleteRepair(asNo));
    }
    
    @GetMapping("/repairs/excel")
    public void findAllCommonSettingsTypeExcel(RepairRequest repairRequest, HttpServletResponse response)
        throws IOException {
        repairService.findAllByRequestExcel(repairRequest, response);
    }
}

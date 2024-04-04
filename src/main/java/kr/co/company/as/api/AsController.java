package kr.co.company.as.api;

import java.util.Map;
import kr.co.company.as.application.AsService;
import kr.co.company.as.application.dto.AsRequest;
import kr.co.company.as.domain.As;
import kr.co.company.common.domain.BaseResponse;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PatchMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/api")
public class AsController {
    
    private final AsService asService;
    
    public AsController(final AsService asService) {
        this.asService = asService;
    }
    
    @GetMapping(value = "/aslist/as-count")
    public ResponseEntity<Map> findAsCount(AsRequest asRequest) {
        return ResponseEntity.ok(asService.findAsCount(asRequest));
    }
    
    @GetMapping(value = "/aslist/as-top5")
    public ResponseEntity<Map> findAsTop5(AsRequest asRequest) {
        return ResponseEntity.ok(asService.findAsTop5(asRequest));
    }
    
    @GetMapping(value = "/aslist")
    public ResponseEntity<Map> findAsList(AsRequest asRequest) {
        return ResponseEntity.ok(asService.findAsList(asRequest));
    }
    
    @GetMapping("/aslist/{asNo}")
    public ResponseEntity<As> findRepairByAsNo(@PathVariable final String asNo) {
        return ResponseEntity.ok(asService.findAsByAsNo(asNo));
    }
    
    @PatchMapping(value = "/aslist/{asNo}", produces = MediaType.APPLICATION_JSON_VALUE, consumes = MediaType.APPLICATION_JSON_VALUE)
    public ResponseEntity<BaseResponse> patchAs(@PathVariable final String asNo,
        @RequestBody As as) {
        return ResponseEntity.ok(asService.patchAs(asNo, as));
    }
    
    
    /*
    @GetMapping(value = "/partners/{ptnCompSeq}")
    public ResponseEntity<Map> findPartnerByCompSeq(@PathVariable final int ptnCompSeq) {
        return ResponseEntity.ok(asService.findPartnerByCompSeq(ptnCompSeq));
    }
    @GetMapping(value = "/after-sales")
    public ResponseEntity<Map> afterSales() {
        return ResponseEntity.ok(asService.findAllTermialModel());
    }
    
    @GetMapping("/terminal-models")
    public ResponseEntity<Map> terminalModels() {
        return ResponseEntity.ok(asService.findAllTermialModel());
    }
    
    @GetMapping("/revisions")
    public ResponseEntity<Map>  findAllRevision() {
        return ResponseEntity.ok(asService.findAllRevision());
    }
    
    @GetMapping("/errors/{errorType}")
    public ResponseEntity<Map> findAllError(@PathVariable final String errorType) {
        return ResponseEntity.ok(asService.findAllError(errorType));
    }
    
    @GetMapping("/companys")
    public ResponseEntity<Map> findAllCompany() {
        return ResponseEntity.ok(asService.findAllCompany());
    }
    
    @GetMapping("/settings")
    public ResponseEntity<Map> findAllCommonSettingsType(SettingRequest settingRequest) {
        return ResponseEntity.ok(asService.findAllAs(settingRequest));
    }
    
    @PostMapping(value = "/setting", produces = MediaType.APPLICATION_JSON_VALUE, consumes = MediaType.APPLICATION_JSON_VALUE)
    public ResponseEntity<BaseResponse> createSetting(@RequestBody CommonInfoType commonInfoType) {
        return ResponseEntity.ok(asService.createSetting(commonInfoType));
    }*/
}

package kr.co.company.as.api;

import java.util.Map;
import kr.co.company.as.application.AsService;
import kr.co.company.as.application.dto.AsRequest;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/api")
public class AsController {
    
    private final AsService asService;
    
    public AsController(final AsService asService) {
        this.asService = asService;
    }
    
    @GetMapping(value = "/as/as-count")
    public ResponseEntity<Map> findThisMonthAsCount(AsRequest asRequest) {
        return ResponseEntity.ok(asService.findThisMonthAsCount(asRequest));
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

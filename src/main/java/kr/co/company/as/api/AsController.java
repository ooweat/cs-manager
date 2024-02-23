package kr.co.company.as.api;

import java.util.Map;
import kr.co.company.common.domain.BaseResponse;
import kr.co.company.as.application.AsService;
import kr.co.company.as.application.dto.SettingRequest;
import kr.co.company.as.domain.CommonInfoType;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/api/as")
public class AsController {
    
    private final AsService asService;
    
    public AsController(final AsService asService) {
        this.asService = asService;
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

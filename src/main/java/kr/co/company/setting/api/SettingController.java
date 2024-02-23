package kr.co.company.setting.api;

import java.util.Map;
import kr.co.company.as.application.dto.SettingRequest;
import kr.co.company.setting.application.SettingService;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/api/settings")
public class SettingController {
    private final SettingService settingService;
    
    public SettingController(final SettingService settingService) {
        this.settingService = settingService;
    }
    
    @GetMapping(value = "/users")
    public ResponseEntity<Map> findAllUser(SettingRequest settingRequest) {
        return ResponseEntity.ok(settingService.findAllUsers(settingRequest));
    }
    
    @GetMapping(value = "/after-services")
    public ResponseEntity<Map> findAllAs(SettingRequest settingRequest) {
        return ResponseEntity.ok(settingService.findAllAs(settingRequest));
    }
    
    @GetMapping(value = "/repairs")
    public ResponseEntity<Map> findAllRepair(SettingRequest settingRequest) {
        return ResponseEntity.ok(settingService.findAllRepairs(settingRequest));
    }
    
    @GetMapping(value = "/partners/{ptnCompSeq}")
    public ResponseEntity<Map> findPartnerByCompSeq(@PathVariable final int ptnCompSeq) {
        return ResponseEntity.ok(settingService.findPartnerByCompSeq(ptnCompSeq));
    }
    
    @GetMapping(value = "/as")
    public ResponseEntity<Map> afterSales() {
        return ResponseEntity.ok(settingService.findAllTermialModel());
    }
    
    @GetMapping("/terminal-models")
    public ResponseEntity<Map> terminalModels() {
        return ResponseEntity.ok(settingService.findAllTermialModel());
    }
    
    @GetMapping("/revisions")
    public ResponseEntity<Map> findAllRevision() {
        return ResponseEntity.ok(settingService.findAllRevision());
    }
    
    @GetMapping("/errors/{errorType}")
    public ResponseEntity<Map> findAllError(@PathVariable final String errorType) {
        return ResponseEntity.ok(settingService.findAllError(errorType));
    }
    
    @GetMapping("/companys")
    public ResponseEntity<Map> findAllCompany() {
        return ResponseEntity.ok(settingService.findAllCompany());
    }
}

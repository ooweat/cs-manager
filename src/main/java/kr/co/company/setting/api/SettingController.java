package kr.co.company.setting.api;

import java.util.Map;
import kr.co.company.as.domain.CommonInfoType;
import kr.co.company.common.domain.BaseResponse;
import kr.co.company.setting.application.SettingService;
import kr.co.company.setting.application.dto.SettingRequest;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
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
    public ResponseEntity<Map> findPartnerByCompSeq(@PathVariable final String ptnCompSeq) {
        return ResponseEntity.ok(settingService.findPartnerByCompSeq(ptnCompSeq));
    }
    
    @GetMapping(value = "/asStatus/{userLevel}/{ptnCompSeq}")
    public ResponseEntity<Map> findStatusByCompSeq(@PathVariable final String userLevel, @PathVariable final String ptnCompSeq) {
        return ResponseEntity.ok(settingService.findStatusByCompSeq(userLevel, ptnCompSeq));
    }
    
    @GetMapping("/terminal-models")
    public ResponseEntity<Map> findAllTerminalModel() {
        return ResponseEntity.ok(settingService.findAllTerminalModel());
    }

    @GetMapping("/troubles")
    public ResponseEntity<Map> findAllTrouble() {
        return ResponseEntity.ok(settingService.findAllTrouble());
    }
    
    @GetMapping("/realTroubles")
    public ResponseEntity<Map> findAllRealTrouble() {
        return ResponseEntity.ok(settingService.findAllRealTrouble());
    }
    
    @GetMapping("/actionTroubles")
    public ResponseEntity<Map> findAllActionTrouble() {
        return ResponseEntity.ok(settingService.findAllActionTrouble());
    }
    
    @GetMapping("/vm-models")
    public ResponseEntity<Map> findAllVmModel() {
        return ResponseEntity.ok(settingService.findAllVmModel());
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
    
    @PostMapping(produces = MediaType.APPLICATION_JSON_VALUE, consumes = MediaType.APPLICATION_JSON_VALUE)
    public ResponseEntity<BaseResponse> createSetting(@RequestBody CommonInfoType commonInfoType) {
        return ResponseEntity.ok(settingService.createSetting(commonInfoType));
    }
    
    @DeleteMapping(produces = MediaType.APPLICATION_JSON_VALUE, consumes = MediaType.APPLICATION_JSON_VALUE)
    public ResponseEntity<BaseResponse> deleteSetting(@RequestBody SettingRequest settingRequest) {
        return ResponseEntity.ok(settingService.deleteSetting(settingRequest));
    }

    /*@GetMapping("/syncCompany")
    public ResponseEntity<Map> voidSyncCompany() {
        return ResponseEntity.ok(settingService.syncCompany());
    }*/
}

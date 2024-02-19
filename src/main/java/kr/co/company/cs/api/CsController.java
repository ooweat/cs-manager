package kr.co.company.cs.api;

import java.util.Map;
import kr.co.company.common.domain.BaseResponse;
import kr.co.company.cs.application.CsService;
import kr.co.company.cs.domain.CommonInfoType;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/api/cs")
public class CsController {
    
    private final CsService csService;
    
    public CsController(final CsService csService) {
        this.csService = csService;
    }
    
    @GetMapping("/terminal-models")
    public ResponseEntity<Map> terminalModels() {
        return ResponseEntity.ok(csService.findAllTermialModel());
    }
    
    @GetMapping("/revisions")
    public ResponseEntity<Map>  findAllRevision() {
        return ResponseEntity.ok(csService.findAllRevision());
    }
    
    @GetMapping("/errors")
    public ResponseEntity<Map> findAllError() {
        return ResponseEntity.ok(csService.findAllError());
    }
    
    @GetMapping("/companys")
    public ResponseEntity<Map> findAllCompany() {
        return ResponseEntity.ok(csService.findAllCompany());
    }
    
    @GetMapping("/settings")
    public ResponseEntity<Map> findAllCommonSettingsType() {
        return ResponseEntity.ok(csService.findAllCommonSettingsType());
    }
    
    @GetMapping("/settings/{name}")
    public ResponseEntity<Map> findCommonSettingsTypeByName(@PathVariable final String name) {
        return ResponseEntity.ok(csService.findCommonSettingsTypeByName(name));
    }
    
    @PostMapping(value = "/setting", produces = MediaType.APPLICATION_JSON_VALUE, consumes = MediaType.APPLICATION_JSON_VALUE)
    public ResponseEntity<BaseResponse> createSetting(@RequestBody CommonInfoType commonInfoType) {
        return ResponseEntity.ok(csService.createSetting(commonInfoType));
    }
    /*
    *     @PostMapping(value = "/repair", produces = MediaType.APPLICATION_JSON_VALUE, consumes = MediaType.APPLICATION_JSON_VALUE)
    public ResponseEntity<BaseResponse> createRepair(@RequestBody As as) {
        return ResponseEntity.ok(repairService.createRepair(as));
    }
    *
    * */
}

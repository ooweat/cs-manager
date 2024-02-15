package kr.co.company.cs.api;

import java.util.Map;
import kr.co.company.cs.application.CsService;
import kr.co.company.repair.application.RepairService;
import kr.co.company.repair.application.dto.AsRequest;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/api/cs")
public class CsController {
    private final CsService csService;
    
    public CsController(final CsService csService){
        this.csService = csService;
    }
    
    @GetMapping("/terminal-models")
    public Map<String, Object> terminalModels(){
        return csService.findAllTermialModel();
    }
    
    @GetMapping("/revisions")
    public Map<String, Object> findAllByRevisionType(){
        return csService.findAllByRevisionType();
    }
    
    @GetMapping("/errors")
    public Map<String, Object> findAllByErrorType(){
        return csService.findAllByErrorType();
    }
}

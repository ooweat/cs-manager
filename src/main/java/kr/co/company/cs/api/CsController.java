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
    //애자일 모델 추상화를 위해 Dto 생략 후, Model로 다이렉트 처리
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
}

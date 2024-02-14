package kr.co.company.cs.application;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import kr.co.company.cs.domain.SeqName;
import kr.co.company.cs.mappers.CsMapper;
import org.springframework.stereotype.Service;

@Service
public class CsService {
    
    private final CsMapper csMapper;
    
    public CsService(CsMapper csMapper) {
        this.csMapper = csMapper;
    }
    
    public Map<String, Object> findAllTermialModel() {
        Map<String, Object> response = new HashMap<>();
        List<SeqName> list = csMapper.findAllTermialModel();
        response.put("data", list);
        return response;
    }
    
    public Map<String, Object> findAllByRevisionType() {
        Map<String, Object> response = new HashMap<>();
        List<SeqName> list = csMapper.findAllByRevisionType();
        response.put("data", list);
        return response;
    }
}

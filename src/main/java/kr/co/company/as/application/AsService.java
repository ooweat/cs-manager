package kr.co.company.as.application;

import kr.co.company.as.mappers.AsMapper;
import org.springframework.stereotype.Service;

@Service
public class AsService {
    
    private final AsMapper asMapper;
    
    public AsService(AsMapper asMapper) {
        this.asMapper = asMapper;
    }
    
}

package kr.co.company.cs.application;

import com.github.pagehelper.Page;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import kr.co.company.common.ResponseCode;
import kr.co.company.common.domain.BaseResponse;
import kr.co.company.common.domain.PageNavigation;
import kr.co.company.cs.domain.CommonInfoType;
import kr.co.company.cs.mappers.CsMapper;
import kr.co.company.repair.domain.As;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
public class CsService {
    
    private final CsMapper csMapper;
    
    public CsService(CsMapper csMapper) {
        this.csMapper = csMapper;
    }
    
    public Map<String, Object> findAllTermialModel() {
        Map<String, Object> response = new HashMap<>();
        List<CommonInfoType> list = csMapper.findAllTermialModel();
        response.put("data", list);
        return response;
    }
    
    public Map<String, Object> findAllRevision() {
        Map<String, Object> response = new HashMap<>();
        List<CommonInfoType> list = csMapper.findAllRevision();
        response.put("data", list);
        return response;
    }
    
    public Map<String, Object> findAllError() {
        Map<String, Object> response = new HashMap<>();
        List<CommonInfoType> list = csMapper.findAllError();
        response.put("data", list);
        return response;
    }
    
    public Map<String, Object> findAllCompany() {
        Map<String, Object> response = new HashMap<>();
        List<CommonInfoType> list = csMapper.findAllCompany();
        response.put("data", list);
        return response;
    }
    
    public Map<String, Object> findAllCommonSettingsType() {
        Map<String, Object> response = new HashMap<>();
        List<CommonInfoType> list = csMapper.findAllCommonSettingsType();
        //Page<CommonInfoType> list = (Page<CommonInfoType>) csMapper.findAllCommonSettingsType();
        response.put("data", list);
        //response.put("data", new PageNavigation(list));
        return response;
    }
    
    public Map<String, Object> findCommonSettingsTypeByName(String name) {
        Map<String, Object> response = new HashMap<>();
        List<CommonInfoType> list = csMapper.findCommonSettingsTypeByName(name);
        //Page<CommonInfoType> list = (Page<CommonInfoType>) csMapper.findCommonSettingsTypeByName();
        response.put("data", list);
        //response.put("data", new PageNavigation(list));
        return response;
    }
    
    @Transactional
    public BaseResponse createSetting(CommonInfoType commonInfoType) {
        if (csMapper.createSetting(commonInfoType)) {
            return new BaseResponse(ResponseCode.SUCCESS_INSERT);
        } else {
            return new BaseResponse(ResponseCode.ERROR_INSERT);
        }
    }
}

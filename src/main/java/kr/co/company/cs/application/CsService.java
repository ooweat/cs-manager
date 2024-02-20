package kr.co.company.cs.application;

import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import kr.co.company.common.ResponseCode;
import kr.co.company.common.domain.BaseResponse;
import kr.co.company.common.domain.PageNavigation;
import kr.co.company.cs.application.dto.SettingRequest;
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
    
    public Map<String, Object> findAllCommonSettingsType(SettingRequest settingRequest) {
        Map<String, Object> response = new HashMap<>();
        PageHelper.startPage(settingRequest.getPage(), 10);
        Page<CommonInfoType> list = (Page<CommonInfoType>) csMapper.findAllCommonSettingsType(settingRequest);
        response.put("page", new PageNavigation(list));
        response.put("data", list);
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

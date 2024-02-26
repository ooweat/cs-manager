package kr.co.company.setting.application;

import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import kr.co.company.setting.application.dto.SettingRequest;
import kr.co.company.as.domain.CommonInfoType;
import kr.co.company.auth.domain.Member;
import kr.co.company.common.ResponseCode;
import kr.co.company.common.domain.BaseResponse;
import kr.co.company.common.domain.PageNavigation;
import kr.co.company.setting.mappers.SettingMapper;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
public class SettingService {
    
    private final SettingMapper settingMapper;
    
    public SettingService(SettingMapper settingMapper) {
        this.settingMapper = settingMapper;
    }
    
    public Map<String, Object> findPartnerByCompSeq(int ptnCompSeq) {
        Map<String, Object> response = new HashMap<>();
        List<CommonInfoType> list = settingMapper.findPartnerByCompSeq(String.valueOf(ptnCompSeq));
        response.put("data", list);
        return response;
    }
    
    public Map<String, Object> findAllTerminalModel() {
        Map<String, Object> response = new HashMap<>();
        List<CommonInfoType> list = settingMapper.findAllTerminalModel();
        response.put("data", list);
        return response;
    }
    
    public Map<String, Object> findAllRevision() {
        Map<String, Object> response = new HashMap<>();
        List<CommonInfoType> list = settingMapper.findAllRevision();
        response.put("data", list);
        return response;
    }
    
    public Map<String, Object> findAllError(String errorType) {
        Map<String, Object> response = new HashMap<>();
        List<CommonInfoType> list = settingMapper.findAllError(errorType);
        response.put("data", list);
        return response;
    }
    
    public Map<String, Object> findAllCompany() {
        Map<String, Object> response = new HashMap<>();
        List<CommonInfoType> list = settingMapper.findAllCompany();
        response.put("data", list);
        return response;
    }
    
    public Map<String, Object> findAllAs(SettingRequest settingRequest) {
        Map<String, Object> response = new HashMap<>();
        PageHelper.startPage(settingRequest.getPage(), 10);
        Page<CommonInfoType> list = (Page<CommonInfoType>) settingMapper.findAllAs(
            settingRequest);
        response.put("page", new PageNavigation(list));
        response.put("data", list);
        return response;
    }
    
    public Map<String, Object> findAllUsers(SettingRequest settingRequest) {
        Map<String, Object> response = new HashMap<>();
        PageHelper.startPage(settingRequest.getPage(), 10);
        Page<Member> list = (Page<Member>) settingMapper.findAllUsers(
            settingRequest);
        response.put("page", new PageNavigation(list));
        response.put("data", list);
        return response;
    }
    
    public Map<String, Object> findAllRepairs(SettingRequest settingRequest) {
        Map<String, Object> response = new HashMap<>();
        PageHelper.startPage(settingRequest.getPage(), 10);
        Page<CommonInfoType> list = (Page<CommonInfoType>) settingMapper.findAllRepairs(
            settingRequest);
        response.put("page", new PageNavigation(list));
        response.put("data", list);
        return response;
    }
    
    @Transactional
    public BaseResponse createSetting(CommonInfoType commonInfoType) {
        if (settingMapper.createSetting(commonInfoType)) {
            return new BaseResponse(ResponseCode.SUCCESS_INSERT);
        } else {
            return new BaseResponse(ResponseCode.ERROR_INSERT);
        }
    }
}

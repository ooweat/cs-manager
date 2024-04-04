package kr.co.company.setting.application;

import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import kr.co.company.as.domain.CommonInfoType;
import kr.co.company.auth.domain.Member;
import kr.co.company.common.ResponseCode;
import kr.co.company.common.domain.BaseResponse;
import kr.co.company.common.domain.PageNavigation;
import kr.co.company.setting.application.dto.ProgressStatus;
import kr.co.company.setting.application.dto.SettingRequest;
import kr.co.company.setting.mappers.SettingMapper;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
public class SettingService {
    
    private final SettingMapper settingMapper;
    
    public SettingService(SettingMapper settingMapper) {
        this.settingMapper = settingMapper;
    }
    
    public Map<String, Object> findPartnerByCompSeq(String ptnCompSeq) {
        Map<String, Object> response = new HashMap<>();
        List<CommonInfoType> list = settingMapper.findPartnerByCompSeq(ptnCompSeq);
        response.put("data", list);
        return response;
    }
    
    public Map<String, Object> findAllTerminalModel() {
        Map<String, Object> response = new HashMap<>();
        List<CommonInfoType> list = settingMapper.findAllTerminalModel();
        response.put("data", list);
        return response;
    }
    
    
    public Map<String, Object> findAllVmModel() {
        Map<String, Object> response = new HashMap<>();
        List<CommonInfoType> list = settingMapper.findAllVmModel();
        response.put("data", list);
        return response;
    }
    
    public Map<String, Object> findAllRealTrouble() {
        Map<String, Object> response = new HashMap<>();
        List<CommonInfoType> list = settingMapper.findAllRealTrouble();
        response.put("data", list);
        return response;
    }
    
    public Map<String, Object> findAllActionTrouble() {
        Map<String, Object> response = new HashMap<>();
        List<CommonInfoType> list = settingMapper.findAllActionTrouble();
        response.put("data", list);
        return response;
    }
    
    public Map<String, Object> findAllTrouble() {
        Map<String, Object> response = new HashMap<>();
        List<CommonInfoType> list = settingMapper.findAllTrouble();
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
    
    @Transactional
    public BaseResponse deleteSetting(SettingRequest settingRequest) {
        if (settingMapper.deleteSetting(settingRequest)) {
            return new BaseResponse(ResponseCode.SUCCESS_REQUEST);
        } else {
            return new BaseResponse(ResponseCode.ERROR_REQUEST);
        }
    }
    
    public Map<String, Object> findStatusByCompSeq(String userLevel, String ptnCompSeq) {
    
        Map<String, Object> response = new HashMap<>();
        PageHelper.startPage(1, 10);
        Page<CommonInfoType> list = (Page<CommonInfoType>) settingMapper.findStatusByCompSeq(
            userLevel, ptnCompSeq);
        response.put("page", new PageNavigation(list));
        response.put("data", list);
        
        SettingRequest settingRequest;
        
        /*boolean isOP = userLevel.equals("OP");
        for (int i = isOP ? 4 : 1; i <= (isOP ? 6 : ProgressStatus.values().length); i++) {
            settingRequest = new SettingRequest(ProgressStatus.valueOf("PROGRESS" + i).getStep(),
                ProgressStatus.valueOf("PROGRESS" + i).getStatus());
            list.add(settingRequest);
        }
        
        //NOTE: 접수취소의 Progress 가 sort 상 마지막으로 위치해 별도로 추가
        if (isOP) {
            settingRequest = new SettingRequest(ProgressStatus.valueOf("PROGRESS" + 8).getStep(),
                ProgressStatus.valueOf("PROGRESS" + 8).getStatus());
            list.add(settingRequest);
        }*/
        
        response.put("data", list);
        return response;
    }
}

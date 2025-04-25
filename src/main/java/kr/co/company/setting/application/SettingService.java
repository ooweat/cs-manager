package kr.co.company.setting.application;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
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
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.util.UriComponents;
import org.springframework.web.util.UriComponentsBuilder;

@Service
public class SettingService {
    
    private final SettingMapper settingMapper;
    
    public SettingService(SettingMapper settingMapper) {
        this.settingMapper = settingMapper;
    }
    
    public Map<String, Object> findPartnerByCompSeq(String ptnCompSeq) {
        Map<String, Object> response = new HashMap<>();
        System.out.println(ptnCompSeq);

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

    /*public Map syncCompany() {

        //LogAspect.logger.info(LogAspect.logMsg + "사업자정보 동기화");

      		String reqUrl = "http://order.ubcn.co.kr/ordcomp/list.do";
      		int syncCount = 0;
      		int dupCount = 0;

      		// URL 한글인코딩
      		HttpURLConnection conn = null;
      		JSONObject jsonObj = null;
      		UriComponents uriComponents = UriComponentsBuilder.fromHttpUrl(reqUrl).build();

      		// 결과리스트
      		List<OrdCompanyDto> resultList = new ArrayList<>();

      		try {
      			URL url = new URL(uriComponents.encode().toString());
      			conn = (HttpURLConnection) url.openConnection();
      			conn.setRequestMethod("POST");
      			conn.setConnectTimeout(5000);
      			conn.setRequestProperty("Content-Type","application/json;charset=UTF-8");

      			// 결과
      			if(conn.getResponseCode() == 200) {
      				StringBuilder sb = new StringBuilder();
      				String line = "";

      				try{
      					InputStreamReader ir = new InputStreamReader(conn.getInputStream(),"UTF-8");
      					BufferedReader br = new BufferedReader(ir);

      					while( (line = br.readLine()) != null) {
      						sb.append(line);
      					}

      					// 추출
      					JSONParser jsonParser = new JSONParser();
      					jsonObj = (JSONObject) jsonParser.parse(sb.toString());
      					JSONArray resultArray = (JSONArray) jsonObj.get("result");

      					for(int i=0; i<resultArray.size(); i++) {
      						JSONObject resultObj = (JSONObject) resultArray.get(i);

      						// JSONObject to DTO Mapping
      						ObjectMapper mapper = new ObjectMapper();
      						OrdCompanyDto model = mapper.readValue(resultObj.toJSONString(),OrdCompanyDto.class);
      						resultList.add(model);
      					}


      				}catch (Exception e) {
      					// TODO: handle exception
      					return false;
      				}
      			}else{
      				//LogAspect.logger.info(LogAspect.logMsg + "[ERROR] API 요청오류");
      				return false;
      			}
      		}catch (Exception e) {
      			// TODO: handle exception
      			return false;
      		} finally {
      			conn.disconnect();
      		}

      		List<String> findCompany = boardDao.companyAll();

      		*//** 데이터 비교
      			1. 업체명+BIZ 등록여부 체크
      				1) 존재 > 사업자번호 체크
      					catch	------- 이미 등록된 정보(패스)
      					miss	------- 신규등록
      				2) 없음 > 신규등록
      		**//*
      		for(OrdCompanyDto o : resultList) {

      			String value = o.getCOMP_NM()+o.getBIZ_NO();
      			if(!findCompany.contains(value)) {
      				//LogAspect.logger.info(LogAspect.logMsg + o.getCOMP_NM() + "," + o.getBIZ_NO() + "	> 미등록 사업자정보,등록가능!!");

      				List<CompanyDto> companys = boardDao.companyBizno(o.getBIZ_NO());

      				if(companys.size() == 0) {
      					// 등록
      					int check = boardDao.company_sync(o.getCOMP_NM(),o.getBIZ_NO());
      					if(check == 1) {
      						//LogAspect.logger.info(LogAspect.logMsg + "등록완료");
      						syncCount++;
      					}
      //					syncCount++;
      				}else{
      					//LogAspect.logger.info(LogAspect.logMsg + "		> 사업자정보 중복,등록불가 XXXXXX");
      					dupCount++;
      				}
      			}else{
      				dupCount++;
      			}
      		}

      		//LogAspect.logger.info(LogAspect.logMsg + "동기화 완료,작업 건수 : " + syncCount + ",이미 등록된 건수 : " + dupCount);

      		return true;
    }*/
}

package kr.co.company.setting.mappers;

import java.util.List;
import kr.co.company.setting.application.dto.SettingRequest;
import kr.co.company.as.domain.CommonInfoType;
import kr.co.company.auth.domain.Member;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface SettingMapper {
    List<CommonInfoType> findPartnerByCompSeq(String ptnCompSeq);
    List<CommonInfoType> findStatusByCompSeq(String userLevel, String ptnCompSeq);
    List<CommonInfoType> findAllTerminalModel();
    List<CommonInfoType> findAllVmModel();
    List<CommonInfoType> findAllTrouble();
    List<CommonInfoType> findAllRealTrouble();
    List<CommonInfoType> findAllActionTrouble();
    List<CommonInfoType> findAllRevision();
    List<CommonInfoType> findAllError(String errorType);
    List<CommonInfoType> findAllCompany();
    List<Member> findAllUsers(SettingRequest searchRequest);
    List<CommonInfoType> findAllAs(SettingRequest searchRequest);
    List<CommonInfoType> findAllRepairs(SettingRequest searchRequest);
    boolean createSetting(CommonInfoType commonInfoType);
    boolean deleteSetting(SettingRequest settingRequest);
}

package kr.co.company.cs.mappers;

import java.util.List;
import kr.co.company.cs.domain.CommonInfoType;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface CsMapper {
    List<CommonInfoType> findAllTermialModel();
    List<CommonInfoType> findAllRevision();
    List<CommonInfoType> findAllError();
    List<CommonInfoType> findAllCompany();
    List<CommonInfoType> findAllCommonSettingsType();
    List<CommonInfoType> findCommonSettingsTypeByName(String name);
    boolean createSetting(CommonInfoType commonInfoType);
}

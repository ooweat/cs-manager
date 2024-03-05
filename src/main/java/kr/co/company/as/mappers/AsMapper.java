package kr.co.company.as.mappers;

import java.util.List;
import kr.co.company.as.domain.CommonInfoType;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface AsMapper {
    
    List<CommonInfoType> findThisMonthAsCount(String ptnCompSeq);
}

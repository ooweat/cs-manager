package kr.co.company.as.mappers;

import java.util.List;
import kr.co.company.as.application.dto.AsRequest;
import kr.co.company.as.domain.As;
import kr.co.company.as.domain.CommonInfoType;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface AsMapper {
    
    List<CommonInfoType> findAsCount(String ptnCompSeq);
    List<As> findAsTop5(String ptnCompSeq);
    
    List<As> findAsList(AsRequest asRequest);
    
    As findAsByAsNo(String asNo);
    
    boolean patchAs(String asNo, As as);
}

package kr.co.company.cs.mappers;

import java.util.List;
import kr.co.company.cs.domain.SeqName;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface CsMapper {
    List<SeqName> findAllTermialModel();
    List<SeqName> findAllByRevisionType();
}

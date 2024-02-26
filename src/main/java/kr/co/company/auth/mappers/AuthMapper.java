package kr.co.company.auth.mappers;

import kr.co.company.auth.domain.Member;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface AuthMapper {
    Member findAllByMember(String userId, String userPass);
    boolean findByUserId(String userId);
    void save(Member member);
    boolean createUser(Member member);
}

package kr.co.company.auth.application;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import kr.co.company.auth.application.dto.LoginRequest;
import kr.co.company.auth.domain.Member;
import kr.co.company.auth.mappers.AuthMapper;
import kr.co.company.common.BaseResponse;
import kr.co.company.common.ResponseCode;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
public class AuthService {
    
    private final AuthMapper authMapper;
    
    public AuthService(AuthMapper authMapper) {
        this.authMapper = authMapper;
    }
    
    @Transactional
    public void save(Member member) throws Exception {
        if (authMapper.findByUserId(member.getUserId())) {
            throw new Exception("이미 존재하는 아이디입니다.");
        }
        
        authMapper.save(member);
    }
    
    public BaseResponse login(LoginRequest loginRequest, HttpSession session) {
        Member member = authMapper.findAllByMember(loginRequest.getUserId(),
            loginRequest.getUserPass());
        if (member != null) {
            session.setAttribute("member", member);
            return new BaseResponse(ResponseCode.SUCCESS_LOGIN);
        } else {
            session.invalidate();
            return new BaseResponse(ResponseCode.FAIL_LOGIN);
        }
    }
}

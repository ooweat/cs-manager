package kr.co.company.auth.application;

import javax.servlet.http.HttpSession;
import kr.co.company.auth.application.dto.LoginRequest;
import kr.co.company.auth.domain.Member;
import kr.co.company.auth.mappers.AuthMapper;
import kr.co.company.common.domain.BaseResponse;
import kr.co.company.common.ResponseCode;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
public class AuthService {
    
    private final AuthMapper authMapper;
    
    public AuthService(AuthMapper authMapper) {
        this.authMapper = authMapper;
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
    
    @Transactional
    public BaseResponse createUser(Member member) {
        if (authMapper.findByUserId(member.getUserId())) {
            return new BaseResponse(ResponseCode.ALREADY_DATA);
        }
        
        if (authMapper.createUser(member)) {
            return new BaseResponse(ResponseCode.SUCCESS_INSERT);
        } else {
            return new BaseResponse(ResponseCode.ERROR_INSERT);
        }
    }
}

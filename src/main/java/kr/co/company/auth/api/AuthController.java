package kr.co.company.auth.api;

import javax.servlet.http.HttpSession;
import kr.co.company.auth.application.AuthService;
import kr.co.company.auth.application.dto.LoginRequest;
import kr.co.company.auth.domain.Member;
import kr.co.company.common.domain.BaseResponse;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/api/auth")
public class AuthController {
    
    private final AuthService authService;
    
    public AuthController(final AuthService authService) {
        this.authService = authService;
    }
    
    @PostMapping(value = "/loginConfirm", consumes = MediaType.APPLICATION_JSON_VALUE, produces = MediaType.APPLICATION_JSON_VALUE)
    public ResponseEntity<BaseResponse> login(@RequestBody LoginRequest loginRequest, HttpSession session) {
        try {
            return ResponseEntity.ok(authService.login(loginRequest, session));
        } catch (Exception e) {
            e.printStackTrace();
            return ResponseEntity.badRequest().build();
        }
    }

    @PostMapping(value="/users",produces = MediaType.APPLICATION_JSON_VALUE, consumes = MediaType.APPLICATION_JSON_VALUE)
    public ResponseEntity<BaseResponse> createUser(@RequestBody Member member) {
        return ResponseEntity.ok(authService.createUser(member));
    }
}

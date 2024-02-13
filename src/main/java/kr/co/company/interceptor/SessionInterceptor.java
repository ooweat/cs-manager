package kr.co.company.interceptor;

import java.util.Arrays;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import lombok.extern.slf4j.Slf4j;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

@Slf4j
public class SessionInterceptor implements HandlerInterceptor {
    
    public List allowList = Arrays.asList("/assets/**", "/static/**", "/resources/**", "/login");
    @Override
    public boolean preHandle(HttpServletRequest request,
        HttpServletResponse response, Object handler) throws Exception {
        
        if(request.getRequestURL().toString().contains("login")){
            return true;
        }
        if ((String) request.getSession().getAttribute("userId") != null) {
            return true;
        } else {
/*            String destUri = request.getRequestURI();
            String destQuery = request.getQueryString();
            String dest = (destQuery == null) ? destUri : destUri + "?" + destQuery;
            request.getSession().setAttribute("dest", dest);*/
            
            response.sendRedirect("/login");
            return false;
        }
    }
    
    @Override
    public void postHandle(HttpServletRequest request,
        HttpServletResponse response, Object handler, ModelAndView modelAndView) throws Exception {
        
    }
    
    @Override
    public void afterCompletion(HttpServletRequest request,
        HttpServletResponse response, Object handler, Exception ex) throws Exception {
        
    }
}

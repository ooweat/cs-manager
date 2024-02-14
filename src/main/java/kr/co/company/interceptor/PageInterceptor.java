package kr.co.company.interceptor;

import com.github.pagehelper.PageHelper;
import java.util.Arrays;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import lombok.extern.slf4j.Slf4j;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

@Slf4j
public class PageInterceptor implements HandlerInterceptor {
    
    public List activeList = Arrays.asList("/repairs");
    public List allowList = Arrays.asList("/assets/**", "/static/**", "/resources/**", "/login", "/dashboard");
    @Override
    public boolean preHandle(HttpServletRequest request,
        HttpServletResponse response, Object handler) throws Exception {
        String page = request.getParameter("page");
        if (page == null || page == "") {
            page = "1";
        }
        PageHelper.startPage(Integer.parseInt(page), 10);
        return HandlerInterceptor.super.preHandle(request, response, handler);
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

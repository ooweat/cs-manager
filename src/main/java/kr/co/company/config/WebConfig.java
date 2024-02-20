package kr.co.company.config;

import kr.co.company.interceptor.PageInterceptor;
import kr.co.company.interceptor.SessionInterceptor;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.config.annotation.CorsRegistry;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

@Configuration
public class WebConfig implements WebMvcConfigurer {
    //TODO: 확장성을 염두에 두고 * 모든 접근
    @Override
    public void addResourceHandlers(ResourceHandlerRegistry registry) {
        registry.addResourceHandler("/webjars/**").addResourceLocations("classpath:/static/webjars/",
                "classpath:/META-INFwebjars/");
        registry.addResourceHandler("/**").addResourceLocations("classpath:/static/", "classpath:/META-INF");
    }

    @Override
    public void addCorsMappings(CorsRegistry registry) {
        registry.addMapping("/**")
                .allowedOrigins("*")
                .allowedMethods("*")
                .maxAge(3000);
    }
    
    @Override
    public void addInterceptors(InterceptorRegistry registry){
        SessionInterceptor sessionInterceptor = new SessionInterceptor();
        registry.addInterceptor((HandlerInterceptor) sessionInterceptor)
            .addPathPatterns("/**")
            .excludePathPatterns(sessionInterceptor.allowList);
        
        PageInterceptor pageInterceptor = new PageInterceptor();
        registry.addInterceptor((HandlerInterceptor) pageInterceptor)
            .addPathPatterns(pageInterceptor.activeList)
            .excludePathPatterns(pageInterceptor.allowList);
    }
}

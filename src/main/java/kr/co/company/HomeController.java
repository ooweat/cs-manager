package kr.co.company;

import javax.servlet.http.HttpSession;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class HomeController {
    @GetMapping(value = {"/login", "/logout"})
    public ModelAndView login(HttpSession session) {
        session.invalidate();   //기존 session 정보 invalid
        return new ModelAndView("/login");
    }
    
    @GetMapping("/repairs")
    public ModelAndView repairList(HttpSession session) {
        return new ModelAndView("/repair/list.loading");
    }
    
    @GetMapping("/repair/info")
    public ModelAndView repairRegist(HttpSession session) {
        return new ModelAndView("/repair/info.tiles");
    }
}

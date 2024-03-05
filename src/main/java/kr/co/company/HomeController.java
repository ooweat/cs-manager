package kr.co.company;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import kr.co.company.common.application.CommonService;
import kr.co.company.common.application.dto.SearchRequest;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class HomeController {
    private final CommonService commonService;
    
    public HomeController(CommonService commonService){
        this.commonService = commonService;
    }
    
    @GetMapping(value = {"/login", "/logout"})
    public ModelAndView login(HttpSession session) {
        session.invalidate();   //기존 session 정보 invalid
        return new ModelAndView("/login");
    }
    
    @PostMapping("/excelDownload")
    public XSSFWorkbook excelDownload(@RequestBody SearchRequest searchRequest, HttpServletRequest request) {
        String fileName = "";
        XSSFWorkbook workbook = new XSSFWorkbook();
        workbook = commonService.getListExcel(request);
        return workbook;
    }
    
    @GetMapping(value="/dashboard")
    public ModelAndView dashboard() {
        return new ModelAndView("/dashboard.loading");
    }
    
    @GetMapping(value="/repairs")
    public ModelAndView repairList() {
        return new ModelAndView("/repair/list.loading");
    }
    
    @GetMapping("/repairs/info")
    public ModelAndView repairPage() {
        return new ModelAndView("/repair/info.loading");
    }
    
    @GetMapping("/repairs/{asNo}")
    public ModelAndView repairPage(@PathVariable final String asNo) {
        ModelAndView mav = new ModelAndView();
        mav.addObject("asNo", asNo);
        mav.setViewName("/repair/info.loading");
        return mav;
    }
    
    @GetMapping("/settings")
    public ModelAndView settings() {
        return new ModelAndView("/setting/list.tiles");
    }
}

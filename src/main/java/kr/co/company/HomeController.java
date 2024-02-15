package kr.co.company;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import kr.co.company.common.application.CommonService;
import kr.co.company.common.application.dto.SearchRequest;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
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
    
    @GetMapping("/repairs")
    public ModelAndView repairList(HttpSession session) {
        return new ModelAndView("/repair/list.loading");
    }
    
    @GetMapping("/repair/info")
    public ModelAndView repairRegist(HttpSession session) {
        return new ModelAndView("/repair/info.tiles");
    }
}

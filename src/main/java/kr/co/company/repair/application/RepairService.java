package kr.co.company.repair.application;

import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import java.io.BufferedOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.net.URLEncoder;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import javax.servlet.http.HttpServletResponse;
import kr.co.company.as.domain.As;
import kr.co.company.as.domain.CommonInfoType;
import kr.co.company.as.mappers.AsMapper;
import kr.co.company.common.ResponseCode;
import kr.co.company.common.domain.BaseResponse;
import kr.co.company.common.domain.PageNavigation;
import kr.co.company.repair.application.dto.RepairRequest;
import kr.co.company.repair.mappers.RepairMapper;
import org.apache.poi.hssf.util.CellRangeAddress;
import org.apache.poi.ss.usermodel.CellStyle;
import org.apache.poi.ss.usermodel.Font;
import org.apache.poi.ss.usermodel.IndexedColors;
import org.apache.poi.xssf.usermodel.XSSFCell;
import org.apache.poi.xssf.usermodel.XSSFCellStyle;
import org.apache.poi.xssf.usermodel.XSSFDataFormat;
import org.apache.poi.xssf.usermodel.XSSFFont;
import org.apache.poi.xssf.usermodel.XSSFRow;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
public class RepairService {
    
    private final RepairMapper repairMapper;
    private final AsMapper asMapper;
    
    public RepairService(RepairMapper repairMapper, AsMapper asMapper) {
        this.repairMapper = repairMapper;
        this.asMapper = asMapper;
    }
    
    public void findAllByRequestExcel(RepairRequest repairRequest, HttpServletResponse response)
        throws IOException {
        OutputStream out = null;
        XSSFWorkbook workbook = new XSSFWorkbook();
        
        XSSFFont font = workbook.createFont();
        font.setBoldweight(Font.BOLDWEIGHT_BOLD);
        XSSFDataFormat format = workbook.createDataFormat();
        // 테이블 헤더용 스타일
        XSSFCellStyle headStyle = workbook.createCellStyle();
        
        // 가는 경계선을 가집니다.
        headStyle.setBorderTop(XSSFCellStyle.BORDER_THIN);
        headStyle.setBorderBottom(XSSFCellStyle.BORDER_THIN);
        headStyle.setBorderLeft(XSSFCellStyle.BORDER_THIN);
        headStyle.setBorderRight(XSSFCellStyle.BORDER_THIN);
        
        // 배경색은 노란색입니다.
        headStyle.setFillForegroundColor(IndexedColors.LIGHT_YELLOW.getIndex());
        headStyle.setFillPattern(CellStyle.SOLID_FOREGROUND);
        
        // 데이터는 가운데 정렬합니다.
        headStyle.setAlignment(CellStyle.ALIGN_CENTER);
        headStyle.setVerticalAlignment(CellStyle.VERTICAL_CENTER);
        headStyle.setFont(font);
        
        // 테이블 헤더용 값 스타일
        XSSFCellStyle valueheadStyle = workbook.createCellStyle();
        valueheadStyle.setBorderTop(XSSFCellStyle.BORDER_THIN);
        valueheadStyle.setBorderBottom(XSSFCellStyle.BORDER_THIN);
        valueheadStyle.setBorderLeft(XSSFCellStyle.BORDER_THIN);
        valueheadStyle.setBorderRight(XSSFCellStyle.BORDER_THIN);
        valueheadStyle.setFillForegroundColor(IndexedColors.WHITE.getIndex());
        valueheadStyle.setFillPattern(CellStyle.SOLID_FOREGROUND);
        // 데이터는 가운데 정렬합니다.
        valueheadStyle.setAlignment(CellStyle.ALIGN_LEFT);
        valueheadStyle.setVerticalAlignment(CellStyle.VERTICAL_CENTER);
        valueheadStyle.setFont(font);
        
        XSSFCellStyle mumheadStyle = workbook.createCellStyle();
        
        // 가는 경계선을 가집니다.
        mumheadStyle.setBorderTop(XSSFCellStyle.BORDER_THIN);
        mumheadStyle.setBorderBottom(XSSFCellStyle.BORDER_THIN);
        mumheadStyle.setBorderLeft(XSSFCellStyle.BORDER_THIN);
        mumheadStyle.setBorderRight(XSSFCellStyle.BORDER_THIN);
        
        // 배경색은 노란색입니다.
        mumheadStyle.setFillForegroundColor(IndexedColors.LIGHT_YELLOW.getIndex());
        mumheadStyle.setFillPattern(CellStyle.SOLID_FOREGROUND);
        
        // 데이터는 가운데 정렬합니다.
        mumheadStyle.setAlignment(CellStyle.ALIGN_RIGHT);
        mumheadStyle.setVerticalAlignment(CellStyle.VERTICAL_CENTER);
        mumheadStyle.setFont(font);
        mumheadStyle.setDataFormat(format.getFormat("#,##0"));
        
        // 데이터용 경계 스타일 테두리만 지정
        XSSFCellStyle bodyStyle = workbook.createCellStyle();
        bodyStyle.setBorderTop(XSSFCellStyle.BORDER_THIN);
        bodyStyle.setBorderBottom(XSSFCellStyle.BORDER_THIN);
        bodyStyle.setBorderLeft(XSSFCellStyle.BORDER_THIN);
        bodyStyle.setBorderRight(XSSFCellStyle.BORDER_THIN);
        
        XSSFCellStyle numBodyStyle = workbook.createCellStyle();
        numBodyStyle.setBorderTop(XSSFCellStyle.BORDER_THIN);
        numBodyStyle.setBorderBottom(XSSFCellStyle.BORDER_THIN);
        numBodyStyle.setBorderLeft(XSSFCellStyle.BORDER_THIN);
        numBodyStyle.setBorderRight(XSSFCellStyle.BORDER_THIN);
        numBodyStyle.setAlignment(XSSFCellStyle.ALIGN_RIGHT);
        numBodyStyle.setDataFormat(format.getFormat("#,##0"));
        
        // 시트생성
        XSSFSheet sheet = workbook.createSheet("보증기간 관리");
        int rowNo = 0;
        
        XSSFRow headerRow = sheet.createRow(rowNo++);
        headerRow.setHeight((short) 512);
        String[] pageheaderKey = {"페이지명", "단말기 이력관리"};
        
        XSSFCell headerCell = null;
        for (int i = 0; i < pageheaderKey.length; i++) {
            
            headerCell = headerRow.createCell(i);
            
            if (i == 0) {
                headerCell.setCellStyle(headStyle);
            } else {
                headerCell.setCellStyle(valueheadStyle);
            }
            
            headerCell.setCellValue(pageheaderKey[i]);
        }
        sheet.addMergedRegion(
            new CellRangeAddress(rowNo - 1, rowNo - 1, 1, pageheaderKey.length - 1));
        
        headerRow = sheet.createRow(rowNo++);
        headerRow.setHeight((short) 512);
        headerRow = sheet.createRow(rowNo++);
        headerRow.setHeight((short) 212);
        
        String[] headerKey = {"등록일자", "처리일자", "보증만료일자", "CID", "발송처", "협력사",
            "단말기모델", "TID", "Serial", "SAM유무", "불량내역",
            "수리내역", "메인REV", "서브REV", "ICREV", "비고"
        };
        
        headerRow.setHeight((short) 512);
        int length = headerKey.length;
        for (int i = 0; i < length; i++) {
            sheet.autoSizeColumn(i);
            sheet.setColumnWidth(i, (sheet.getColumnWidth(i)) + 3024);
            headerCell = headerRow.createCell(i);
            headerCell.setCellStyle(headStyle);
            headerCell.setCellValue(headerKey[i]);
        }
        // 데이터 부분 생성
        XSSFRow bodyRow = null;
        XSSFCell bodyCell = null;
        int colno = 0;
        List<As> list = repairMapper.findAllByRequest(repairRequest);
        for (int i = 0; i < list.size(); i++) {
            //vm = list.get(i);
            
            bodyRow = sheet.createRow(rowNo++);
            colno = 0;
            
            bodyCell = bodyRow.createCell(colno++);
            bodyCell.setCellStyle(bodyStyle);
            bodyCell.setCellValue(list.get(i).getCreateDate().format(DateTimeFormatter.ofPattern("yyyy-MM-dd")));
            
            bodyCell = bodyRow.createCell(colno++);
            bodyCell.setCellStyle(bodyStyle);
            bodyCell.setCellValue(list.get(i).getRepairDate());
            
            bodyCell = bodyRow.createCell(colno++);
            bodyCell.setCellStyle(bodyStyle);
            bodyCell.setCellValue(list.get(i).getRepairExpireDate());
            
            bodyCell = bodyRow.createCell(colno++);
            bodyCell.setCellStyle(bodyStyle);
            bodyCell.setCellValue(list.get(i).getCid());
            
            bodyCell = bodyRow.createCell(colno++);
            bodyCell.setCellStyle(bodyStyle);
            bodyCell.setCellValue(list.get(i).getCompName());
            
            bodyCell = bodyRow.createCell(colno++);
            bodyCell.setCellStyle(bodyStyle);
            bodyCell.setCellValue(list.get(i).getPtnCompName());
            
            bodyCell = bodyRow.createCell(colno++);
            bodyCell.setCellStyle(bodyStyle);
            bodyCell.setCellValue(list.get(i).getTidModelName());
            
            bodyCell = bodyRow.createCell(colno++);
            bodyCell.setCellStyle(bodyStyle);
            bodyCell.setCellValue(list.get(i).getTerminalId());
            
            bodyCell = bodyRow.createCell(colno++);
            bodyCell.setCellStyle(bodyStyle);
            bodyCell.setCellValue(list.get(i).getSerialNo());
            
            bodyCell = bodyRow.createCell(colno++);
            bodyCell.setCellStyle(bodyStyle);
            bodyCell.setCellValue(list.get(i).getSamFlag() == 'Y' ? "있음" : "없음");
            
            bodyCell = bodyRow.createCell(colno++);
            bodyCell.setCellStyle(bodyStyle);
            bodyCell.setCellValue(list.get(i).getTrbName());
            
            bodyCell = bodyRow.createCell(colno++);
            bodyCell.setCellStyle(bodyStyle);
            bodyCell.setCellValue(list.get(i).getAtName());
            
            bodyCell = bodyRow.createCell(colno++);
            bodyCell.setCellStyle(bodyStyle);
            bodyCell.setCellValue(list.get(i).getMbRvName());
            
            bodyCell = bodyRow.createCell(colno++);
            bodyCell.setCellStyle(bodyStyle);
            bodyCell.setCellValue(list.get(i).getSbRvName());
            
            bodyCell = bodyRow.createCell(colno++);
            bodyCell.setCellStyle(bodyStyle);
            bodyCell.setCellValue(list.get(i).getIcRvName());
            
            bodyCell = bodyRow.createCell(colno++);
            bodyCell.setCellStyle(bodyStyle);
            bodyCell.setCellValue(list.get(i).getPtnComment());
        }
        
        response.reset();
        response.setHeader("Content-Disposition",
            "attachment;filename=" + URLEncoder.encode("단말기_이력관리.xlsx", "UTF-8"));
        response.setContentType("application/vnd.ms-excel");
        out = new BufferedOutputStream(response.getOutputStream());
        
        workbook.write(out);
        out.flush();
    }
    
    public Map<String, Object> findAllByRequest(RepairRequest repairRequest) {
        Map<String, Object> response = new HashMap<>();
        PageHelper.startPage(repairRequest.getPage(), 10);
        Page<As> list = (Page<As>) repairMapper.findAllByRequest(repairRequest);
        response.put("page", new PageNavigation(list));
        response.put("data", list);
        return response;
    }
    
    public Map<String, Object> findTerminalModelCount (RepairRequest repairRequest) {
        Map<String, Object> response = new HashMap<>();
        List<CommonInfoType> list = repairMapper.findTerminalModelCount(repairRequest);
        response.put("data", list);
        return response;
    }
    
    public Map<String, Object> findErrorTop5 (RepairRequest repairRequest) {
        Map<String, Object> response = new HashMap<>();
        List<CommonInfoType> list = repairMapper.findErrorTop5(repairRequest);
    
        int sumCount = 0;
        for(int i = 0; i < list.size(); i++) {
            sumCount += list.get(i).getCount();
        }
        response.put("data", list);
        
        response.put("size", sumCount);
        return response;
    }
    
    public As findRepairByAsNo(String asNo) {
        return repairMapper.findRepairByAsNo(asNo);
    }
    
    public BaseResponse patchRepair(String asNo, As as) {
        if (repairMapper.patchRepair(asNo, as)) {
            return new BaseResponse(ResponseCode.SUCCESS_INSERT);
        } else {
            return new BaseResponse(ResponseCode.ERROR_INSERT);
        }
    }
    
    @Transactional
    public BaseResponse createRepair(As as) {
        As as2 = new As(makeAsNo(), as);
        if (repairMapper.createRepair(as2)) {
            return new BaseResponse(ResponseCode.SUCCESS_INSERT);
        } else {
            return new BaseResponse(ResponseCode.ERROR_INSERT);
        }
    }
    
    //asNo: 연월일시분초 + 4자리 숫자
    private String makeAsNo() {
        return LocalDateTime.now()
            .format(DateTimeFormatter.ofPattern("yyMMddHHmmss"))
            + String.format("%04d", (int) (Math.random() * 100) + 1);
    }
    
    @Transactional
    public BaseResponse deleteRepair(String asNo) {
        if (repairMapper.deleteRepair(asNo)) {
            return new BaseResponse(ResponseCode.SUCCESS_REQUEST);
        } else {
            return new BaseResponse(ResponseCode.ERROR_REQUEST);
        }
    }
}

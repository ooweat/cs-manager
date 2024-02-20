package kr.co.company.repair.domain;

import kr.co.company.common.domain.BaseTimeEntity;
import lombok.Getter;
import lombok.RequiredArgsConstructor;

//기존 컬럼 인계
@Getter
@RequiredArgsConstructor
public class As extends BaseTimeEntity {
    
    private int seq;            //자동증가번호
    private String ptnWriter;            //작성자
    private String asNo;                //접수번호
    private int compSeq;                //소속
    private String compName;            //소속명
    private String businessNo;            //사업자번호
    private String ctmName;            //고객명
    private String ctmPhone;            //연락처
    private String ctmPlacePostCode;    //우편코드
    private String ctmPlaceAddress1;    //상세주소1
    private String ctmPlaceAddress2;    //상세주소2
    private String ctmPlaceName;        //설치위치
    private String ctmCharge;            //비용처리
    private String terminalId;            //단말기ID
    
    private int tidSeq;            //단말기모델번호
    private String tidModelName;    //단말기모델
    
    private int vmSeq;                //자판기모델
    private String vmModelName;    //자판기모델
    
    private int trbSeq;            //고장 증상 seq
    private String trbName;        //고장 증상 Name 조회용
    
    private int rtSeq;                //확인 증상 seq
    private String rtName;            //확인 증상 Name 조회용
    
    private int atSeq;                //현장 조치 seq
    private String atName;            //현장 조치 Name 조회용
    
    private String modemSerial;    //모뎀 시리얼번호
    private String caseChange;        //공모뎀 교체 여부
    
    
    private long repairCost;            //수리청구비용
    private String ptnComment;            //메모
    private String progressStatus;        //진행상태
    private int ptnCompSeq;        //이관사
    
    private String transferCost;    //대행료 text
    private String vpTimestamp;    //방문예정일
    private String cpTimestamp;    //처리완료일
    private String ptnFinale;        //처리자
    
    private int readCount;        //조회수
    private String ptnIp;        //ip
    
    //답글을 대비한 ..
    private int groupNum;        //그룹번호
    private int sequenceNum;    //시퀀스번호
    private int sequenceLevel;    //시퀀스등급
    
    //검색어 조건 ..
    private String searchType;
    private String searchData;
    private String sDate;
    private String eDate;
    private long limitDay;
    private long completeDay;
    
    // 수정 페이지 추가 데이터
    private String modifyUser;        //최후 수정자
    private String deposit;            //입금여부
    private String depositDate;    //입금완료일자
    private String ptnCpDate;     //파트너사 처리 완료 일자
    private String ptnMemo;        //파트너사에서 사용하는 메모
    
    private String serialNo;
    private String cid;
    private char samFlag;
    
    private int mbRvSeq;
    private int sbRvSeq;
    private int icRvSeq;
    
    private String mbRvName;
    private String sbRvName;
    private String icRvName;
    private int page;
    
    public As(String asNo, As as) {
        this.ptnWriter = as.getPtnWriter();
        this.asNo = asNo;
        this.compSeq = as.getCompSeq();
        this.compName = as.getCompName();
        this.businessNo = as.getBusinessNo();
        this.ctmName = as.getCtmName();
        this.ctmPhone = as.getCtmPhone();
        this.ctmPlacePostCode = as.getCtmPlacePostCode();
        this.ctmPlaceAddress1 = as.getCtmPlaceAddress1();
        this.ctmPlaceAddress2 = as.getCtmPlaceAddress2();
        this.ctmPlaceName = as.getCtmPlaceName();
        this.ctmCharge = as.getCtmCharge();
        this.terminalId = as.getTerminalId();
        this.tidSeq = as.getTidSeq();
        this.tidModelName = as.getTidModelName();
        this.vmSeq = as.getVmSeq();
        this.vmModelName = as.getVmModelName();
        this.trbSeq = as.getTrbSeq();
        this.trbName = as.getTrbName();
        this.rtSeq = as.getRtSeq();
        this.rtName = as.getRtName();
        this.atSeq = as.getAtSeq();
        this.atName = as.getAtName();
        this.modemSerial = as.getModemSerial();
        this.caseChange = as.getCaseChange();
        this.repairCost = as.getRepairCost();
        this.ptnComment = as.getPtnComment();
        this.progressStatus = as.getProgressStatus();
        this.ptnCompSeq = as.getPtnCompSeq();
        this.transferCost = as.getTransferCost();
        this.vpTimestamp = as.getVpTimestamp();
        this.cpTimestamp = as.getCpTimestamp();
        this.ptnFinale = as.getPtnFinale();
        this.readCount = as.getReadCount();
        this.ptnIp = as.getPtnIp();
        this.groupNum = as.getGroupNum();
        this.sequenceNum = as.getSequenceNum();
        this.sequenceLevel = as.getSequenceLevel();
        this.searchType = as.getSearchType();
        this.searchData = as.getSearchData();
        this.limitDay = as.getLimitDay();
        this.completeDay = as.getCompleteDay();
        this.modifyUser = as.getModifyUser();
        this.deposit = as.getDeposit();
        this.depositDate = as.getDepositDate();
        this.ptnCpDate = as.getPtnCpDate();
        this.ptnMemo = as.getPtnMemo();
        this.serialNo = as.getSerialNo();
        this.cid = as.getCid();
        this.samFlag = as.getSamFlag();
        this.mbRvSeq = as.getMbRvSeq();
        this.sbRvSeq = as.getSbRvSeq();
        this.icRvSeq = as.getIcRvSeq();
        this.mbRvName = as.getMbRvName();
        this.sbRvName = as.getSbRvName();
        this.icRvName = as.getIcRvName();
        this.page = as.getPage();
    }
}

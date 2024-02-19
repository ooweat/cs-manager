package kr.co.company.common;

import lombok.Getter;

public enum ResponseCode {
    /*RESULT_SUCCESS_TITLE ="SUCCESS"; //정상
    RESULT_FAIL_TITLE ="FAIL";       //실패
    RESULT_ERROR_TITLE ="ERROR";     //오류


    RESULT_SUCCESS = "0000";         //정상승인
    RESULT_ALREADY = "0099";         //기취소된 거래
    RESULT_STANDBY_TIME = "2359";        //서버 점검시간
    RESULT_CREATE_FAIL = "8800";       //생성 실패
    RESULT_ACCESS_FAIL = "8801";    //인증 실패
    RESULT_SAVE_FAIL = "8888";       //이력 저장 실패


    RESULT_USE = "9901";            //사용함
    RESULT_NOUSE = "9902";            //사용안함*/

    //기존 Code에 대응하기 위함 twkim
    
    ERROR_MODIFY("5113", "수정 실패", "원인 파악 후 재시도 요망"),
    ERROR_DELETE("5113", "삭제 실패", "원인 파악 후 재시도 요망"),
    ERROR_COMPANY("7114", "유효하지 않은 company", "시스템에 존재하지 않거나 유효하지 않은 company 입니다."),
    ERROR_INVALID_TOKEN("8001", "유효하지 않은 token", "시스템에 존재하지 않거나 유효하지 않은 token 입니다."),
    ERROR_SERVER("5000", "서버 오류 발생", "시스템 점검 중입니다.."),
    ERROR_REQUEST("5113", "데이터 처리 실패", "재시도 요망"),
    ERROR_SEARCH("5114", "데이터 조회 실패", "재시도 요망"),
    ERROR_INSERT("5115", "데이터 입력 실패", "재시도 요망"),
    SUCCESS_LOGIN("0000", "로그인 성공", "정상"),
    SUCCESS_REQUEST("0000", "데이터 처리 성공", "정상처리"),
    SUCCESS_SEARCH("0000", "데이터 조회 성공", "정상처리"),
    SUCCESS_INSERT("0000", "데이터 입력 성공", "정상처리"),
    ALREADY_DATA("0111","이미 존재하는 데이터",""),
    EMPTY_TOKEN("ERR_101","token 데이터 누락", "필수 데이터가 누락되었습니다."),
    EMPTY_COMPANY("ERR_102","company 데이터 누락", "필수 데이터가 누락되었습니다."),
    ILLEGAL_HEADER("ERR_103","token 과 company 미일치(인증 실패)", "필수 데이터가 누락되었습니다."),
    NOT_EXIST_TOKEN("ERR_104","유효하지 않은 token", "시스템에 존재하지 않거나 유효하지 않은 token 입니다."),
    NOT_EXIST_COMPANY("ERR_105","유효하지 않은 company", "시스템에 존재하지 않거나 유효하지 않은 company 입니다."),
    NOT_EXIST_GROUP("ERR_106","유효하지 않은 요청 group", "시스템에 존재하지 않거나 유효하지 않은 group 입니다."),
    NOT_EXIST_ID("ERR_108","유효하지 않은 요청 id", "시스템에 존재하지 않거나 유효하지 않은 id 입니다."),
    NOT_EXIST_TYPE("ERR_109","유효하지 않은 요청 type", "시스템에 존재하지 않거나 유효하지 않은 type 입니다."),

    NOT_STRING("ERR_191","문자열 형식이 아님", "STRING 형식으로 요청 바랍니다."),
    NOT_POSITIVE("ERR_192"," 0 이상의 숫자(양수)형식이 아님", "INTEGER 또는 LONG 형식으로 요청 바랍니다." ),
    NOT_SUPPORT("ERR_193","지원하지 않는 형식의 Parameter", "올바른 형식으로 요청 바랍니다."),
    NOT_EXIST_VALUE("ERR_194","시스템에 존재하지 않는 Request Parameter", "발급받은 값을 요청 바랍니다."),
    NOT_EMPTY("ERR_195", "Request Parameter 빈 값 또는 공백", "요청 데이터가 빈 값 또는 공백 입니다."),
    NOT_NULL("ERR_200","Request Parameter 가 NULL", "요청 데이터가 NULL 입니다."),
    EMPTY_PARAM1("ERR_201","1번 Parameter 데이터 누락", "1번 Parameter 가 누락되었습니다."),
    EMPTY_PARAM2("ERR_202","2번 Parameter 데이터 누락", "2번 Parameter 가 누락되었습니다."),
    EMPTY_PARAM3("ERR_203","3번 Parameter 데이터 누락", "3번 Parameter 가 누락되었습니다."),
    EMPTY_PARAM4("ERR_204","4번 Parameter 데이터 누락", "4번 Parameter 가 누락되었습니다."),
    EMPTY_PARAM5("ERR_205","5번 Parameter 데이터 누락", "5번 Parameter 가 누락되었습니다."),
    EMPTY_PARAM6("ERR_206","6번 Parameter 데이터 누락", "6번 Parameter 가 누락되었습니다."),
    EMPTY_PARAM7("ERR_207","7번 Parameter 데이터 누락", "7번 Parameter 가 누락되었습니다."),
    EMPTY_PARAM8("ERR_208","8번 Parameter 데이터 누락", "8번 Parameter 가 누락되었습니다."),
    EMPTY_PARAM9("ERR_209","9번 Parameter 데이터 누락", "9번 Parameter 가 누락되었습니다."),
    NOT_SUPPORT_DATE_FORMAT("ERR_211","지원하지 않는 날짜 형식", "날짜 형식을 확인하시기 바랍니다."),
    NOT_SUPPORT_TIME_FORMAT("ERR_212","지원하지 않는 시간 형식", "시간 형식을 확인하시기 바랍니다."),
    NOT_SUPPORT_PHONE_FORMAT("ERR_213","지원하지 않는 연락처 형식", "연락처 형식을 확인하시기 바랍니다."),
    MIN_VALUE("ERR_401", "최소 값 기준치 미달", "최소 기준에 미달합니다."),
    MAX_VALUE("ERR_402", "최대 값 기준치 초과", "최대 기준을 초과합니다."),
    FAIL_LOGIN("9999", "로그인 실패", "실패"),
    COUPON_ERROR("9999", "쿠폰 발권 실패", "재발권 요청이 필요합니다.")
    ;

    @Getter
    private String code;
    @Getter
    private String description;

    @Getter
    private String message;

    ResponseCode(String code, String description, String message){
        this.code = code;
        this.description = description;
        this.message = message;
    }
}

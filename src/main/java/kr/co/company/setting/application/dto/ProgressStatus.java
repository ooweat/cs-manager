package kr.co.company.setting.application.dto;

public enum ProgressStatus {
    PROGRESS1(1, "접수신청"),
    PROGRESS2(2, "택배접수"),
    PROGRESS3(3, "택배회수"),
    PROGRESS4(4, "접수(이관)"),
    PROGRESS5(5, "방문예약"),
    PROGRESS6(6, "완료대기"),
    PROGRESS7(7, "처리완료"),
    PROGRESS8(8, "접수취소");

    private int step;
    private String status;

    public int getStep() {
        return step;
    }

    public String getStatus() {
        return status;
    }

    ProgressStatus(int step, String status){
        this.step = step;
        this.status = status;
    }
}

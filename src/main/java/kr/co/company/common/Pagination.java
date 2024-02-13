package kr.co.company.common;

import lombok.Data;

@Data
public class Pagination {

    private int listSize = 10;                //초기값으로 목록개수를 10으로 셋팅
    private int rangeSize = 10;               //초기값으로 페이지범위를 10으로 셋팅
    private int currPage;
    private int rangePage;
    private int listCnt;
    private int pageCnt;
    private int startPage;
    private int startList;
    private int endPage;
    private boolean prev;
    private boolean next;

    public void pageInfo(int currPage, int rangePage, int listCnt) {
        this.currPage = currPage;
        this.rangePage = rangePage;
        this.listCnt = listCnt;
        //전체 페이지수
        this.pageCnt = (int) Math.ceil((double)listCnt / listSize);
        //시작 페이지
        this.startPage = (rangePage - 1) * rangeSize + 1;
        //끝 페이지
        this.endPage = rangePage * rangeSize;
        //게시판 시작번호
        this.startList = (currPage - 1) * listSize;
        //이전 버튼 상태
        this.prev = rangePage == 1 ? false : true;
        //다음 버튼 상태
        this.next = endPage > pageCnt ? false : true;
        if (this.endPage > this.pageCnt) {
            this.endPage = this.pageCnt;
            this.next = false;
        }
    }
}

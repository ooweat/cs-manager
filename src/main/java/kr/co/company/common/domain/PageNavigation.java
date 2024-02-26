package kr.co.company.common.domain;

import com.github.pagehelper.Page;
import lombok.Data;

@Data
public class PageNavigation {
    private int naviSize = 10;
    private int countPerPage = 10;
    private boolean startRange;
    private boolean endRange;
    private int startPage;
    private int endPage;
    private String navigation;
    private int pageNum;
    private Page<?> page;
    private String path;
    private int pages;
    private long total;
    
    public PageNavigation(Page<?>page){
        this.page = page;
        this.startRange = page.getPageNum() <= naviSize;
        this.endRange = (page.getPages() - 1) / naviSize * naviSize < page.getPageNum();
        this.startPage = (page.getPageNum() - 1) / naviSize * naviSize + 1;
        this.endPage = startPage + naviSize - 1;
        this.pageNum = page.getPageNum();
        this.pages = page.getPages();
        this.total = page.getTotal();
        if (page.getPages() < endPage) {
            endPage = page.getPages();
        }
    }
}

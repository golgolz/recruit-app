package kr.co.sist.admin.vo.qna;

import lombok.AllArgsConstructor;
import lombok.NoArgsConstructor;
import lombok.ToString;

@NoArgsConstructor
@AllArgsConstructor
@ToString
public class SearchVO {
    private String keyword;

    private int currentPage = 1; // 사용자가 현재 보고있는 페이지 번호
    private int itemsPerPage = 10; // 한 페이지에 표시할 항목의 수
    private int totalItems; // 전체 공지사항의 수
    private int totalPages; // 전체 페이지의 수 항목 수(항목 수와 페이지당 항목 수를 기반으로 계산)
    private int startItemIndex; // 현재 페이지에서 첫 번째로 표시될 항목의 인덱스를 나타내는 변수
    private int endItemIndex; // 현재 페이지에서 마지막으로 표시될 항목의 인덱스를 나타내는 변수

    public void pageIndexes() {
        this.startItemIndex = (currentPage - 1) * itemsPerPage + 1;
        this.endItemIndex = currentPage * itemsPerPage;


    }

    public String getKeyword() {
        return keyword;
    }

    public void setKeyword(String keyword) {
        this.keyword = keyword;
    }

    public int getCurrentPage() {
        return currentPage;
    }

    public void setCurrentPage(int currentPage) {
        this.currentPage = currentPage;
    }

    public int getItemsPerPage() {
        return itemsPerPage;
    }

    public void setItemsPerPage(int itemsPerPage) {
        this.itemsPerPage = itemsPerPage;
    }

    public int getTotalItems() {
        return totalItems;
    }

    public void setTotalItems(int totalItems) {
        this.totalItems = totalItems;
    }

    public int getTotalPages() {
        return totalPages;
    }

    public void setTotalPages(int totalPages) {
        this.totalPages = totalPages;
    }

    public int getStartItemIndex() {
        return startItemIndex;
    }

    public void setStartItemIndex(int startItemIndex) {
        this.startItemIndex = startItemIndex;
    }

    public int getEndItemIndex() {
        return endItemIndex;
    }

    public void setEndItemIndex(int endItemIndex) {
        this.endItemIndex = endItemIndex;
    }
}

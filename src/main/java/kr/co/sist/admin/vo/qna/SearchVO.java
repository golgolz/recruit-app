package kr.co.sist.admin.vo.qna;

import lombok.AllArgsConstructor;
import lombok.NoArgsConstructor;
import lombok.ToString;

@NoArgsConstructor
@AllArgsConstructor
@ToString
public class SearchVO {
    private String keyword;

    private int currentPage = 1; // ����ڰ� ���� �����ִ� ������ ��ȣ
    private int itemsPerPage = 10; // �� �������� ǥ���� �׸��� ��
    private int totalItems; // ��ü ���������� ��
    private int totalPages; // ��ü �������� �� �׸� ��(�׸� ���� �������� �׸� ���� ������� ���)
    private int startItemIndex; // ���� ���������� ù ��°�� ǥ�õ� �׸��� �ε����� ��Ÿ���� ����
    private int endItemIndex; // ���� ���������� ���������� ǥ�õ� �׸��� �ε����� ��Ÿ���� ����

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

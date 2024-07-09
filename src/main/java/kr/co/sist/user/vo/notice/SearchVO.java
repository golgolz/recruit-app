package kr.co.sist.user.vo.notice;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor
@AllArgsConstructor
@Getter
@Setter
@ToString
public class SearchVO {
    private String keyword;

    private int currentPage; // 사용자가 현재 보고있는 페이지 번호
    private int itemsPerPage = 10; // 한 페이지에 표시할 항목의 수
    private int totalItems; // 전체 공지사항의 수
    private int totalPages; // 전체 페이지의 수 항목 수(항목 수와 페이지당 항목 수를 기반으로 계산)
    private int startItemIndex; // 현재 페이지에서 첫 번째로 표시될 항목의 인덱스를 나타내는 변수
    private int endItemIndex; // 현재 페이지에서 마지막으로 표시될 항목의 인덱스를 나타내는 변수

    public void pageIndex() {
        this.startItemIndex = (currentPage - 1) * itemsPerPage + 1;
        this.endItemIndex = currentPage * itemsPerPage;
    }
}

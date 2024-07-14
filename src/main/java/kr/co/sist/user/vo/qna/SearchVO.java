package kr.co.sist.user.vo.qna;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor
@AllArgsConstructor
@ToString
@Getter
@Setter
public class SearchVO {
    private String keyword;
    private String searchType;

    private String userId;

    private int currentPage = 1;
    private int itemsPerPage = 10;
    private int totalItems;
    private int totalPages;
    private int startItemIndex;
    private int endItemIndex;

    public void pageIndexes() {
        this.startItemIndex = (currentPage - 1) * itemsPerPage + 1;
        this.endItemIndex = currentPage * itemsPerPage;
    }

}

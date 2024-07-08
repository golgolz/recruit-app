package kr.co.sist.user.vo.mypage;

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
    private String userId;
    private String progressState;
    private String keyword;
    private int startNum;
    private int endNum;
}

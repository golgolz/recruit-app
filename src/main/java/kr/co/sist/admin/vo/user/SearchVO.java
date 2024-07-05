package kr.co.sist.admin.vo.user;

import java.sql.Date;
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
    private String name;
    private String phone;
    private String keyword;
    private String category;
    private Date signupDateStart;
    private Date signupDateEnd;
    private int startNum;
    private int endNum;
}

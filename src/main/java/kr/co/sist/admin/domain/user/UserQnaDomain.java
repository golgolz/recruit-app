package kr.co.sist.admin.domain.user;

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
public class UserQnaDomain {
    private int qnaNum;
    private String category;
    private String title;
    private Date inputDate;
    private String flag;
}

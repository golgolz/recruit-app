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
public class UserApplyDomain {
    private String resumeNum;
    private String companyName;
    private Date applyDate;
    private String title;
    private String progressState;
}

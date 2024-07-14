package kr.co.sist.user.vo.resume;

import java.sql.Date;
import org.springframework.format.annotation.DateTimeFormat;
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
public class CareerVO {
    private String resumeNum;
    private String companyName;
    private String dname;
    // @JsonFormat(shape = JsonFormat.Shape.STRING, pattern = "yyyy-MM-dd", timezone = "Asia/Seoul")
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date joinDate;
    // @JsonFormat(shape = JsonFormat.Shape.STRING, pattern = "yyyy-MM-dd", timezone = "Asia/Seoul")
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date resignationDate;
    private String jobDescription;
    private String position;
    private int sal;
}

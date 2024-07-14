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
public class EducationVO {
    private String resumeNum;
    private String schoolClassification;
    private String schoolName;
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date admissionDate;
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date graduationDate;
    private String graduationState;
    private String major;
    private float grades;
    private float totalScore;
}

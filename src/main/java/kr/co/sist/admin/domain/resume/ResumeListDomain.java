package kr.co.sist.admin.domain.resume;

import java.sql.Date;
import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@NoArgsConstructor
@AllArgsConstructor
@Getter
@Setter
public class ResumeListDomain {
    private String resumeId;
    private String recruitTitle;
    private String userName;
    @JsonFormat(shape = JsonFormat.Shape.STRING, pattern = "yyyy-MM-dd", timezone = "Asia/Seoul")
    private Date applyDate;
    private String resumeTitle;
    private String career;
    private String addr;
    private String docPass;
    private String finalPass;
}

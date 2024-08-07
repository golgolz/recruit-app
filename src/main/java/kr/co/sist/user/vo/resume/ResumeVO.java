package kr.co.sist.user.vo.resume;

import java.sql.Date;
import com.fasterxml.jackson.annotation.JsonFormat;
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
public class ResumeVO {
    private String id;
    private String owner;
    private String email;
    private String title;
    private String profile;
    @JsonFormat(shape = JsonFormat.Shape.STRING, pattern = "yyyy-MM-dd", timezone = "Asia/Seoul")
    private Date birth;
    private String gender;
    private String tel;
    private String phone;
    private String addr;
    private String introduce;
    @JsonFormat(shape = JsonFormat.Shape.STRING, pattern = "yyyy-MM-dd", timezone = "Asia/Seoul")
    private Date modifyDate;
    // @JsonRawValue
    private String subData;
}

package kr.co.sist.user.vo.main;

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
public class MainVO {

    private String recruitNum;
    private String title;
    private String companyName;
    private String companyImage;
    private String positionName;
    private String jobDescription;
    private String inputDate;
    private String viewDate;
}

package kr.co.sist.user.vo.resume;

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
public class ApplyVO {
    private int recruitNum;
    private String resumeNum;
    private String userId;
}

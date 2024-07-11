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
public class UpdateUserVO {
    private String userId;
    private String name;
    private String phone;
    private String tel;
    private String profileImg;
}

package kr.co.sist.user.vo.signup;

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
public class SignupVO {
    private String userId;
    private String name;
    private String phone;
    private String tel;
    private String password;
}

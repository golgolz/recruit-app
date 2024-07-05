package kr.co.sist.admin.vo.basic;

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
public class UpdateAdminInfoVO {
    private String adminId;
    private String modifyAdminId;
    private String authority;
}

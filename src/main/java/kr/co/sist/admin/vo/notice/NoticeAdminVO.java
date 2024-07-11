package kr.co.sist.admin.vo.notice;

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
public class NoticeAdminVO {
    private int noticeNum, views;
    private String category, title, content, adminId, modifier, blindFlag, inputDate, updateDate;
}

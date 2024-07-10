package kr.co.sist.admin.vo.notice;

import java.sql.Date;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
@ToString
public class SearchVO {
  private String field, keyword;
  private String currentPage, category, title, content, adminId, modifier, blindFlag;
  private int startNum, endNum, noticeNum, views;
  private Date inputDate, updateDate;
}
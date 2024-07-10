package kr.co.sist.admin.vo.notice;

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
  private String currentPage, category, title, content, adminId, modifier, blindFlag, inputDate, updateDate;
  private int startNum, endNum, noticeNum, views;
}
package kr.co.sist.vo.companyinfo;

import java.sql.Date;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
@Builder
@ToString
public class SearchVO {
  private String field, keyword;
  private String currentPage;
  private int startNum, endNum;
  private int avgSal, revenue;
  private String companyCode, companyName, description, logo, companyImg, businessNumber, addr, ceoName, companyClassification;
  private Date inputDate;
  private String historyContent, welfareContent;
  private Date baseDate;
  private String category;
  private int page;
  private String searchCtgry,searchDataValue;
  
  // 페이지 번호에 따른 시작 행과 끝 행 계산
  public int getStartRow() {
      return (page * 5) - 4;
  }

  public int getEndRow() {
      return page * 5;
  }
}
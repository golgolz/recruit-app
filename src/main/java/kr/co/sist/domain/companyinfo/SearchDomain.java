package kr.co.sist.domain.companyinfo;

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
public class SearchDomain {
  private String field, keyword;
  private String currentPage;
  private int num, startNum, endNum;
  private int avgSal, revenue, headcount;
  private String companyCode, companyName, description, logo, companyImg, businessNumber, addr, ceoName, companyClassification;
  private Date establishmentDate, inputDate;
  private String historyContent, welfareContent;
  private Date baseDate;
  private String category;
}
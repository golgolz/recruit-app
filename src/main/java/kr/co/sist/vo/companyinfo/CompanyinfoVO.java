package kr.co.sist.vo.companyinfo;

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
public class CompanyinfoVO {
    private int avgSal, revenue, headcount;
    private String companyCode, companyName, description, logo, companyImg, businessNumber, addr, ceoName, companyClassification, inputDate, establishmentDate;
}
package kr.co.sist.vo.companyinfo;

import java.sql.Date;
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
    private int avgSal, revenue;
    private String companyCode, companyName, description, logo, companyImg, businessNumber, addr, ceoName, companyClassification;
    private Date inputDate;
}
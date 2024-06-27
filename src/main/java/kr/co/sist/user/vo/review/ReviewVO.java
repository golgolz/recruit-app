package kr.co.sist.user.vo.review;

import java.util.Date;
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
public class ReviewVO {
    private String companyCode;     // ��� �ڵ�
    private String companyName;     // ��� �̸�
    private int totalSurveys;       // �� ���� ��
    private double avgQuestion1;    // ���� 1 ��� ����
    private double avgQuestion2;    // ���� 2 ��� ����
    private double avgQuestion3;    // ���� 3 ��� ����
    private double avgQuestion4;    // ���� 4 ��� ����
    private String title;           // ���� ����
    private String content;         // ���� ����
    private String userId;          // ����� ID
    private Date inputDate;         // �ۼ���
    private int recommend;          // ��õ��
}

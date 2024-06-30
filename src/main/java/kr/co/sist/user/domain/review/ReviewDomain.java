package kr.co.sist.user.domain.review;

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
public class ReviewDomain {
    private String companyCode;  // ��� �ڵ�
    private String userId;       // ����� ID
    private String title;        // ���� ����
    private String content;      // ���� ����
}


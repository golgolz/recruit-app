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
    private int reviewNum;      // ���� ��ȣ
    private String companyCode;  // ��� �ڵ�
    private String userId;       // ����� ID
    private String title;        // ���� ����
    private String content;      // ���� ����
    
    // �ʿ��� ��� ������ �����ε�
    public ReviewDomain(String companyCode, String userId, String title, String content) {
        this.companyCode = companyCode;
        this.userId = userId;
        this.title = title;
        this.content = content;
    }
    
}


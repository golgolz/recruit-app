package kr.co.sist.admin.vo.qna;

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
public class SearchVO {
    private String keyword;

    private int currentPage = 1; // ����ڰ� ���� �����ִ� ������ ��ȣ
    private int itemsPerPage = 10; // �� �������� ǥ���� �׸��� ��
    private int totalItems; // ��ü ���������� ��
    private int totalPages; // ��ü �������� �� �׸� ��(�׸� ���� �������� �׸� ���� ������� ���)
    private int startItemIndex; // ���� ���������� ù ��°�� ǥ�õ� �׸��� �ε����� ��Ÿ���� ����
    private int endItemIndex; // ���� ���������� ���������� ǥ�õ� �׸��� �ε����� ��Ÿ���� ����
}
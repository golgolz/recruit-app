package kr.co.sist.user.vo.review;

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
public class ReviewQuestionsVO {
    private int reviewNum;          // ���� ��ȣ
    private int question1;          // ���� 1
    private int question2;          // ���� 2
    private int question3;          // ���� 3
    private int question4;          // ���� 4
}
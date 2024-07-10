package kr.co.sist.admin.vo.qna;

import java.sql.Date;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@ToString
public class QnaVO {

    private int qna_num;
    private int view_num;
    private String category, title, content, user_id, flag;
    private Date input_date;

    private String ans_title, ans_content, admin_id, reciever;
    private Date reply_date;
}

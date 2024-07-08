package kr.co.sist.admin.domain.qna;

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
public class QnaDomain {
    private int qna_num;
    private String category;
    private String title;
    private String content;
    private String user_id;
    private String flag;
    private Date input_date;

    private String ans_title;
    private String ans_content;
    private String admin_id;
    private Date reply_date;
    private String reciever;

}

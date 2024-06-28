package kr.co.sist.user.domain.qna;

import java.sql.Date;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@ToString
public class UserQnaDomain {

    private int qna_num;
    private String category;
    private String title;
    private String content;
    private String user_id;
    private Date input_date;

    private String ans_title;
    private String ans_content;
    private String admin_id;
    private Date reply_date;
    private String reciever;
}

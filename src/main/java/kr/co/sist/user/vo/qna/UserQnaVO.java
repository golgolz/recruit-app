package kr.co.sist.user.vo.qna;

import java.util.Date;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
@NoArgsConstructor
@AllArgsConstructor
public class UserQnaVO {

    private int qna_num, view_num;
    private String category, title, content, user_id, flag;
    private Date input_date;

    private String ans_title, ans_content, admin_id, reciever;
    private Date reply_date;
}


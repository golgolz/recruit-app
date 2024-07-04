package kr.co.sist.user.dao.notice;

import java.util.List;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import kr.co.sist.properties.MyBatisConfig;
import kr.co.sist.user.domain.notice.NoticeUserDomain;

@Component
public class NoticeUserDAO {
    @Autowired(required = false)
    private MyBatisConfig myBatis;

    public NoticeUserDAO(MyBatisConfig myConfig) {
        this.myBatis = myBatis;
    }

    public List<NoticeUserDomain> selectNotices() {
        SqlSession session = myBatis.getMyBatisHandler(false);
        List<NoticeUserDomain> noticeList =
                session.selectList("kr.co.sist.notice.user.selectNotices");
        myBatis.closeHandler(session);
        return noticeList;
    }

    // public List<NoticeUserDomain> selectNoticesByCategory(String category) {
    // SqlSession session = myBatis.getMyBatisHandler(false);
    // List<NoticeUserDomain> noticeList =
    // session.selectList("kr.co.sist.notice.user.selectNoticesByCategory", category);
    // myBatis.closeHandler(session);
    // return noticeList;
    // }

    public List<NoticeUserDomain> selectNoticesByCategory(String category) {
        SqlSession session = myBatis.getMyBatisHandler(false);
        try {
            System.out.println("=============" + category);
            // MyBatis�� ���� SQL ����
            List<NoticeUserDomain> noticeList =
                    session.selectList("kr.co.sist.notice.user.selectNoticesByCategory", category);

            System.out.println("===== ��� ����Ʈ ========");
            for (NoticeUserDomain notice : noticeList) {
                System.out.println(notice);
            }
            return noticeList; // ��� ����Ʈ
        } catch (Exception e) {
            e.printStackTrace();
            throw new RuntimeException("�������� ��ȸ �� ���� �߻�", e);
        }
    }

    // public List<NoticeUserDomain> selectNotices(String category) {
    // SqlSession session = myBatis.getMyBatisHandler(false);
    // List<NoticeUserDomain> noticeList;
    // try {
    // if (category != null && !category.isEmpty() && !"��ü".equals(category)) {
    // noticeList = session.selectList(
    // "kr.co.sist.user.domain.notice.selectNoticesByCategory", category);
    // } else {
    // noticeList = session.selectList("kr.co.sist.user.domain.notice.selectNotices");
    // }
    // } finally {
    // myBatis.closeHandler(session);
    // }
    // return noticeList;
    // }

    public NoticeUserDomain selectOneNotice(int notice_num) {
        SqlSession session = myBatis.getMyBatisHandler(false);
        NoticeUserDomain noticeDtail =
                session.selectOne("kr.co.sist.notice.user.selectOneNotice", notice_num);
        myBatis.closeHandler(session);
        return noticeDtail;
    }

}

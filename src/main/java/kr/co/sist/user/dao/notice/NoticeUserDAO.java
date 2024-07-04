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
    }// �������� ��ü ����Ʈ �ҷ�����

    public List<NoticeUserDomain> selectNoticesByCategory(String category) {
        SqlSession session = myBatis.getMyBatisHandler(false);
        try {
            if ("��ü".equals(category)) {
                List<NoticeUserDomain> noticeList =
                        session.selectList("kr.co.sist.notice.user.selectNotices");
                for (NoticeUserDomain notice : noticeList) {
                }
                return noticeList; // ��� ����Ʈ
            } else {
                List<NoticeUserDomain> noticeList = session
                        .selectList("kr.co.sist.notice.user.selectNoticesByCategory", category);
                for (NoticeUserDomain notice : noticeList) {

                }
                return noticeList;
            }
        } catch (Exception e) {
            e.printStackTrace();
            throw new RuntimeException("�������� ��ȸ �� ���� �߻�", e);
        } finally {
            myBatis.closeHandler(session);
        }
    }// �������� ī�װ��� �ҷ�����

    public Object selectNoticesbyKeyword(String keyword) {
        SqlSession session = myBatis.getMyBatisHandler(false);
        try {
            List<NoticeUserDomain> noticeList =
                    session.selectList("kr.co.sist.notice.user.selectNoticesbyKeyword", keyword);
            if (noticeList.isEmpty()) {
                return null; // �˻��������
            } else if (noticeList.size() == 1) {
                return noticeList.get(0); // �˻���� �������� �ϳ�
            } else {
                return noticeList; // �˻���� �������� ����Ʈ
            }
        } catch (Exception e) {
            throw new RuntimeException("�������� ��ȸ �� ���� �߻�", e);
        } finally {
            myBatis.closeHandler(session);
        }
    }


    public NoticeUserDomain selectOneNotice(int notice_num) {
        SqlSession session = myBatis.getMyBatisHandler(false);
        NoticeUserDomain noticeDtail =
                session.selectOne("kr.co.sist.notice.user.selectOneNotice", notice_num);
        myBatis.closeHandler(session);
        return noticeDtail;
    }// �������� ����ȸ

}

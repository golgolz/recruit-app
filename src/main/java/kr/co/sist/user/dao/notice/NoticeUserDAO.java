package kr.co.sist.user.dao.notice;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
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

    public List<NoticeUserDomain> selectNotices() { // sVO만 추가됨
        SqlSession session = myBatis.getMyBatisHandler(false);
        List<NoticeUserDomain> noticeList =
                session.selectList("kr.co.sist.notice.user.selectNotices");
        myBatis.closeHandler(session);
        return noticeList;
    }// 전체 공지사항 불러오기

    public int countNotices() {
        SqlSession session = myBatis.getMyBatisHandler(false);
        int count = session.selectOne("kr.co.sist.notice.user.countNotices");
        myBatis.closeHandler(session);
        return count;
    }// 공지사항 전체 수 불러오기

    public List<NoticeUserDomain> selectNoticesByCategory(String category) { // searchVO추가
        SqlSession session = myBatis.getMyBatisHandler(false);
        try {
            if ("전체".equals(category)) {
                List<NoticeUserDomain> noticeList =
                        session.selectList("kr.co.sist.notice.user.selectNotices");
                for (NoticeUserDomain notice : noticeList) {
                }
                return noticeList;
            } else {
                List<NoticeUserDomain> noticeList = session
                        .selectList("kr.co.sist.notice.user.selectNoticesByCategory", category);
                for (NoticeUserDomain notice : noticeList) {
                }
                return noticeList;
            }
        } catch (Exception e) {
            e.printStackTrace();
            throw new RuntimeException("오류 발생", e);
        } finally {
            myBatis.closeHandler(session);
        }
    }// 공지사항 카테고리별 검색



    public List<NoticeUserDomain> selectNoticesbyKeyword(String keyword, String searchType) {
        SqlSession session = myBatis.getMyBatisHandler(false);
        try {
            Map<String, String> params = new HashMap<>();
            params.put("keyword", keyword);
            params.put("searchType", searchType);

            List<NoticeUserDomain> noticeList =
                    session.selectList("kr.co.sist.notice.user.selectNoticesbyKeyword", params);
            return noticeList;
        } catch (Exception e) {
            throw new RuntimeException("오류", e);
        } finally {
            myBatis.closeHandler(session);
        }
    }// 공지사항 키워드별 검색



    public NoticeUserDomain selectOneNotice(int notice_num) {
        SqlSession session = myBatis.getMyBatisHandler(false);
        NoticeUserDomain noticeDtail =
                session.selectOne("kr.co.sist.notice.user.selectOneNotice", notice_num);
        myBatis.closeHandler(session);
        return noticeDtail;
    }// 공지사항 상세조회

}

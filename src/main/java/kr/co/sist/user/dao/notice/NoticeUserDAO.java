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

    public List<NoticeUserDomain> selectNotices() {
        SqlSession session = myBatis.getMyBatisHandler(false);
        List<NoticeUserDomain> noticeList =
                session.selectList("kr.co.sist.notice.user.selectNotices");
        myBatis.closeHandler(session);
        return noticeList;
    }// 공지사항 전체 리스트 불러오기

    public List<NoticeUserDomain> selectNoticesByCategory(String category) {
        SqlSession session = myBatis.getMyBatisHandler(false);
        try {
            if ("전체".equals(category)) {
                List<NoticeUserDomain> noticeList =
                        session.selectList("kr.co.sist.notice.user.selectNotices");
                for (NoticeUserDomain notice : noticeList) {
                }
                return noticeList; // 결과 리스트
            } else {
                List<NoticeUserDomain> noticeList = session
                        .selectList("kr.co.sist.notice.user.selectNoticesByCategory", category);
                for (NoticeUserDomain notice : noticeList) {

                }
                return noticeList;
            }
        } catch (Exception e) {
            e.printStackTrace();
            throw new RuntimeException("공지사항 조회 중 오류 발생", e);
        } finally {
            myBatis.closeHandler(session);
        }
    }// 공지사항 카테고리로 불러오기

    // public Object selectNoticesbyKeyword(String keyword, String searchType) {
    // SqlSession session = myBatis.getMyBatisHandler(false);
    // try {
    // Map<String, String> params = new HashMap<>();
    // params.put("keyword", keyword);
    // params.put("searchType", searchType);
    //
    // List<NoticeUserDomain> noticeList =
    // session.selectList("kr.co.sist.notice.user.selectNoticesbyKeyword", params);
    //
    // if (noticeList.isEmpty()) {
    // return null; // 검색 결과 없음
    // } else if (noticeList.size() == 1) {
    // return noticeList.get(0); // 검색 결과 공지사항 하나
    // } else {
    // return noticeList; // 검색 결과 공지사항 리스트
    // }
    // } catch (Exception e) {
    // throw new RuntimeException("오류 발생", e);
    // } finally {
    // myBatis.closeHandler(session);
    // }
    // }

    public List<NoticeUserDomain> selectNoticesbyKeyword(String keyword, String searchType) {
        SqlSession session = myBatis.getMyBatisHandler(false);
        try {
            Map<String, String> params = new HashMap<>();
            params.put("keyword", keyword);
            params.put("searchType", searchType);

            List<NoticeUserDomain> noticeList =
                    session.selectList("kr.co.sist.notice.user.selectNoticesbyKeyword", params);

            return noticeList; // List<NoticeUserDomain> 형태로 반환
        } catch (Exception e) {
            throw new RuntimeException("오류 발생", e);
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
    }// 공지사항 상세조회

}

package kr.co.sist.user.service.notice;

import java.util.Collections;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import kr.co.sist.user.dao.notice.NoticeUserDAO;
import kr.co.sist.user.domain.notice.NoticeUserDomain;

@Service
public class NoticeUserService {

    @Autowired(required = false)
    private NoticeUserDAO noticeUserDAO;

    public NoticeUserService(NoticeUserDAO noticeUserDAO) {
        this.noticeUserDAO = noticeUserDAO;
    }

    public List<NoticeUserDomain> searchNotices() {
        List<NoticeUserDomain> notieceList = null;
        notieceList = noticeUserDAO.selectNotices();
        return notieceList;
    }// 전체 공지사항 불러오기



    public int countNotices() {
        return noticeUserDAO.countNotices();
    }// 공지사항 전체 수 불러오기

    public List<NoticeUserDomain> searchNoticesByCategory(String category) {
        List<NoticeUserDomain> result = noticeUserDAO.selectNoticesByCategory(category);
        return result;
    }// 공지사항 카테고리별 검색



    public List<NoticeUserDomain> searchNoticesbyKeyword(String keyword, String searchType) {
        try {
            if ("전체".equals(searchType)) {
                return noticeUserDAO.selectNotices();
            } else {
                Object result = noticeUserDAO.selectNoticesbyKeyword(keyword, searchType);
                if (result instanceof List<?>) {
                    return (List<NoticeUserDomain>) result;
                } else if (result instanceof NoticeUserDomain) {
                    return Collections.singletonList((NoticeUserDomain) result);
                } else {
                    return Collections.emptyList();
                }
            }
        } catch (Exception e) {
            throw new RuntimeException("오류 발생", e);
        }
    }// 공지사항 키워드 검색



    public NoticeUserDomain searchOneNotice(int notice_num) {
        NoticeUserDomain noticeDetail = null;
        noticeDetail = noticeUserDAO.selectOneNotice(notice_num);
        return noticeDetail;
    }// 공지사항 상세조회
}

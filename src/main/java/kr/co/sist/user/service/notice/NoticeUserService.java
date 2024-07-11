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
    }



    public List<NoticeUserDomain> searchNoticesByCategory(String category) {
        List<NoticeUserDomain> result = noticeUserDAO.selectNoticesByCategory(category);
        return result;
    }

    // public Object searchNoticesbyKeyword(String keyword, String searchType) {
    // try {
    // Object result = noticeUserDAO.selectNoticesbyKeyword(keyword, searchType);
    // return result;
    // } catch (Exception e) {
    // throw new RuntimeException("오류 발생", e);
    // }
    // }

    public List<NoticeUserDomain> searchNoticesbyKeyword(String keyword, String searchType) {
        try {
            // 검색 타입이 '선택'일 경우 전체 리스트를 반환
            if ("선택".equals(searchType)) {
                return noticeUserDAO.selectNotices(); // 전체 공지사항 리스트를 반환하는 DAO 메서드 호출
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
    }



    public NoticeUserDomain searchOneNotice(int notice_num) {
        NoticeUserDomain noticeDetail = null;
        noticeDetail = noticeUserDAO.selectOneNotice(notice_num);
        return noticeDetail;
    }
}

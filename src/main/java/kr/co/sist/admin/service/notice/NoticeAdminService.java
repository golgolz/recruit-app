package kr.co.sist.admin.service.notice;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import kr.co.sist.admin.dao.notice.NoticeAdminDAO;
import kr.co.sist.admin.vo.notice.SearchVO;

@Service
public class NoticeAdminService {

    @Autowired(required = false)
    private NoticeAdminDAO noticeAdminDAO;
    
    public List<SearchVO> searchAllnotice(SearchVO sVO) {
        List<SearchVO> list = null;
        list = noticeAdminDAO.selectAllNotice(sVO);
        System.out.println(list);
        return list;
    }

    public List<SearchVO> searchNoticeDetail(String noticeNum) {
        
        return null;
    }

}

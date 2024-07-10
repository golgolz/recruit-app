package kr.co.sist.admin.service.notice;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import kr.co.sist.admin.dao.notice.NoticeAdminDAO;
import kr.co.sist.admin.vo.notice.SearchVO;

public class NoticeAdminService {

    @Autowired(required = false)
    private NoticeAdminDAO noticeAdminDAO;
    
    public List<SearchVO> searchAllnotice() {
        List<SearchVO> list = null;
        list = noticeAdminDAO.selectAllNotice();
        return list;
    }

}

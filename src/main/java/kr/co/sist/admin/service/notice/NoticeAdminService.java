package kr.co.sist.admin.service.notice;

import java.util.List;
import org.apache.ibatis.exceptions.PersistenceException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import kr.co.sist.admin.dao.notice.NoticeAdminDAO;
import kr.co.sist.admin.vo.notice.NoticeAdminVO;
import kr.co.sist.admin.vo.notice.SearchVO;

@Service
public class NoticeAdminService {

    @Autowired(required = false)
    private NoticeAdminDAO noticeAdminDAO;
    
    public List<SearchVO> searchAllnotice(SearchVO sVO) {
        List<SearchVO> list = null;
        list = noticeAdminDAO.selectAllNotice(sVO);
        return list;
    }

    public List<SearchVO> searchNoticeDetail(int noticeNum) {
        List<SearchVO> list = null;
        try {
            list = noticeAdminDAO.selectNoticeDetail(noticeNum);

        } catch (PersistenceException pe) {
            pe.printStackTrace();
        }
        return list;
    }

    public boolean addNotice(NoticeAdminVO nVO) {
        boolean result=false;
        int i=0;
        i=noticeAdminDAO.insertNotice(nVO);
        if(i==0) {
            result=false;
        }else {
            result=true;
        }
        return result;
    }

    public boolean updateNoticeNum(NoticeAdminVO nVO) {
        boolean result=false;
        int i=0;
        i=noticeAdminDAO.updateNotice(nVO);
        if(i==0) {
            result=false;
        }else {
            result=true;
        }        
        return result;
    }
    
    public int searchNextNoticeNum() {

        int nextNoticeNum=0;
        int lastNoticeNum = noticeAdminDAO.selectLastNoticeNum();
        System.out.println("=================lastnoticenum: "+lastNoticeNum);
        lastNoticeNum++;
        nextNoticeNum=lastNoticeNum;

        System.out.println("=================service의 공지사항번호: "+nextNoticeNum);
        
        return nextNoticeNum;
          
    }

    public boolean deleteNotice(int noticeNum) {
        boolean result=false;
        int i=0;
        i=noticeAdminDAO.deleteHistory(noticeNum);
        if(i == 0) {
            result=false;
        }else {
            result=true;
        }
        
        return result;
    }


}

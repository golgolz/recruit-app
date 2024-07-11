package kr.co.sist.admin.dao.notice;

import java.util.ArrayList;
import java.util.List;
import org.apache.ibatis.exceptions.PersistenceException;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import kr.co.sist.admin.vo.notice.NoticeAdminVO;
import kr.co.sist.admin.vo.notice.SearchVO;
import kr.co.sist.properties.MyBatisConfig;

@Component
public class NoticeAdminDAO {

    @Autowired(required=false)
    private MyBatisConfig mbConfig;
    
    public List<SearchVO> selectAllNotice(SearchVO sVO)throws PersistenceException{
        SqlSession ss=mbConfig.getMyBatisHandler(false);
        List<SearchVO> list= new ArrayList<SearchVO>();
        list=ss.selectList("kr.co.sist.admin.notice.selectAllNotice",sVO);
        mbConfig.closeHandler(ss);
        return list;
    }

    public List<SearchVO> selectNoticeDetail(int noticeNum) {
        List<SearchVO> list=null;
        SqlSession ss=mbConfig.getMyBatisHandler(false);
        list=ss.selectList("kr.co.sist.admin.notice.selectNoticeDetail", noticeNum);
        mbConfig.closeHandler(ss);
        
        return list;
    }

    public int insertNotice(NoticeAdminVO nVO) {
        int result=0;
        SqlSession ss = mbConfig.getMyBatisHandler(true);
        ss.insert("kr.co.sist.admin.notice.insertNotice", nVO);
        mbConfig.closeHandler(ss);

        return result;
    }
    
    public int selectLastNoticeNum() throws PersistenceException {
        
        int lastNoticeNum=0;
        SqlSession ss=mbConfig.getMyBatisHandler(false);
        lastNoticeNum=ss.selectOne("kr.co.sist.admin.notice.lastNoticeNum");
        mbConfig.closeHandler(ss);
     
        System.out.println("=================dao의 공지사항번호: "+lastNoticeNum);
        
        return lastNoticeNum;
    }

}

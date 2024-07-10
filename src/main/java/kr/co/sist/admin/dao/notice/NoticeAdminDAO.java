package kr.co.sist.admin.dao.notice;

import java.util.ArrayList;
import java.util.List;
import org.apache.ibatis.exceptions.PersistenceException;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import kr.co.sist.admin.vo.notice.SearchVO;
import kr.co.sist.properties.MyBatisConfig;

public class NoticeAdminDAO {

    @Autowired(required=false)
    private MyBatisConfig mbConfig;
    
    public List<SearchVO> selectAllNotice(SearchVO sVO)throws PersistenceException{
        SqlSession ss=mbConfig.getMyBatisHandler(false);
        List<SearchVO> list= new ArrayList<SearchVO>();
        list=ss.selectList("kr.co.sist.admin.notice.selectAllNotice",sVO);
        System.out.println("다오에서의 리스트==============="+list);
        mbConfig.closeHandler(ss);
        return list;
    }

}

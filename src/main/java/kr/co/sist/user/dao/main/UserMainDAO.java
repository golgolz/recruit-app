package kr.co.sist.user.dao.main;

import java.util.List;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import kr.co.sist.properties.MyBatisConfig;
import kr.co.sist.user.vo.main.MainVO;

@Component
public class UserMainDAO {
    
    @Autowired(required = false)
    private MyBatisConfig myBatis;

    public List<MainVO> selectRecentJobPosts() {
        SqlSession ss = myBatis.getMyBatisHandler(false);
        return ss.selectList("kr.co.sist.user.dao.main.UserMainDAO.selectRecentJobPosts");
    }

    public List<MainVO> selectInterestedPositions(String userId) {
        SqlSession ss = myBatis.getMyBatisHandler(false);
        return ss.selectList("kr.co.sist.user.dao.main.UserMainDAO.selectInterestedPositions", userId);
    }

    public List<MainVO> selectDefaultInterestedPositions() {
        SqlSession ss = myBatis.getMyBatisHandler(false);
        return ss.selectList("kr.co.sist.user.dao.main.UserMainDAO.selectDefaultInterestedPositions");
    }

    public List<MainVO> selectHighSalaryPositions() {
        SqlSession ss = myBatis.getMyBatisHandler(false);
        return ss.selectList("kr.co.sist.user.dao.main.UserMainDAO.selectHighSalaryPositions");
    }
    
    public List<MainVO> selectViewHistory(String userId) {
        SqlSession ss = myBatis.getMyBatisHandler(false);
        return ss.selectList("kr.co.sist.user.dao.main.UserMainDAO.selectViewHistory", userId);
    }
    
    // ÄíÅ° »ç¿ë 
    public MainVO selectRecruitByNum(String recruitNum) {
        SqlSession ss = myBatis.getMyBatisHandler(false);
        return ss.selectOne("kr.co.sist.user.dao.main.UserMainDAO.selectRecruitByNum", recruitNum);
    }
    
    public List<MainVO> selectViewHistoryFromCookie(String[] recruitNums) {
        SqlSession ss = myBatis.getMyBatisHandler(false);
        return ss.selectList("kr.co.sist.user.dao.main.UserMainDAO.selectViewHistoryFromCookie", recruitNums);
    }

}

package kr.co.sist.user.dao.qna;

import java.util.List;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import kr.co.sist.properties.MyBatisConfig;
import kr.co.sist.user.domain.qna.UserQnaDomain;
import kr.co.sist.user.vo.qna.SearchVO;
import kr.co.sist.user.vo.qna.UserQnaVO;

@Component
public class QnaUserDAO {
    @Autowired(required = false)
    private MyBatisConfig myBatis;

    public QnaUserDAO(MyBatisConfig myBatis) {
        this.myBatis = myBatis;
    }

    public List<UserQnaDomain> selectMyQnas(SearchVO sVO) {// searchVOÃß°¡
        SqlSession session = myBatis.getMyBatisHandler(false);
        List<UserQnaDomain> qna = null;
        qna = session.selectList("kr.co.sist.qna.user.selectMyQnas", sVO);
        myBatis.closeHandler(session);
        return qna;
    }

    public int countMyQnas() {
        SqlSession session = myBatis.getMyBatisHandler(false);
        int count = session.selectOne("kr.co.sist.qna.user.countMyQnas");
        myBatis.closeHandler(session);
        return count;
    }

    public UserQnaDomain selectOneQna(int qna_num) {
        SqlSession session = myBatis.getMyBatisHandler(false);
        UserQnaDomain qnaDetail = session.selectOne("kr.co.sist.qna.user.selectOneQna", qna_num);
        myBatis.closeHandler(session);
        return qnaDetail;
    }

    public void insertQna(UserQnaVO qVO) {
        SqlSession session = myBatis.getMyBatisHandler(true);
        session.insert("kr.co.sist.qna.user.insertQna", qVO);
        myBatis.closeHandler(session);
    }
}

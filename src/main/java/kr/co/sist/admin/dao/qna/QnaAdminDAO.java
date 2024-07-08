package kr.co.sist.admin.dao.qna;

import java.util.List;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import kr.co.sist.admin.domain.qna.QnaDomain;
import kr.co.sist.admin.vo.qna.QnaVO;
import kr.co.sist.properties.MyBatisConfig;

@Component
public class QnaAdminDAO {
    @Autowired(required = false)
    private MyBatisConfig myBatis;

    public QnaAdminDAO(MyBatisConfig myBatis) {
        this.myBatis = myBatis;
    }

    public List<QnaDomain> selectNewQnas() {
        SqlSession session = myBatis.getMyBatisHandler(false);
        List<QnaDomain> qnas = null;
        qnas = session.selectList("kr.co.sist.qna.admin.selectNewQnas");
        myBatis.closeHandler(session);
        return qnas;
    }

    public QnaDomain selectOneNewQna(int qna_num) {
        SqlSession session = myBatis.getMyBatisHandler(false);
        QnaDomain newDetail = session.selectOne("kr.co.sist.qna.admin.selectOneNewQna", qna_num);
        myBatis.closeHandler(session);
        return newDetail;
    }

    public List<QnaDomain> selectOldQnas() {
        SqlSession session = myBatis.getMyBatisHandler(false);
        List<QnaDomain> oldQnas = null;
        oldQnas = session.selectList("kr.co.sist.qna.admin.selectOldQnas");
        myBatis.closeHandler(session);
        return oldQnas;
    }

    public QnaDomain selectOneOldQna(int qna_num) {
        SqlSession session = myBatis.getMyBatisHandler(false);
        QnaDomain oldDetail = session.selectOne("kr.co.sist.qna.admin.selectOneOldQna", qna_num);
        myBatis.closeHandler(session);
        return oldDetail;
    }

    public int insertQnaAnswer(QnaVO qVO) {
        SqlSession session = myBatis.getMyBatisHandler(true);
        // System.out.println(qVO);
        int result = session.insert("kr.co.sist.qna.admin.insertQnaAnswer", qVO);
        myBatis.closeHandler(session);
        return result;
    }

    public int updateQnaFlag(int qna_num) {
        SqlSession session = myBatis.getMyBatisHandler(true);
        int result2 = session.update("kr.co.sist.qna.admin.updateQnaFlag", qna_num);
        System.out.println("-------------updateflag" + qna_num);
        session.commit();
        System.out.println("-------------com" + qna_num);
        myBatis.closeHandler(session);
        return result2;
    }
}

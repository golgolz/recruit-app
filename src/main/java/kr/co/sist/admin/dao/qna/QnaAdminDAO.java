package kr.co.sist.admin.dao.qna;

import java.util.List;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import kr.co.sist.admin.domain.qna.QnaDomain;
import kr.co.sist.admin.vo.qna.QnaVO;
import kr.co.sist.admin.vo.qna.SearchVO;
import kr.co.sist.properties.MyBatisConfig;

@Component
public class QnaAdminDAO {
    @Autowired(required = false)
    private MyBatisConfig myBatis;

    public QnaAdminDAO(MyBatisConfig myBatis) {
        this.myBatis = myBatis;
    }

    public List<QnaDomain> selectNewQnas(SearchVO sVO) { // searchVO만 추가했음.
        SqlSession session = myBatis.getMyBatisHandler(false);
        List<QnaDomain> qnas = null;
        qnas = session.selectList("kr.co.sist.qna.admin.selectNewQnas", sVO);
        myBatis.closeHandler(session);
        return qnas;
    }// 답변 대기 문의 리스트

    public int countNewQnas() {
        SqlSession session = myBatis.getMyBatisHandler(false);
        int count = session.selectOne("kr.co.sist.qna.admin.countNewQnas");
        myBatis.closeHandler(session);
        return count;
    }

    public QnaDomain selectOneNewQna(int qna_num) {
        SqlSession session = myBatis.getMyBatisHandler(false);
        QnaDomain newDetail = session.selectOne("kr.co.sist.qna.admin.selectOneNewQna", qna_num);
        myBatis.closeHandler(session);
        return newDetail;
    }// 답변 대기 문의 상세 조회

    public List<QnaDomain> selectOldQnas(SearchVO sVO) {
        SqlSession session = myBatis.getMyBatisHandler(false);
        List<QnaDomain> oldQnas = null;
        oldQnas = session.selectList("kr.co.sist.qna.admin.selectOldQnas", sVO);
        myBatis.closeHandler(session);
        System.out.println("$$$$$$$$$$$$$$$" + oldQnas + "^^^^^^^^^^^" + sVO);
        return oldQnas;
    }// 답변 완료 문의 리스트 조회

    public int countQnas() {
        SqlSession session = myBatis.getMyBatisHandler(false);
        int qnaCount = session.selectOne("kr.co.sist.qna.admin.countQnas");
        myBatis.closeHandler(session);
        return qnaCount;
    }

    public QnaDomain selectOneOldQna(int qna_num) {
        SqlSession session = myBatis.getMyBatisHandler(false);
        QnaDomain oldDetail = session.selectOne("kr.co.sist.qna.admin.selectOneOldQna", qna_num);
        myBatis.closeHandler(session);
        return oldDetail;
    }// 답변 완료 문의 상세 조회

    public int insertQnaAnswer(QnaVO qVO) {
        SqlSession session = myBatis.getMyBatisHandler(true);
        // System.out.println(qVO);
        int result = session.insert("kr.co.sist.qna.admin.insertQnaAnswer", qVO);
        myBatis.closeHandler(session);
        return result;
    }// 답변하기

    public int updateQnaFlag(int qna_num) {
        SqlSession session = myBatis.getMyBatisHandler(true);
        int result2 = session.update("kr.co.sist.qna.admin.updateQnaFlag", qna_num);
        System.out.println("-------------updateflag" + qna_num);
        session.commit();
        System.out.println("-------------com" + qna_num);
        myBatis.closeHandler(session);
        return result2;
    }// 답변 플래그 바꾸기

}

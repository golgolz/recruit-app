package kr.co.sist.admin.service.qna;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import kr.co.sist.admin.dao.qna.QnaAdminDAO;
import kr.co.sist.admin.domain.qna.QnaDomain;
import kr.co.sist.admin.vo.qna.QnaVO;

@Service
public class QnaAdminService {

    @Autowired(required = false)
    private QnaAdminDAO qnaAdminDAO;

    public QnaAdminService(QnaAdminDAO qnaAdminDAO) {
        this.qnaAdminDAO = qnaAdminDAO;
    }

    public List<QnaDomain> searchNewQnas() {
        List<QnaDomain> qnas = null;
        qnas = qnaAdminDAO.selectNewQnas();
        return qnas;
    }

    public QnaDomain searchOneNewQna(int qna_num) {
        QnaDomain oneQna = null;
        oneQna = qnaAdminDAO.selectOneNewQna(qna_num);
        return oneQna;
    }

    public List<QnaDomain> searchOldQnas() {
        List<QnaDomain> oldQnas = null;
        oldQnas = qnaAdminDAO.selectOldQnas();
        return oldQnas;
    }

    public QnaDomain searchOneOldQna(int qna_num) {
        QnaDomain oneOldQna = null;
        oneOldQna = qnaAdminDAO.selectOneOldQna(qna_num);
        return oneOldQna;
    }

    public int addQnaAnswer(QnaVO qVO) {
        int result = qnaAdminDAO.insertQnaAnswer(qVO);
        // qnaAdminDAO.updateQnaFlag(qVO.getQna_num());
        return result;
    }

    public int updateQnaFlag(int qna_num) {
        System.out.println("Updating QNA flag for qna_num: " + qna_num);
        int result2 = qnaAdminDAO.updateQnaFlag(qna_num);
        System.out.println("Update result: " + result2);
        return result2;
    }



}

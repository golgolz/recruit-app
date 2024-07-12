package kr.co.sist.admin.service.qna;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import kr.co.sist.admin.dao.qna.QnaAdminDAO;
import kr.co.sist.admin.domain.qna.QnaDomain;
import kr.co.sist.admin.vo.qna.QnaVO;
import kr.co.sist.admin.vo.qna.SearchVO;

@Service
public class QnaAdminService {

    @Autowired(required = false)
    private QnaAdminDAO qnaAdminDAO;

    public QnaAdminService(QnaAdminDAO qnaAdminDAO) {
        this.qnaAdminDAO = qnaAdminDAO;
    }

    public List<Map<String, Object>> searchNewQnas(SearchVO sVO) {
        List<QnaDomain> qnas = qnaAdminDAO.selectNewQnas(sVO);
        List<Map<String, Object>> result = new ArrayList<>();
        for (QnaDomain qna : qnas) {
            Map<String, Object> map = new HashMap<>();
            map.put("view_num", qna.getView_num());
            map.put("qna_num", qna.getQna_num());
            map.put("title", qna.getTitle());
            map.put("input_date", qna.getInput_date());
            map.put("flag", qna.getFlag());
            result.add(map);
        }
        System.out.println("~~~~~~~~~~~~~~~~~~~~qnas: " + result);
        return result;
    }// 새 문의 리스트 불러오기

    public int countNewQnas() {
        return qnaAdminDAO.countNewQnas();
    }// 새 문의 전체 수

    public QnaDomain searchOneNewQna(int qna_num) {
        QnaDomain oneQna = null;
        oneQna = qnaAdminDAO.selectOneNewQna(qna_num);
        return oneQna;
    }// 새 문의 상세조회

    public List<Map<String, Object>> searchOldQnas(SearchVO sVO) { // �������� searchVO�� ����
        List<QnaDomain> qnas = qnaAdminDAO.selectOldQnas(sVO);
        List<Map<String, Object>> result = new ArrayList<>();
        for (QnaDomain oldQnas : qnas) {
            Map<String, Object> map = new HashMap<>();
            map.put("view_num", oldQnas.getView_num());
            map.put("qna_num", oldQnas.getQna_num());
            map.put("title", oldQnas.getTitle());
            map.put("input_date", oldQnas.getInput_date());
            map.put("flag", oldQnas.getFlag());
            result.add(map);
        }
        System.out.println("========================Old QnAs: " + result);
        return result;
    }// 답변 완료문의 리스트 불러오기

    public int countQnas() {
        return qnaAdminDAO.countQnas();
    }// 답변 완료 문의 사항 전체 수

    public QnaDomain searchOneOldQna(int qna_num) {
        QnaDomain oneOldQna = null;
        oneOldQna = qnaAdminDAO.selectOneOldQna(qna_num);
        return oneOldQna;
    }// 답변완료 문의 상세조회

    public int addQnaAnswer(QnaVO qVO) {
        int result = qnaAdminDAO.insertQnaAnswer(qVO);
        // qnaAdminDAO.updateQnaFlag(qVO.getQna_num());
        return result;
    }// 문의 답변하기

    public int updateQnaFlag(int qna_num) {
        System.out.println("Updating QNA flag for qna_num: " + qna_num);
        int result2 = qnaAdminDAO.updateQnaFlag(qna_num);
        System.out.println("Update result: " + result2);
        return result2;
    }// 플래그 바꾸기

}

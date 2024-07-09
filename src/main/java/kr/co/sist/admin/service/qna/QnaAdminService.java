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

    // public List<Map<String, Object>> searchNewQnas() {
    // List<QnaDomain> qnas = qnaAdminDAO.selectNewQnas();
    // List<Map<String, Object>> result = new ArrayList<>();
    // for (int i = 0; i < qnas.size(); i++) {
    // QnaDomain qna = qnas.get(i);
    // Map<String, Object> map = new HashMap<>();
    // map.put("view_num", i + 1);
    // map.put("qna_num", qna.getQna_num());
    // map.put("title", qna.getTitle());
    // map.put("input_date", qna.getInput_date());
    // map.put("flag", qna.getFlag());
    // result.add(map);
    // }
    // return result;
    // } // 답변 대기 문의 리스트

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
        return result;
    }

    public int countNewQnas() {
        return qnaAdminDAO.countNewQnas();
    }

    public QnaDomain searchOneNewQna(int qna_num) {
        QnaDomain oneQna = null;
        oneQna = qnaAdminDAO.selectOneNewQna(qna_num);
        return oneQna;
    }// 답변 대기 문의 상세 조회

    public List<Map<String, Object>> searchOldQnas() {
        List<QnaDomain> qnas = qnaAdminDAO.selectOldQnas();
        List<Map<String, Object>> result = new ArrayList<>();
        for (int i = 0; i < qnas.size(); i++) {
            QnaDomain qna = qnas.get(i);
            Map<String, Object> map = new HashMap<>();
            map.put("view_num", i + 1);
            map.put("qna_num", qna.getQna_num());
            map.put("category", qna.getCategory());
            map.put("title", qna.getTitle());
            map.put("input_date", qna.getInput_date());
            result.add(map);
        }
        return result;
    }// 답변 완료 문의 리스트 조회


    public QnaDomain searchOneOldQna(int qna_num) {
        QnaDomain oneOldQna = null;
        oneOldQna = qnaAdminDAO.selectOneOldQna(qna_num);
        return oneOldQna;
    }// 답변 완료 문의 상세 조회

    public int addQnaAnswer(QnaVO qVO) {
        int result = qnaAdminDAO.insertQnaAnswer(qVO);
        // qnaAdminDAO.updateQnaFlag(qVO.getQna_num());
        return result;
    }// 답변하기

    public int updateQnaFlag(int qna_num) {
        System.out.println("Updating QNA flag for qna_num: " + qna_num);
        int result2 = qnaAdminDAO.updateQnaFlag(qna_num);
        System.out.println("Update result: " + result2);
        return result2;
    }// 답변 플래그 바꾸기



}

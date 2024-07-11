package kr.co.sist.user.service.qna;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import kr.co.sist.user.dao.qna.QnaUserDAO;
import kr.co.sist.user.domain.qna.UserQnaDomain;
import kr.co.sist.user.vo.qna.SearchVO;
import kr.co.sist.user.vo.qna.UserQnaVO;

@Service
public class QnaUserService {

    @Autowired(required = false)
    private QnaUserDAO qnaUserDAO;

    public QnaUserService(QnaUserDAO qnaUserDAO) {
        this.qnaUserDAO = qnaUserDAO;
    }

    // public List<UserQnaDomain> searchMyQnaList() {
    // List<UserQnaDomain> qnaList = null;
    // qnaList = qnaUserDAO.selectMyQnas();
    // return qnaList;
    // }

    public List<Map<String, Object>> searchMyQnaList(SearchVO sVO) {
        List<UserQnaDomain> qna = qnaUserDAO.selectMyQnas(sVO);
        List<Map<String, Object>> result = new ArrayList<>();
        for (UserQnaDomain qnaList : qna) {
            Map<String, Object> map = new HashMap<>();
            map.put("view_num", qnaList.getView_num());
            map.put("qna_num", qnaList.getQna_num());
            map.put("title", qnaList.getTitle());
            map.put("input_date", qnaList.getInput_date());
            map.put("flag", qnaList.getFlag());
            result.add(map);
        }
        return result;
    }

    public int countMyQnas() {
        return qnaUserDAO.countMyQnas();
    }

    public UserQnaDomain searchOneQna(int qna_num) {
        UserQnaDomain oneQna = null;
        System.out.println("oneQna:------------" + oneQna);
        oneQna = qnaUserDAO.selectOneQna(qna_num);
        return oneQna;
    }

    public void addQna(UserQnaVO qVO) {
        qnaUserDAO.insertQna(qVO);
    }
}

package kr.co.sist.admin.controller.qna;

import java.util.List;
import java.util.Map;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import kr.co.sist.admin.domain.qna.QnaDomain;
import kr.co.sist.admin.service.qna.QnaAdminService;
import kr.co.sist.admin.vo.qna.QnaVO;

@Controller
public class QnaAdminController {
    @Autowired(required = false)
    private QnaAdminService qnaAdminService;

    public QnaAdminController(QnaAdminService qnaAdminService) {
        this.qnaAdminService = qnaAdminService;
    }

    @GetMapping("/manage/qna/new_qnas.do")
    public String searchNewQnas(Model model) {
        List<Map<String, Object>> newQnas = qnaAdminService.searchNewQnas();
        model.addAttribute("newQnas", newQnas);
        return "manage/qna/new_qnas";
    }

    @GetMapping("/manage/qna/new_detail.do")
    public String searchOneNewQna(@RequestParam("qna_num") int qnaNum, Model model) {
        QnaDomain newDetail = qnaAdminService.searchOneNewQna(qnaNum);
        model.addAttribute("newDetail", newDetail);
        return "manage/qna/new_detail";
    }

    // @GetMapping("/manage/qna/new_qnas.do")
    // public String searchNewQnas(Model model) {
    // List<QnaDomain> newQnas = qnaAdminService.searchNewQnas();
    // model.addAttribute("newQnas", newQnas);
    // return "manage/qna/new_qnas";
    // } // 새 문의사항 리스트 조회
    //
    // @GetMapping("/manage/qna/new_detail.do")
    // public String searchOneNewQna(QnaVO qVO, Model model) {
    // int qna_num = qVO.getQna_num();
    // // System.out.println(qVO.toString());
    // QnaDomain newDetail = qnaAdminService.searchOneNewQna(qna_num);
    //
    // System.out.println("----------" + qVO);
    // model.addAttribute("newDetail", newDetail);
    // return "manage/qna/new_detail";
    // } // 새 문의사항 상세조회

    @GetMapping("/manage/qna/qnas.do")
    public String searchOldQnas(Model model) {
        List<Map<String, Object>> oldQnas = qnaAdminService.searchOldQnas();
        model.addAttribute("oldQnas", oldQnas);
        return "manage/qna/qnas";
    } // 답변 완료된 문의사항 리스트 조회

    @GetMapping("/manage/qna/old_detail.do")
    public String searchOneOldQna(@RequestParam("qna_num") int qnaNum, Model model) {
        QnaDomain oldDetail = qnaAdminService.searchOneOldQna(qnaNum);
        model.addAttribute("oldDetail", oldDetail);
        return "manage/qna/old_detail";
    }

    // @GetMapping("/manage/qna/old_detail.do")
    // public String searchOneOldQna(QnaVO qVO, Model model) {
    // int qna_num = qVO.getQna_num();
    // // System.out.println(qVO.toString());
    // QnaDomain oldDetail = qnaAdminService.searchOneOldQna(qna_num);
    // model.addAttribute("oldDetail", oldDetail);
    //
    // System.out.println("------" + oldDetail);
    // return "manage/qna/old_detail";
    // } // 답변 완료된 문의사항 상세조회

    @PostMapping("/manage/qna/qnas.do")
    public String addQnaAnswer(QnaVO qVO, Model model) {
        int result = qnaAdminService.addQnaAnswer(qVO);
        if (result == 1) {
            int qna_num = qVO.getQna_num();
            int result2 = qnaAdminService.updateQnaFlag(qna_num);
            // System.out.println("여기!!!!!!!" + qna_num);
            if (result2 == 1) {
                // System.out.println("여기????");
                qVO.setAns_title("RE:" + qVO.getAns_title());
            }
        }
        model.addAttribute("qnaAnswer", qVO);
        return "manage/qna/qnas";
    }

}

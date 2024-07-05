package kr.co.sist.user.controller.qna;

import java.util.Arrays;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import kr.co.sist.user.domain.qna.UserQnaDomain;
import kr.co.sist.user.service.qna.QnaUserService;
import kr.co.sist.user.vo.qna.UserQnaVO;

@Controller
public class QnaUserController {
    @Autowired(required = false)
    private QnaUserService qnaUserService;

    public QnaUserController(QnaUserService qnaUserService) {
        this.qnaUserService = qnaUserService;
    }

    @GetMapping("/user/mypage/qna/mypageQNAList.do")
    public String searchMyQnaList(Model model) {
        List<UserQnaDomain> qnaList = qnaUserService.searchMyQnaList();
        model.addAttribute("qnaList", qnaList);
        return "user/mypage/qna/mypageQNAList";
    }

    @GetMapping("/user/mypage/qna/mypageQNADetail.do")
    public String searchOneQna(UserQnaVO qVO, Model model) {
        int qna_num = qVO.getQna_num();
        UserQnaDomain qnaDetail = qnaUserService.searchOneQna(qna_num);
        System.out.println("---------" + qVO.getQna_num());
        model.addAttribute("qnaDetail", qnaDetail);
        return "user/mypage/qna/mypageQNADetail";
    }

    @GetMapping("/user/mypage/qna/mypageQnaForm.do")
    public String showQnaForm(Model model) {
        model.addAttribute("categories", Arrays.asList("제안사항", "오류신고", "서비스 문의"));
        model.addAttribute("qVO", new UserQnaVO()); // 폼을 위한 빈 객체 추가
        return "user/mypage/qna/mypageWriteQNA"; // 해당 JSP로 이동
    }

    @PostMapping("/user/mypage/qna/mypageWriteQNA.do")
    public String addQna(@ModelAttribute("qVO") UserQnaVO qVO, Model model) {
        String category = qVO.getCategory();

        if (category == null || category.isEmpty()) {
            throw new IllegalArgumentException("카테고리를 선택해주세요.");
        }
        qnaUserService.addQna(qVO);
        System.out.println("++++qVO++++" + qVO);
        List<String> categories = Arrays.asList("제안사항", "오류신고", "서비스 문의");
        model.addAttribute("categories", categories);
        System.out.println("++++categories++++++++" + categories);
        model.addAttribute("qna", qVO);
        System.out.println("~~~~~~~~qVO~~~~~~~~" + qVO);

        return "redirect:/user/mypage/qna/mypageQNAList.do";
    }

}

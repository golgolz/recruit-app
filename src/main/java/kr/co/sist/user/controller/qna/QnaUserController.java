package kr.co.sist.user.controller.qna;

import java.util.Arrays;
import java.util.List;
import java.util.Map;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import kr.co.sist.user.domain.qna.UserQnaDomain;
import kr.co.sist.user.service.qna.QnaUserService;
import kr.co.sist.user.vo.qna.SearchVO;
import kr.co.sist.user.vo.qna.UserQnaVO;

@Controller
public class QnaUserController {
    @Autowired(required = false)
    private QnaUserService qnaUserService;

    public QnaUserController(QnaUserService qnaUserService) {
        this.qnaUserService = qnaUserService;
    }

    @GetMapping("/user/mypage/qna/mypageQNAList.do")
    public String searchMyQnaList(@RequestParam(defaultValue = "1") int currentPage,
            @RequestParam(defaultValue = "10") int itemsPerPage, Model model) {
        SearchVO sVO = new SearchVO();
        sVO.setCurrentPage(currentPage);
        sVO.setItemsPerPage(itemsPerPage);
        sVO.pageIndexes();

        int totlalItems = qnaUserService.countMyQnas();
        sVO.setTotalItems(totlalItems);
        sVO.setTotalPages((int) Math.ceil((double) totlalItems / itemsPerPage));

        List<Map<String, Object>> qnaList = qnaUserService.searchMyQnaList(sVO);
        model.addAttribute("qnaList", qnaList);
        model.addAttribute("searchVO", sVO);
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
        model.addAttribute("categories", Arrays.asList("서비스 문의", "제안사항", "오류신고"));
        model.addAttribute("qVO", new UserQnaVO());
        return "user/mypage/qna/mypageWriteQNA";
    }

    @PostMapping("/user/mypage/qna/mypageWriteQNA.do")
    public String addQna(@ModelAttribute("qVO") UserQnaVO qVO, Model model) {
        String category = qVO.getCategory();

        if (category == null || category.isEmpty()) {
            throw new IllegalArgumentException("오류.");
        }
        qnaUserService.addQna(qVO);
        System.out.println("++++qVO++++" + qVO);
        List<String> categories = Arrays.asList("서비스 문의", "제안사항", "오류신고");
        model.addAttribute("categories", categories);
        System.out.println("++++categories++++++++" + categories);
        model.addAttribute("qna", qVO);
        System.out.println("~~~~~~~~qVO~~~~~~~~" + qVO);

        return "redirect:/user/mypage/qna/mypageQNAList.do";
    }

}

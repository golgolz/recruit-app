package kr.co.sist.user.controller.review;

import java.util.List;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import kr.co.sist.user.domain.review.ReviewSurveyDomain;
import kr.co.sist.user.service.review.ReviewService;
import kr.co.sist.user.vo.review.ReviewVO;

@Controller
public class ReviewController {

    @Autowired(required = false)
    private ReviewService reviewService;

    @GetMapping("/review/reviewResult.do")
    public String reviewScreen(@RequestParam(value = "companyCode", defaultValue = "comp_0001") String companyCode, Model model) {
        List<ReviewVO> reviewScreenOutput = reviewService.getReviewScreenOutput(companyCode);
        model.addAttribute("reviewScreenOutput", reviewScreenOutput);
        return "review/reviewResult";
    }
    

    @GetMapping("/review/reviewSurvey.do")
    public String reviewSurveyForm() {
        return "review/reviewSurvey";
    }
    
    @PostMapping("/review/reviewSurvey.do")
    public String submitSurvey(
        @RequestParam("companyCode") String companyCode,
        @RequestParam("userId") String userId,
        @ModelAttribute ReviewSurveyDomain reviewSurveyDomain) {

        reviewSurveyDomain.setCompanyCode(companyCode);
        reviewSurveyDomain.setUserId(userId);

        reviewService.insertReviewSurvey(reviewSurveyDomain);
        return "redirect:/review/reviewResult.do?companyCode=" + companyCode; // ���� �� ���𷺼��� ������ ����
    }
    
    @PostMapping("/review/updateRecommend.do")
    public String updateRecommend(
        @RequestParam("reviewNum") int reviewNum,
        HttpSession session, RedirectAttributes redirectAttributes) {

        String userId = (String) session.getAttribute("userId");
        if (userId == null || userId.isEmpty()) {
            return "redirect:/user/loginPage.do"; // �α��� �������� ���𷺼�
        }

        boolean isRecommended = reviewService.updateRecommend(userId, reviewNum);
        if (!isRecommended) {
            redirectAttributes.addFlashAttribute("recommendMsg", "�̹� ��õ�߽��ϴ�.");
        } else {
            redirectAttributes.addFlashAttribute("recommendMsg", "��õ�� �Ϸ�Ǿ����ϴ�.");
        }

        return "redirect:/review/reviewResult.do"; // ���� �� ���� ��� �������� ���𷺼�
    }
}
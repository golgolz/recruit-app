package kr.co.sist.user.controller.review;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import javax.servlet.http.HttpSession;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import kr.co.sist.user.domain.review.ReviewDomain;
import kr.co.sist.user.domain.review.ReviewSurveyDomain;
import kr.co.sist.user.service.review.ReviewService;
import kr.co.sist.user.vo.review.CompanyInfoVO;
import kr.co.sist.user.vo.review.RecommendVO;
import kr.co.sist.user.vo.review.ReviewQuestionsVO;
import kr.co.sist.user.vo.review.ReviewVO;

@Controller
public class ReviewController {

    private static final Logger logger = LogManager.getLogger(ReviewService.class);

    @Autowired(required = false)
    private ReviewService reviewService;

    // ���� ȭ�� ���
    @GetMapping("/review/reviewResult.do")
    public String reviewScreen(
            @RequestParam(value = "companyCode", defaultValue = "comp_0001") String companyCode,
            @RequestParam(value = "page", defaultValue = "0") int page,
            @RequestParam(value = "reviewNum", required = false) Integer reviewNum, Model model) {

        int offset = page * 3;
        List<ReviewVO> reviewScreenOutput =
                reviewService.getReviewScreenOutputWithPagination(companyCode, offset);

        // reviewScreenOutput�� ������� ���� ��쿡�� reviewQuestionsMap ����
        Map<Integer, ReviewQuestionsVO> reviewQuestionsMap = new HashMap<>();
        if (!reviewScreenOutput.isEmpty()) {
            for (ReviewVO review : reviewScreenOutput) {
                ReviewQuestionsVO reviewQuestions =
                        reviewService.getReviewQuestions(review.getReviewNum());
                reviewQuestionsMap.put(review.getReviewNum(), reviewQuestions);
            }
        }

        // ȸ�� ���� ��������
        CompanyInfoVO companyInfo = reviewService.getCompanyDetailsByCode(companyCode);

        model.addAttribute("reviewScreenOutput", reviewScreenOutput);
        model.addAttribute("reviewQuestionsMap", reviewQuestionsMap);
        model.addAttribute("companyCode", companyCode);
        model.addAttribute("currentPage", page);
        model.addAttribute("companyInfo", companyInfo); // ȸ�� ���� �𵨿� �߰�

        // reviewNum�� null�� �ƴ� ��쿡�� �𵨿� �߰�
        if (reviewNum != null) {
            model.addAttribute("reviewNum", reviewNum);
        }

        return "review/reviewResult";
    }

    // ���������̼�
    @GetMapping("/review/loadMoreReviews.do")
    public String loadMoreReviews(@RequestParam("page") int page,
            @RequestParam("companyCode") String companyCode, Model model) {
        int offset = page * 3;
        List<ReviewVO> reviewScreenOutput =
                reviewService.getReviewScreenOutputWithPagination(companyCode, offset);

        // �� ���信 ���� �������� ���� ��� ���� ������ �𵨿� �߰�
        Map<Integer, ReviewQuestionsVO> reviewQuestionsMap = new HashMap<>();
        for (ReviewVO review : reviewScreenOutput) {
            ReviewQuestionsVO reviewQuestions =
                    reviewService.getReviewQuestions(review.getReviewNum());
            reviewQuestionsMap.put(review.getReviewNum(), reviewQuestions);
        }

        model.addAttribute("reviewScreenOutput", reviewScreenOutput);
        model.addAttribute("reviewQuestionsMap", reviewQuestionsMap);
        return "review/reviewListFragment"; // �߰� ���並 ���� �����׸�Ʈ ��
    }



    // ���� ���� ������ �̵�
    @GetMapping("/review/reviewSurvey.do")
    public String reviewSurveyForm(@RequestParam("reviewNum") int reviewNum,
            @RequestParam("companyCode") String companyCode, @RequestParam("userId") String userId,
            Model model) {
        model.addAttribute("reviewNum", reviewNum);
        model.addAttribute("companyCode", companyCode);
        model.addAttribute("userId", userId);
        return "review/reviewSurvey";
    }

    @PostMapping("/review/reviewSurvey.do")
    public String submitSurvey(@RequestParam("companyCode") String companyCode,
            @RequestParam("userId") String userId,
            @ModelAttribute ReviewSurveyDomain reviewSurveyDomain) {

        reviewSurveyDomain.setCompanyCode(companyCode);
        reviewSurveyDomain.setUserId(userId);

        reviewService.insertReviewSurvey(reviewSurveyDomain);
        return "redirect:/review/reviewResult.do?companyCode=" + companyCode; // ���� �� ���𷺼���
                                                                              // ������ ����
    }

    @PostMapping("/review/updateRecommend.do")
    public String updateRecommend(@RequestParam("reviewNum") int reviewNum, HttpSession session,
            RedirectAttributes redirectAttributes) {

        String userId = (String) session.getAttribute("userId");
        if (userId == null || userId.isEmpty()) {
            return "redirect:/user/loginPage.do"; // �α��� �������� ���𷺼�
        }

        logger.info("Controller - updateRecommend() ����, reviewNum: {}", reviewNum);

        RecommendVO recommendVO = new RecommendVO();
        recommendVO.setUserId(userId);
        recommendVO.setReviewNum(reviewNum);

        // ��Ʈ�ѷ����� ��õ ���� Ȯ�� (������ checkIfRecommended ���)
        logger.debug("Controller - checkIfRecommended ȣ�� ��"); // ȣ�� �� �α� �߰�
        boolean isRecommended = reviewService.checkIfRecommended(recommendVO);
        logger.debug("Controller - checkIfRecommended ȣ�� ��, isRecommended: {}", isRecommended); // ȣ��
                                                                                                  // ��
                                                                                                  // �α�
                                                                                                  // �߰�

        if (isRecommended) {
            redirectAttributes.addFlashAttribute("recommendMsg", "�̹� ��õ�߽��ϴ�.");
        } else {
            // ��õ ���� ���� (������ updateRecommend ���)
            reviewService.updateRecommend(recommendVO);
            redirectAttributes.addFlashAttribute("recommendMsg", "��õ�� �Ϸ�Ǿ����ϴ�.");
        }

        return "redirect:/review/reviewResult.do";
    }

    // ���� �ۼ�
    @GetMapping("/review/reviewWrite.do")
    public String writeReview(
            @RequestParam(value = "companyCode", defaultValue = "comp_0001") String companyCode,
            Model model, HttpSession session) {
        String userId = (String) session.getAttribute("userId");
        if (userId == null || userId.isEmpty()) {
            return "redirect:/user/loginPage.do"; // �α��� �������� ���𷺼�
        }

        // ȸ�� ������ ������ �𵨿� �߰�
        CompanyInfoVO companyInfo = reviewService.getCompanyInfo(companyCode);
        model.addAttribute("companyInfo", companyInfo);
        model.addAttribute("userId", userId);

        // ������� ���� �α� �߰�
        System.out.println("Company Info: " + companyInfo);
        System.out.println("User ID: " + userId);

        return "review/reviewWrite"; // ���� �ۼ� �������� �̵�
    }

    // ���� �ۼ� ó��
    @PostMapping("/review/submitReview.do")
    public String submitReview(@RequestParam("title") String title,
            @RequestParam("content") String content,
            @RequestParam("companyCode") String companyCode, HttpSession session, Model model) {
        String userId = (String) session.getAttribute("userId");

        if (userId == null || userId.isEmpty()) {
            return "redirect:/user/loginPage.do";
        }

        ReviewDomain reviewDomain = new ReviewDomain();
        reviewDomain.setCompanyCode(companyCode);
        reviewDomain.setUserId(userId);
        reviewDomain.setTitle(title);
        reviewDomain.setContent(content);

        reviewService.insertReview(reviewDomain);

        // �ۼ��� ������ ���� ��ȣ�� ������
        int reviewNum = reviewDomain.getReviewNum();

        // reviewNum, companyCode, userId�� URL �Ķ���ͷ� ����
        return "redirect:/review/reviewSurvey.do?reviewNum=" + reviewNum + "&companyCode="
                + companyCode + "&userId=" + userId;
    }

}

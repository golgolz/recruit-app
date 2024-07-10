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
import org.springframework.web.bind.annotation.ResponseBody;
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

    @ModelAttribute
    public void addGlobalAttributes(Model model, @RequestParam(value = "companyCode", required = false) String companyCode) {
        if (companyCode != null) {
            int totalReviewCount = reviewService.getTotalReviewCount(companyCode);
            model.addAttribute("totalReviewCount", totalReviewCount);
        }
    }
    
    // 리뷰 화면 출력
    @GetMapping("/review/reviewResult.do")
    public String reviewScreen(
            @RequestParam(value = "companyCode", defaultValue = "comp_0001") String companyCode,
            @RequestParam(value = "page", defaultValue = "0") int page,
            @RequestParam(value = "reviewNum", required = false) Integer reviewNum, Model model) {

        int offset = page * 3;
        List<ReviewVO> reviewScreenOutput = reviewService.getReviewScreenOutputWithPagination(companyCode, offset);

        // reviewScreenOutput이 비어있지 않은 경우에만 reviewQuestionsMap 생성
        Map<Integer, ReviewQuestionsVO> reviewQuestionsMap = new HashMap<>();
        if (!reviewScreenOutput.isEmpty()) {
            for (ReviewVO review : reviewScreenOutput) {
                ReviewQuestionsVO reviewQuestions = reviewService.getReviewQuestions(review.getReviewNum());
                reviewQuestionsMap.put(review.getReviewNum(), reviewQuestions);
            }
        }

        // 회사 정보 가져오기
        CompanyInfoVO companyInfo = reviewService.getCompanyDetailsByCode(companyCode);

        // 총 리뷰 수 가져오기
        int totalReviewCount = reviewService.getTotalReviewCount(companyCode);

        model.addAttribute("reviewScreenOutput", reviewScreenOutput);
        model.addAttribute("reviewQuestionsMap", reviewQuestionsMap);
        model.addAttribute("companyCode", companyCode);
        model.addAttribute("currentPage", page);
        model.addAttribute("companyInfo", companyInfo); // 회사 정보 뷰에 전달
        model.addAttribute("totalReviewCount", totalReviewCount); // 총 리뷰 수 뷰에 전달

        // reviewNum이 null이 아닌 경우에만 모델에 추가
        if (reviewNum != null) {
            model.addAttribute("reviewNum", reviewNum);
        }

        return "review/reviewResult";
    }

    // 페이지네이션
    @GetMapping("/review/loadMoreReviews.do")
    public String loadMoreReviews(@RequestParam("page") int page,
            @RequestParam("companyCode") String companyCode, Model model) {
        int offset = page * 3;
        List<ReviewVO> reviewScreenOutput = reviewService.getReviewScreenOutputWithPagination(companyCode, offset);

        // 각 리뷰에 대해 개별적인 리뷰 통계 값을 가져와 모델에 추가
        Map<Integer, ReviewQuestionsVO> reviewQuestionsMap = new HashMap<>();
        for (ReviewVO review : reviewScreenOutput) {
            ReviewQuestionsVO reviewQuestions = reviewService.getReviewQuestions(review.getReviewNum());
            reviewQuestionsMap.put(review.getReviewNum(), reviewQuestions);
        }

        model.addAttribute("reviewScreenOutput", reviewScreenOutput);
        model.addAttribute("reviewQuestionsMap", reviewQuestionsMap);
        return "review/reviewListFragment"; // 추가 리뷰를 위한 프래그먼트 뷰
    }

    // 설문 조사 페이지 이동
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
        return "redirect:/review/reviewResult.do?companyCode=" + companyCode; // 성공 후 리디렉션할 페이지 설정
    }

    // 추천 업데이트
    @PostMapping("/review/updateRecommend.do")
    @ResponseBody
    public Map<String, Object> updateRecommend(@RequestParam("reviewNum") int reviewNum, HttpSession session) {
        Map<String, Object> response = new HashMap<>();
        String userId = (String) session.getAttribute("userId");
        if (userId == null || userId.isEmpty()) {
            response.put("success", false);
            response.put("message", "로그인이 필요합니다.");
            return response;
        }

        logger.info("Controller - updateRecommend() 시작, reviewNum: {}", reviewNum);

        RecommendVO recommendVO = new RecommendVO();
        recommendVO.setUserId(userId);
        recommendVO.setReviewNum(reviewNum);

        boolean isRecommended = reviewService.checkIfRecommended(recommendVO);
        if (isRecommended) {
            response.put("success", false);
            response.put("message", "이미 추천했습니다.");
        } else {
            reviewService.updateRecommend(recommendVO);
            response.put("success", true);
            response.put("message", "추천이 완료되었습니다.");
        }

        return response;
    }

    // 리뷰 작성
    @GetMapping("/review/reviewWrite.do")
    public String writeReview(@RequestParam(value = "companyCode", defaultValue = "comp_0001") 
    String companyCode, Model model, HttpSession session, RedirectAttributes redirectAttributes) {
        String userId = (String) session.getAttribute("userId");
        if (userId == null || userId.isEmpty()) {
            return "redirect:/user/loginPage.do"; // 로그인 페이지로 리디렉션
        }

        // 이미 리뷰를 작성했는지 확인
        if (reviewService.hasReviewForCompany(userId, companyCode)) {
            redirectAttributes.addFlashAttribute("errorMsg", "이미 리뷰를 작성했습니다.");
            return "redirect:/user/mypage/mypageCareer.do";
        }

        // 회사 정보를 가져와 모델에 추가
        CompanyInfoVO companyInfo = reviewService.getCompanyInfo(companyCode);
        model.addAttribute("companyInfo", companyInfo);
        model.addAttribute("userId", userId);
        
        // 디버깅을 위한 로그 추가
        System.out.println("Company Info: " + companyInfo);
        System.out.println("User ID: " + userId);
        
        return "review/reviewWrite"; // 리뷰 작성 페이지로 이동
    }

    // 리뷰 작성 처리
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

        // 작성된 리뷰의 리뷰 번호를 가져옴
        int reviewNum = reviewDomain.getReviewNum();

        // reviewNum, companyCode, userId를 URL 파라미터로 전달
        return "redirect:/review/reviewSurvey.do?reviewNum=" + reviewNum + "&companyCode="
                + companyCode + "&userId=" + userId;
    }
}

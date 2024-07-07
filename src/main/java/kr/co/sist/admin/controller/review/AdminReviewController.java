package kr.co.sist.admin.controller.review;

import java.util.List;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import com.fasterxml.jackson.databind.ObjectMapper;
import kr.co.sist.admin.service.review.AdminReviewService;
import kr.co.sist.admin.vo.review.ReviewDetailVO;
import kr.co.sist.admin.vo.review.ReviewVO;

@Controller
public class AdminReviewController {
    
    private static final Logger logger = LoggerFactory.getLogger(AdminReviewController.class);

    @Autowired
    private AdminReviewService adminReviewService;

    // 리뷰 관리 화면 표시 및 검색 처리
    @GetMapping("/manage/review/review.do")
    public String review(@RequestParam(value = "sfl", required = false) String searchField,
                         @RequestParam(value = "stx", required = false) String searchText,
                         Model model) {
        logger.debug("review method called with searchField: {}, searchText: {}", searchField, searchText);
        List<ReviewVO> reviewList = null;

        try {
            if (searchField != null && searchText != null) {
                switch (searchField) {
                    case "id":
                        reviewList = adminReviewService.searchReviewById(searchText);
                        break;
                    case "name":
                        reviewList = adminReviewService.searchReviewByName(searchText);
                        break;
                    default:
                        reviewList = adminReviewService.searchReviewByTitleOrContent(searchText);
                        break;
                }
            } else {
                reviewList = adminReviewService.getAllReviews();
            }

            ObjectMapper mapper = new ObjectMapper();
            String reviewListJson = mapper.writeValueAsString(reviewList);
            logger.debug("reviewListJson: {}", reviewListJson);
            model.addAttribute("reviewListJson", reviewListJson);
            model.addAttribute("reviewList", reviewList);  // JSP에서 총 리뷰 수를 표시하기 위해 추가
        } catch (Exception e) {
            logger.error("Error occurred in review method", e);
        }

        return "manage/review/review";
    }
    
    
 // 리뷰 상세 조회
    @GetMapping("/reviewsUpdate.do")
    public String getReviewDetailsForUpdate(@RequestParam("reviewNum") int reviewNum, Model model) {
        logger.debug("getReviewDetailsForUpdate method called with reviewNum: {}", reviewNum);

        try {
            ReviewDetailVO review = adminReviewService.getReviewDetailsForUpdate(reviewNum);
            model.addAttribute("review", review);
        } catch (Exception e) {
            logger.error("Error occurred in getReviewDetailsForUpdate method", e);
        }

        return "manage/review/reviewUpdate";
    }
    
 // 리뷰 업데이트
    @PostMapping("/updateReview.do")
    public String updateReview(ReviewVO review) {
        logger.debug("updateReview method called with review: {}", review);

        try {
            adminReviewService.updateReview(review);
        } catch (Exception e) {
            logger.error("Error occurred in updateReview method", e);
        }

        return "redirect:/recruit-app/manage/review/review.do";
    }

    // 리뷰 삭제
    @PostMapping("/deleteReview.do")
    public String deleteReview(@RequestParam("reviewNum") int reviewNum) {
        logger.debug("deleteReview method called with reviewNum: {}", reviewNum);

        try {
            adminReviewService.deleteReview(reviewNum);
        } catch (Exception e) {
            logger.error("Error occurred in deleteReview method", e);
        }

        return "redirect:/recruit-app/manage/review/review.do";
    }
    
}

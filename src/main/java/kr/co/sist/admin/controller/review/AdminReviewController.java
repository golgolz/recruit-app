package kr.co.sist.admin.controller.review;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
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
            model.addAttribute("reviewList", reviewList);  // JSP에서 리뷰 목록 표시를 위해 추가
        } catch (Exception e) {
            logger.error("Error occurred in review method", e);
        }

        return "manage/review/review";
    }
    
    // 리뷰 상세 조회
    @GetMapping("/manage/review/reviewUpdate.do")
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
    @PostMapping("/manage/review/updateReview.do")
    public String updateReview(ReviewDetailVO review) {
        logger.debug("updateReview method called with review: {}", review);

        try {
            adminReviewService.updateReview(review);
        } catch (Exception e) {
            logger.error("Error occurred in updateReview method", e);
        }

        return "redirect:/manage/review/review.do";
    }

    @PostMapping("/manage/review/deleteReview.do")
    @ResponseBody
    public Map<String, Object> deleteReview(@RequestParam("reviewNum") int reviewNum) {
        logger.debug("deleteReview method called with reviewNum: {}", reviewNum);
        Map<String, Object> response = new HashMap<>();
        
        try {
            boolean success = adminReviewService.deleteReview(reviewNum);
            response.put("success", success);
            if (!success) {
                logger.error("Failed to delete review with reviewNum: {}", reviewNum);
            }
        } catch (Exception e) {
            logger.error("Error occurred in deleteReview method", e);
            response.put("success", false);
            response.put("error", e.getMessage());
        }

        return response;
    }
}

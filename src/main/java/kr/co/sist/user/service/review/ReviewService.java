package kr.co.sist.user.service.review;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.sist.user.dao.review.UserReviewDAO;
import kr.co.sist.user.vo.review.ReviewVO;

@Service
public class ReviewService {

    @Autowired(required = false)
    private UserReviewDAO userReviewDAO;

    public List<ReviewVO> getReviewScreenOutput(String companyCode) {
        return userReviewDAO.selectReviewScreenOutput(companyCode);
    }

    public int addReviewSurvey(Map<String, Object> params) {
        return userReviewDAO.insertReviewSurvey(params);
    }

    public int addReview(Map<String, Object> params) {
        return userReviewDAO.insertReview(params);
    }
    
    public List<Map<String, Object>> searchReviewById(String userId) {
        return userReviewDAO.searchReviewById(userId);
    }
    
    public List<Map<String, Object>> searchReviewByName(String name) {
        return userReviewDAO.searchReviewByName(name);
    }
    
    public List<Map<String, Object>> searchReviewByTitleOrContent(String keyword) {
        return userReviewDAO.searchReviewByTitleOrContent(keyword);
    }
    
    public Map<String, Object> getReviewDetailsForUpdate(int reviewNum) {
        return userReviewDAO.getReviewDetailsForUpdate(reviewNum);
    }
    
    public int updateReview(Map<String, Object> params) {
        return userReviewDAO.updateReview(params);
    }
    
    public int deleteReview(int reviewNum) {
        return userReviewDAO.deleteReview(reviewNum);
    }
}
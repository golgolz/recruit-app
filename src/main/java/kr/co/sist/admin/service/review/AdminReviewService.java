package kr.co.sist.admin.service.review;


import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import kr.co.sist.admin.dao.review.AdminReviewDAO;
import kr.co.sist.admin.vo.review.ReviewVO;

@Service
public class AdminReviewService {

    @Autowired
    private AdminReviewDAO adminReviewDAO;

    public List<ReviewVO> getAllReviews() {
        return adminReviewDAO.getAllReviews();
    }

    public List<ReviewVO> searchReviewById(String userId) {
        return adminReviewDAO.searchReviewById(userId);
    }

    public List<ReviewVO> searchReviewByName(String name) {
        return adminReviewDAO.searchReviewByName(name);
    }

    public List<ReviewVO> searchReviewByTitleOrContent(String keyword) {
        return adminReviewDAO.searchReviewByTitleOrContent(keyword);
    }
    
    //리뷰 상세 조회
    public ReviewVO getReviewDetailsForUpdate(int reviewNum) {
        return adminReviewDAO.getReviewDetailsForUpdate(reviewNum);
    }

    //리뷰 업데이트
    public int updateReview(ReviewVO review) {
        return adminReviewDAO.updateReview(review);
    }

    //리뷰 삭제
    public int deleteReview(int reviewNum) {
        return adminReviewDAO.deleteReview(reviewNum);
    }
    
}

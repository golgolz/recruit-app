package kr.co.sist.admin.service.review;


import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import kr.co.sist.admin.dao.review.AdminReviewDAO;
import kr.co.sist.admin.vo.review.ReviewDetailVO;
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
    
    //���� �� ��ȸ
    public ReviewDetailVO getReviewDetailsForUpdate(int reviewNum) {
        return adminReviewDAO.getReviewDetailsForUpdate(reviewNum);
    }

    public void updateReview(ReviewDetailVO review) {
        adminReviewDAO.updateReview(review);
    }

    @Transactional
    public boolean deleteReview(int reviewNum) {
        int result = adminReviewDAO.deleteReview(reviewNum);
        return result > 0;
    }
    
}

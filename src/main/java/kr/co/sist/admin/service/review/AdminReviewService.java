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
}

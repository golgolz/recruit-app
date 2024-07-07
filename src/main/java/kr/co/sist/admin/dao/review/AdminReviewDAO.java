package kr.co.sist.admin.dao.review;

import java.util.List;
import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import kr.co.sist.admin.vo.review.ReviewDetailVO;
import kr.co.sist.admin.vo.review.ReviewVO;
import kr.co.sist.properties.MyBatisConfig;

@Repository
public class AdminReviewDAO {

    private static final Logger logger = LoggerFactory.getLogger(AdminReviewDAO.class);

    private final MyBatisConfig myBatis;

    @Autowired
    public AdminReviewDAO(MyBatisConfig myBatis) {
        this.myBatis = myBatis;
    }

    /**
     * ID로 리뷰 검색
     * @param userId 사용자 ID
     * @return 해당 사용자 ID를 가진 리뷰 리스트
     */
    public List<ReviewVO> searchReviewById(String userId) {
        logger.debug("searchReviewById called with userId: {}", userId);
        SqlSession session = myBatis.getMyBatisHandler(false);
        List<ReviewVO> result = session.selectList("kr.co.sist.mapper.admin.review.AdminReviewMapper.searchReviewById", userId);
        myBatis.closeHandler(session);
        logger.debug("searchReviewById result: {}", result);
        return result;
    }

    /**
     * 이름으로 리뷰 검색
     * @param name 사용자 이름
     * @return 해당 사용자 이름을 가진 리뷰 리스트
     */
    public List<ReviewVO> searchReviewByName(String name) {
        logger.debug("searchReviewByName called with name: {}", name);
        SqlSession session = myBatis.getMyBatisHandler(false);
        List<ReviewVO> result = session.selectList("kr.co.sist.mapper.admin.review.AdminReviewMapper.searchReviewByName", name);
        myBatis.closeHandler(session);
        logger.debug("searchReviewByName result: {}", result);
        return result;
    }

    /**
     * 제목 또는 내용으로 리뷰 검색
     * @param keyword 검색 키워드
     * @return 해당 키워드를 포함한 제목 또는 내용을 가진 리뷰 리스트
     */
    public List<ReviewVO> searchReviewByTitleOrContent(String keyword) {
        logger.debug("searchReviewByTitleOrContent called with keyword: {}", keyword);
        SqlSession session = myBatis.getMyBatisHandler(false);
        List<ReviewVO> result = session.selectList("kr.co.sist.mapper.admin.review.AdminReviewMapper.searchReviewByTitleOrContent", keyword);
        myBatis.closeHandler(session);
        logger.debug("searchReviewByTitleOrContent result: {}", result);
        return result;
    }

    /**
     * 전체 리뷰 조회
     * @return 모든 리뷰 리스트
     */
    public List<ReviewVO> getAllReviews() {
        logger.debug("getAllReviews called");
        SqlSession session = myBatis.getMyBatisHandler(false);
        List<ReviewVO> result = session.selectList("kr.co.sist.mapper.admin.review.AdminReviewMapper.getAllReviews");
        myBatis.closeHandler(session);
        logger.debug("getAllReviews result: {}", result);
        return result;
    }

    // 리뷰 상세 조회
    public ReviewDetailVO getReviewDetailsForUpdate(int reviewNum) {
        logger.debug("getReviewDetailsForUpdate called with reviewNum: {}", reviewNum);
        SqlSession session = myBatis.getMyBatisHandler(false);
        ReviewDetailVO result = session.selectOne("kr.co.sist.mapper.admin.review.AdminReviewMapper.getReviewDetailsForUpdate", reviewNum);
        myBatis.closeHandler(session);
        logger.debug("getReviewDetailsForUpdate result: {}", result);
        return result;
    }

    // 리뷰 업데이트
    public int updateReview(ReviewVO review) {
        logger.debug("updateReview called with review: {}", review);
        SqlSession session = myBatis.getMyBatisHandler(false);
        int result = session.update("kr.co.sist.mapper.admin.review.AdminReviewMapper.updateReview", review);
        myBatis.closeHandler(session);
        logger.debug("updateReview result: {}", result);
        return result;
    }

    // 리뷰 삭제
    public int deleteReview(int reviewNum) {
        logger.debug("deleteReview called with reviewNum: {}", reviewNum);
        SqlSession session = myBatis.getMyBatisHandler(false);
        int result = session.delete("kr.co.sist.mapper.admin.review.AdminReviewMapper.deleteReview", reviewNum);
        myBatis.closeHandler(session);
        logger.debug("deleteReview result: {}", result);
        return result;
    }
}

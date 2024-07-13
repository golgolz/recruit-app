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
     * ID�� ���� �˻�
     * @param userId ����� ID
     * @return �ش� ����� ID�� ���� ���� ����Ʈ
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
     * �̸����� ���� �˻�
     * @param name ����� �̸�
     * @return �ش� ����� �̸��� ���� ���� ����Ʈ
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
     * ���� �Ǵ� �������� ���� �˻�
     * @param keyword �˻� Ű����
     * @return �ش� Ű���带 ������ ���� �Ǵ� ������ ���� ���� ����Ʈ
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
     * ��ü ���� ��ȸ
     * @return ��� ���� ����Ʈ
     */
    public List<ReviewVO> getAllReviews() {
        logger.debug("getAllReviews called");
        SqlSession session = myBatis.getMyBatisHandler(false);
        List<ReviewVO> result = session.selectList("kr.co.sist.mapper.admin.review.AdminReviewMapper.getAllReviews");
        myBatis.closeHandler(session);
        logger.debug("getAllReviews result: {}", result);
        return result;
    }

    // ���� �� ��ȸ
    public ReviewDetailVO getReviewDetailsForUpdate(int reviewNum) {
        logger.debug("getReviewDetailsForUpdate called with reviewNum: {}", reviewNum);
        SqlSession session = myBatis.getMyBatisHandler(false);
        ReviewDetailVO result = session.selectOne("kr.co.sist.mapper.admin.review.AdminReviewMapper.getReviewDetailsForUpdate", reviewNum);
        myBatis.closeHandler(session);
        logger.debug("getReviewDetailsForUpdate result: {}", result);
        return result;
    }

 // ���� ������Ʈ
    public int updateReview(ReviewDetailVO review) {
        logger.debug("updateReview called with review: {}", review);
        SqlSession session = myBatis.getMyBatisHandler(false);
        int result = 0;
        try {
            result = session.update("kr.co.sist.mapper.admin.review.AdminReviewMapper.updateReview", review);
            session.commit();  // ��������� Ŀ�� ȣ��
        } catch (Exception e) {
            logger.error("Error occurred during updateReview", e);
            session.rollback();  // ���� �߻� �� �ѹ�
        } finally {
            myBatis.closeHandler(session);
        }
        logger.debug("updateReview result: {}", result);
        return result;
    }

    // ���� ����
    public int deleteReview(int reviewNum) {
        logger.debug("deleteReview called with reviewNum: {}", reviewNum);
        SqlSession session = myBatis.getMyBatisHandler(false);
        int result = 0;
        try {
            result = session.delete("kr.co.sist.mapper.admin.review.AdminReviewMapper.deleteReview", reviewNum);
            session.commit();
        } catch (Exception e) {
            logger.error("Error deleting review", e);
            session.rollback();
            throw e; // 예외를 상위 계층으로 전달
        } finally {
            myBatis.closeHandler(session);
        }
        logger.debug("deleteReview result from DB: {}", result);
        return result;
    }
}

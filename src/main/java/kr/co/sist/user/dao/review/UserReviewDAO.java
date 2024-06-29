package kr.co.sist.user.dao.review;

import java.util.List;
import java.util.Map;
import org.apache.ibatis.session.SqlSession;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import kr.co.sist.properties.MyBatisConfig;
import kr.co.sist.user.domain.review.ReviewSurveyDomain;
import kr.co.sist.user.service.review.ReviewService;
import kr.co.sist.user.vo.review.RecommendVO;
import kr.co.sist.user.vo.review.ReviewVO;

@Component
public class UserReviewDAO {
    
    private static final Logger logger = LogManager.getLogger(ReviewService.class);

    private final MyBatisConfig myBatis;

    @Autowired
    public UserReviewDAO(MyBatisConfig myBatis) {
        this.myBatis = myBatis;
    }

    // ���� ȭ�� ���
    public List<ReviewVO> selectReviewScreenOutput(String companyCode) {
        SqlSession ss = myBatis.getMyBatisHandler(false);
        List<ReviewVO> result = 
                ss.selectList("kr.co.sist.user.mapper.review.ReviewMapper.selectReviewScreenOutput", companyCode);
        myBatis.closeHandler(ss);
        return result;
    }

    //���� ���� �ۼ�
    public int insertReviewSurvey(ReviewSurveyDomain reviewSurveyDomain) {
        SqlSession ss = myBatis.getMyBatisHandler(true);
        int result = ss.insert("kr.co.sist.user.mapper.review.ReviewMapper.insertReviewSurvey", reviewSurveyDomain);
        myBatis.closeHandler(ss);
        return result;
    }
    
 // ��õ�� ����
    public int updateRecommend(RecommendVO recommendVO) {
        logger.debug("DAO - updateRecommend() ����"); // �޼��� ���� �α�
        logger.debug("DAO - recommendVO: {}", recommendVO); // RecommendVO �� Ȯ��
        SqlSession ss = myBatis.getMyBatisHandler(true);
        int result = ss.update("kr.co.sist.user.mapper.review.ReviewMapper.updateRecommend", recommendVO);
        myBatis.closeHandler(ss);
        logger.debug("DAO - updateRecommend() ���: {}", result); // ��� �α�
        return result;
    }

    // ��õ ��� �߰�
    public int insertReviewRecommend(RecommendVO recommendVO) {
        logger.debug("DAO - insertReviewRecommend() ����"); // �޼��� ���� �α�
        logger.debug("DAO - recommendVO: {}", recommendVO); // RecommendVO �� Ȯ��
        SqlSession ss = myBatis.getMyBatisHandler(true);
        int result = ss.insert("kr.co.sist.user.mapper.review.ReviewMapper.insertReviewRecommend", recommendVO);
        myBatis.closeHandler(ss);
        logger.debug("DAO - insertReviewRecommend() ���: {}", result); // ��� �α�
        return result;
    }

    // �̹� ��õ�ߴ��� Ȯ��
    public boolean checkIfRecommended(RecommendVO recommendVO) { // ReviewVO -> RecommendVO �� ����
        logger.debug("DAO - checkIfRecommended() ����");
        logger.debug("DAO - recommendVO: {}", recommendVO);
        
        SqlSession ss = myBatis.getMyBatisHandler(false);
        try {
            int count = ss.selectOne("kr.co.sist.user.mapper.review.ReviewMapper.checkIfRecommended", recommendVO);
            logger.debug("DAO - checkIfRecommended() ���: {}", count);
            return count > 0;
        } finally {
            myBatis.closeHandler(ss);
        }
    }
    

    public int insertReview(Map<String, Object> params) {
        SqlSession ss = myBatis.getMyBatisHandler(true);
        int result = 
                ss.insert("kr.co.sist.user.mapper.review.UserReviewMapper.insertReview", params);
        myBatis.closeHandler(ss);
        return result;
    }
    
    public List<Map<String, Object>> searchReviewById(String userId) {
        SqlSession ss = myBatis.getMyBatisHandler(false);
        List<Map<String, Object>> result = 
                ss.selectList("kr.co.sist.user.mapper.review.UserReviewMapper.searchReviewById", userId);
        myBatis.closeHandler(ss);
        return result;
    }
    
    public List<Map<String, Object>> searchReviewByName(String name) {
        SqlSession ss = myBatis.getMyBatisHandler(false);
        List<Map<String, Object>> result = 
                ss.selectList("kr.co.sist.user.mapper.review.UserReviewMapper.searchReviewByName", name);
        myBatis.closeHandler(ss);
        return result;
    }
    
    public List<Map<String, Object>> searchReviewByTitleOrContent(String keyword) {
        SqlSession ss = myBatis.getMyBatisHandler(false);
        List<Map<String, Object>> result = 
                ss.selectList("kr.co.sist.user.mapper.review.UserReviewMapper.searchReviewByTitleOrContent", keyword);
        myBatis.closeHandler(ss);
        return result;
    }
    
    public Map<String, Object> getReviewDetailsForUpdate(int reviewNum) {
        SqlSession ss = myBatis.getMyBatisHandler(false);
        Map<String, Object> result = 
                ss.selectOne("kr.co.sist.user.mapper.review.UserReviewMapper.getReviewDetailsForUpdate", reviewNum);
        myBatis.closeHandler(ss);
        return result;
    }
    
    public int updateReview(Map<String, Object> params) {
        SqlSession ss = myBatis.getMyBatisHandler(true);
        int result = 
                ss.update("kr.co.sist.user.mapper.review.UserReviewMapper.updateReview", params);
        myBatis.closeHandler(ss);
        return result;
    }
    
    public int deleteReview(int reviewNum) {
        SqlSession ss = myBatis.getMyBatisHandler(true);
        int result = 
                ss.delete("kr.co.sist.user.mapper.review.UserReviewMapper.deleteReview", reviewNum);
        myBatis.closeHandler(ss);
        return result;
    }
}

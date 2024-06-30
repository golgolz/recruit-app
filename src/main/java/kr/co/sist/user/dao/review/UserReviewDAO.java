package kr.co.sist.user.dao.review;

import java.util.HashMap;
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
import kr.co.sist.user.vo.review.ReviewQuestionsVO;
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
    
    public List<ReviewVO> selectReviewScreenOutput(String companyCode, int offset) {
        SqlSession ss = myBatis.getMyBatisHandler(false);
        Map<String, Object> params = new HashMap<>();
        params.put("companyCode", companyCode);
        params.put("offset", offset);
        List<ReviewVO> result = ss.selectList("kr.co.sist.user.mapper.review.ReviewMapper.selectReviewScreenOutput", params);
        myBatis.closeHandler(ss);
        return result;
    }
    
    // ���������̼�
    public List<ReviewVO> selectReviewScreenOutputWithPagination(String companyCode, int offset) {
        SqlSession ss = myBatis.getMyBatisHandler(false);
        Map<String, Object> params = new HashMap<>();
        params.put("companyCode", companyCode);
        params.put("offset", offset);
        List<ReviewVO> result = ss.selectList("kr.co.sist.user.mapper.review.ReviewMapper.selectReviewScreenOutputWithPagination", params);
        myBatis.closeHandler(ss);
        return result;
    }
    
    
 // ���� ���� ��� �� ��������
    public ReviewQuestionsVO selectReviewQuestions(int reviewNum) {
        SqlSession ss = myBatis.getMyBatisHandler(false);
        ReviewQuestionsVO result = 
                ss.selectOne("kr.co.sist.user.mapper.review.ReviewMapper.selectReviewQuestions", reviewNum);
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
    

}

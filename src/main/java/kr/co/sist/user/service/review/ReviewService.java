package kr.co.sist.user.service.review;

import java.util.List;
import org.apache.ibatis.session.SqlSession;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import kr.co.sist.properties.MyBatisConfig;
import kr.co.sist.user.dao.review.UserReviewDAO;
import kr.co.sist.user.domain.review.ReviewDomain;
import kr.co.sist.user.domain.review.ReviewSurveyDomain;
import kr.co.sist.user.vo.review.CompanyInfoVO;
import kr.co.sist.user.vo.review.RecommendVO;
import kr.co.sist.user.vo.review.ReviewQuestionsVO;
import kr.co.sist.user.vo.review.ReviewVO;

@Service
public class ReviewService {
    
    private static final Logger logger = LogManager.getLogger(ReviewService.class);
    
    @Autowired
    private MyBatisConfig myBatis; // MyBatisHandler Ÿ������ ����

    @Autowired
    public ReviewService(MyBatisConfig myBatis) {
        this.myBatis = myBatis;
    }

    @Autowired(required = false)
    private UserReviewDAO userReviewDAO;

    //���� ȭ�� ���
    public List<ReviewVO> getReviewScreenOutput(String companyCode) {
        return userReviewDAO.selectReviewScreenOutput(companyCode);
    }
    public List<ReviewVO> getReviewScreenOutput(String companyCode, int offset) {
        return userReviewDAO.selectReviewScreenOutput(companyCode, offset);
    }
    
  //������ ���̼�
    public List<ReviewVO> getReviewScreenOutputWithPagination(String companyCode, int offset) {
        return userReviewDAO.selectReviewScreenOutputWithPagination(companyCode, offset);
    }

    //���� ���� �� �߰�
    public void insertReviewSurvey(ReviewSurveyDomain reviewSurveyDomain) {
        userReviewDAO.insertReviewSurvey(reviewSurveyDomain);
    }
    
 // ���� ���� ��� �� ��������
    public ReviewQuestionsVO getReviewQuestions(int reviewNum) {
        return userReviewDAO.selectReviewQuestions(reviewNum);
    }
    
    
    

    
 // ��õ�� ���� (�̹� ��õ ���� Ȯ�� ���� ����)
    @Transactional
    public boolean updateRecommend(RecommendVO recommendVO) {
        logger.debug("Service - updateRecommend() ����, reviewNum: {}", recommendVO.getReviewNum());
        try {
            userReviewDAO.updateRecommend(recommendVO);
            userReviewDAO.insertReviewRecommend(recommendVO);
            return true;
        } catch (Exception e) {
            logger.error("Error occurred while updating recommendation: {}", e.getMessage(), e);
            throw e;
        } finally {
            // mybatis �ڵ鷯�� �ݴ� �κ��� updateRecommend �޼��忡�� ó���ϵ��� ����
            SqlSession ss = myBatis.getMyBatisHandler(false);
            myBatis.closeHandler(ss); 
        }
    }
    
    // �̹� ��õ�ߴ��� Ȯ��
    public boolean checkIfRecommended(RecommendVO recommendVO) {
        return userReviewDAO.checkIfRecommended(recommendVO);
    }
    
    //���� ȭ�� �ҷ�����
    public CompanyInfoVO getCompanyInfo(String companyCode) {
        System.out.println("Service Layer - companyCode: " + companyCode);
        CompanyInfoVO companyInfo = userReviewDAO.selectCompanyInfo(companyCode);
        System.out.println("Service Layer - companyInfo: " + (companyInfo != null ? companyInfo.toString() : "null"));
        return companyInfo;
    }
    
    //���� �ۼ� ó��
    public void insertReview(ReviewDomain reviewDomain) {
        userReviewDAO.insertReview(reviewDomain);
    }
    
    //���� �ѹ� ��������
    public int getReviewNumByDomain(ReviewDomain reviewDomain) {
        return userReviewDAO.getReviewNumByDomain(reviewDomain);
    }
    
    //ȸ�� ���� ��������
    public CompanyInfoVO getCompanyDetailsByCode(String companyCode) {
        return userReviewDAO.getCompanyDetailsByCode(companyCode);
    }
}

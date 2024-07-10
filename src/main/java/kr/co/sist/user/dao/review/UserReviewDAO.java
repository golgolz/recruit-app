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
import kr.co.sist.user.domain.review.ReviewDomain;
import kr.co.sist.user.domain.review.ReviewSurveyDomain;
import kr.co.sist.user.service.review.ReviewService;
import kr.co.sist.user.vo.review.CompanyInfoVO;
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

    // 리뷰 화면 출력
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
    
    // 리뷰 페이징
    public List<ReviewVO> selectReviewScreenOutputWithPagination(String companyCode, int offset) {
        SqlSession ss = myBatis.getMyBatisHandler(false);
        Map<String, Object> params = new HashMap<>();
        params.put("companyCode", companyCode);
        params.put("offset", offset);
        List<ReviewVO> result = ss.selectList("kr.co.sist.user.mapper.review.ReviewMapper.selectReviewScreenOutputWithPagination", params);
        myBatis.closeHandler(ss);
        return result;
    }
    
    // 리뷰 질문 선택
    public ReviewQuestionsVO selectReviewQuestions(int reviewNum) {
        SqlSession ss = myBatis.getMyBatisHandler(false);
        ReviewQuestionsVO result = 
                ss.selectOne("kr.co.sist.user.mapper.review.ReviewMapper.selectReviewQuestions", reviewNum);
        myBatis.closeHandler(ss);
        return result;
    }
    
    // 리뷰 설문조사 추가
    public int insertReviewSurvey(ReviewSurveyDomain reviewSurveyDomain) {
        SqlSession ss = myBatis.getMyBatisHandler(true);
        int result = ss.insert("kr.co.sist.user.mapper.review.ReviewMapper.insertReviewSurvey", reviewSurveyDomain);
        myBatis.closeHandler(ss);
        return result;
    }
    
    // 추천 업데이트
    public int updateRecommend(RecommendVO recommendVO) {
        logger.debug("DAO - updateRecommend() 시작"); 
        logger.debug("DAO - recommendVO: {}", recommendVO);
        SqlSession ss = myBatis.getMyBatisHandler(true);
        int result = ss.update("kr.co.sist.user.mapper.review.ReviewMapper.updateRecommend", recommendVO);
        myBatis.closeHandler(ss);
        logger.debug("DAO - updateRecommend() 결과: {}", result);
        return result;
    }

    // 추천 추가
    public int insertReviewRecommend(RecommendVO recommendVO) {
        logger.debug("DAO - insertReviewRecommend() 시작"); 
        logger.debug("DAO - recommendVO: {}", recommendVO);
        SqlSession ss = myBatis.getMyBatisHandler(true);
        int result = ss.insert("kr.co.sist.user.mapper.review.ReviewMapper.insertReviewRecommend", recommendVO);
        myBatis.closeHandler(ss);
        logger.debug("DAO - insertReviewRecommend() 결과: {}", result);
        return result;
    }

    // 추천 여부 확인
    public boolean checkIfRecommended(RecommendVO recommendVO) { 
        logger.debug("DAO - checkIfRecommended() 시작");
        logger.debug("DAO - recommendVO: {}", recommendVO);
        
        SqlSession ss = myBatis.getMyBatisHandler(false);
        try {
            int count = ss.selectOne("kr.co.sist.user.mapper.review.ReviewMapper.checkIfRecommended", recommendVO);
            logger.debug("DAO - checkIfRecommended() 결과: {}", count);
            return count > 0;
        } finally {
            myBatis.closeHandler(ss);
        }
    }
    
    // 회사 정보 가져오기
    public CompanyInfoVO selectCompanyInfo(String companyCode) {
        SqlSession ss = myBatis.getMyBatisHandler(true);
        System.out.println("DAO Layer - companyCode: " + companyCode);
        CompanyInfoVO companyInfo = ss.selectOne("kr.co.sist.user.mapper.review.ReviewMapper.selectCompanyInfo", companyCode);
        myBatis.closeHandler(ss);
        System.out.println("DAO Layer - companyInfo: " + (companyInfo != null ? companyInfo.toString() : "null"));
        return companyInfo;
    }
    
    // 리뷰 추가
    public void insertReview(ReviewDomain reviewDomain) {
        SqlSession ss = myBatis.getMyBatisHandler(true);
        try {
            ss.insert("kr.co.sist.user.mapper.review.ReviewMapper.insertReview", reviewDomain);
            int reviewNum = ss.selectOne("kr.co.sist.user.mapper.review.ReviewMapper.getLatestReviewNum", reviewDomain);
            reviewDomain.setReviewNum(reviewNum);
        } finally {
            myBatis.closeHandler(ss);
        }
    }
    
    // 리뷰 번호 가져오기
    public int getReviewNumByDomain(ReviewDomain reviewDomain) {
        SqlSession ss = myBatis.getMyBatisHandler(true);
        int reviewNum = ss.selectOne("kr.co.sist.user.mapper.review.ReviewMapper.getReviewNumByDomain", reviewDomain);
        myBatis.closeHandler(ss);
        return reviewNum;
    }
    
    // 회사 코드로 회사 정보 가져오기
    public CompanyInfoVO getCompanyDetailsByCode(String companyCode) {
        SqlSession ss = myBatis.getMyBatisHandler(true);
        CompanyInfoVO companyInfo = ss.selectOne("kr.co.sist.user.mapper.review.ReviewMapper.getCompanyDetailsByCode", companyCode);
        myBatis.closeHandler(ss);
        return companyInfo;
    }
    
    // 총 리뷰 수 가져오기
    public int getTotalReviewCount(String companyCode) {
        SqlSession ss = myBatis.getMyBatisHandler(true);
        int totalReviewCount = ss.selectOne("kr.co.sist.user.mapper.review.ReviewMapper.getTotalReviewCount", companyCode);
        myBatis.closeHandler(ss);
        return totalReviewCount;
    }
   
    // 리뷰 작성 유효성 검사
    public boolean hasReviewForCompany(String userId, String companyCode) {
        SqlSession ss = myBatis.getMyBatisHandler(true);
        int count = ss.selectOne("kr.co.sist.user.mapper.review.ReviewMapper.hasReviewForCompany", Map.of("userId", userId, "companyCode", companyCode));
        myBatis.closeHandler(ss);
        return count > 0;
    }
}

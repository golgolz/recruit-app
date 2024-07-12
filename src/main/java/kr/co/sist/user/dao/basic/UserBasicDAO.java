package kr.co.sist.user.dao.basic;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Component;
import kr.co.sist.properties.MyBatisConfig;
import kr.co.sist.user.domain.basic.LoginDomain;
import kr.co.sist.user.domain.basic.QuestionDomain;
import kr.co.sist.user.vo.basic.FindMailVO;
import kr.co.sist.user.vo.basic.FindPassVO;
import kr.co.sist.user.vo.basic.LoginVO;
import kr.co.sist.user.vo.basic.UpdatePassVO;
import kr.co.sist.user.vo.signup.Signup2VO;
import kr.co.sist.user.vo.signup.SignupVO;

@Component
public class UserBasicDAO {
    private final MyBatisConfig myBatis;

    public UserBasicDAO(MyBatisConfig myBatis) {
        this.myBatis = myBatis;
    }

    /**
     * 로그인
     * 
     * @param lVO
     * @return
     */
    public LoginDomain selectLogin(LoginVO lVO) {
        SqlSession ss = myBatis.getMyBatisHandler(false);

        LoginDomain ld =
                ss.selectOne("kr.co.sist.mapper.user.basic.userBasicMapper.selectLogin", lVO);
        myBatis.closeHandler(ss);

        return ld;
    }// selectLogin


    /**
     * 마지막 로그인 일시 업데이트
     * 
     * @param userId
     * @return
     */
    public int updateLoginTime(String userId) {
        SqlSession ss = myBatis.getMyBatisHandler(false);

        int cnt = ss.update("kr.co.sist.mapper.user.basic.userBasicMapper.updateLoginTime", userId);
        if (cnt > 0) {
            ss.commit();
        } else {
            ss.rollback();
        }
        myBatis.closeHandler(ss);

        return cnt;
    }// updateLoginTime


    /**
     * 아이디 중복 확인
     * 
     * @param userId
     * @return
     */
    public String selectDuplicationId(String userId) {
        SqlSession ss = myBatis.getMyBatisHandler(false);

        String checkId = ss.selectOne(
                "kr.co.sist.mapper.user.basic.userBasicMapper.selectDuplicationId", userId);

        myBatis.closeHandler(ss);

        return checkId;
    }// selectDuplicationId

    /**
     * 보안 질문 리스트 전체 조회
     * 
     * @return
     */
    public List<QuestionDomain> selectPasswordQList() {
        SqlSession ss = myBatis.getMyBatisHandler(false);

        List<QuestionDomain> list =
                ss.selectList("kr.co.sist.mapper.user.basic.userBasicMapper.selectPasswordQList");

        myBatis.closeHandler(ss);

        return list;
    }// selectPasswordQ

    /**
     * 회원가입
     * 
     * @param sVO
     * @param s2VO
     * @return
     */
    public int insertUser(SignupVO sVO, Signup2VO s2VO) {
        SqlSession ss = myBatis.getMyBatisHandler(false);

        Map<Object, Object> params = new HashMap<Object, Object>();
        params.put("sVO", sVO);
        params.put("s2VO", s2VO);
        int cnt = 0;
        System.out.println(s2VO.getQNum());

        cnt = ss.insert("kr.co.sist.mapper.user.basic.userBasicMapper.insertUser", params);
        if (cnt > 0) {
            ss.commit();
        } else {
            ss.rollback();
        }
        myBatis.closeHandler(ss);
        return cnt;
    }// insertUser

    /**
     * 계정 찾기
     * 
     * @param fmVO
     * @return
     */
    public String selectUserId(FindMailVO fmVO) {
        SqlSession ss = myBatis.getMyBatisHandler(false);

        String userId =
                ss.selectOne("kr.co.sist.mapper.user.basic.userBasicMapper.selectUserId", fmVO);

        myBatis.closeHandler(ss);

        return userId;
    }// selectUserId


    public String selectPasswordId(FindPassVO fpVO) {
        SqlSession ss = myBatis.getMyBatisHandler(false);

        String userId =
                ss.selectOne("kr.co.sist.mapper.user.basic.userBasicMapper.selectPasswordId", fpVO);

        myBatis.closeHandler(ss);

        return userId;
    }

    public int updatePassword(UpdatePassVO upVO) {
        SqlSession ss = myBatis.getMyBatisHandler(false);

        int cnt = ss.update("kr.co.sist.mapper.user.basic.userBasicMapper.updatePassword", upVO);

        if (cnt > 0) {
            ss.commit();
        } else {
            ss.rollback();
        }

        myBatis.closeHandler(ss);

        return cnt;
    }

    public int updatePassFlag(String userId) {
        SqlSession ss = myBatis.getMyBatisHandler(false);

        int cnt = ss.update("kr.co.sist.mapper.user.basic.userBasicMapper.updatePassFlag", userId);

        if (cnt > 0) {
            ss.commit();
        } else {
            ss.rollback();
        }

        myBatis.closeHandler(ss);

        return cnt;
    }

    public String selectPassFlag(String userId) {
        SqlSession ss = myBatis.getMyBatisHandler(false);

        String passFlag =
                ss.selectOne("kr.co.sist.mapper.user.basic.userBasicMapper.selectPassFlag", userId);

        myBatis.closeHandler(ss);

        return passFlag;
    }
}

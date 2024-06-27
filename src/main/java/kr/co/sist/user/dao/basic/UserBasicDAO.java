package kr.co.sist.user.dao.basic;

import java.util.HashMap;
import java.util.Map;
import org.apache.ibatis.session.SqlSession;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.core.Logger;
import org.springframework.stereotype.Component;
import kr.co.sist.properties.MyBatisConfig;
import kr.co.sist.user.domain.basic.LoginDomain;
import kr.co.sist.user.vo.basic.LoginVO;
import kr.co.sist.user.vo.signup.Signup2VO;
import kr.co.sist.user.vo.signup.SignupVO;

@Component
public class UserBasicDAO {
    private final MyBatisConfig myBatis;
    private static final Logger log = (Logger) LogManager.getLogger(UserBasicDAO.class);

    public UserBasicDAO(MyBatisConfig myBatis) {
        this.myBatis = myBatis;
    }

    public LoginDomain selectLogin(LoginVO lVO) {
        SqlSession ss = myBatis.getMyBatisHandler(false);


        LoginDomain ld =
                ss.selectOne("kr.co.sist.mapper.user.basic.userBasicMapper.selectLogin", lVO);
        myBatis.closeHandler(ss);

        return ld;
    }// selectLogin

    public String selectDuplicationId(String userId) {
        SqlSession ss = myBatis.getMyBatisHandler(false);

        String checkId = ss.selectOne(
                "kr.co.sist.mapper.user.basic.userBasicMapper.selectDuplicationId", userId);

        myBatis.closeHandler(ss);

        return checkId;
    }


    public int insertUser(SignupVO sVO, Signup2VO s2VO) {
        SqlSession ss = myBatis.getMyBatisHandler(false);

        Map<Object, Object> params = new HashMap<Object, Object>();
        params.put("sVO", sVO);
        params.put("s2VO", s2VO);
        int cnt = 0;

        cnt = ss.insert("kr.co.sist.mapper.user.basic.userBasicMapper.insertUser", params);
        if (cnt > 0) {
            ss.commit();
        } else {
            ss.rollback();
        }
        myBatis.closeHandler(ss);
        return cnt;
    }// insertUser

}

package kr.co.sist.admin.dao.user;

import java.util.List;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Component;
import kr.co.sist.admin.domain.user.UserInfoDomain;
import kr.co.sist.admin.vo.user.SearchVO;
import kr.co.sist.properties.MyBatisConfig;

@Component
public class UserManageDAO {
    private final MyBatisConfig myBatis;

    public UserManageDAO(MyBatisConfig myBatis) {
        this.myBatis = myBatis;
    }

    public List<UserInfoDomain> selectUserList(SearchVO sVO) {
        SqlSession ss = myBatis.getMyBatisHandler(false);

        List<UserInfoDomain> list =
                ss.selectList("kr.co.sist.mapper.admin.user.userManageMapper.selectUserList", sVO);

        myBatis.closeHandler(ss);

        return list;
    }// selectUserList

    public int selectUserCnt(SearchVO sVO) {
        SqlSession ss = myBatis.getMyBatisHandler(false);

        int cnt = ss.selectOne("kr.co.sist.mapper.admin.user.userManageMapper.selectUserCnt", sVO);

        myBatis.closeHandler(ss);

        return cnt;
    }// selectUserCnt
}

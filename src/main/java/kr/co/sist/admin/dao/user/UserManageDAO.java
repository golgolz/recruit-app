package kr.co.sist.admin.dao.user;

import java.util.List;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Component;
import kr.co.sist.admin.domain.user.UserApplyDomain;
import kr.co.sist.admin.domain.user.UserDetailDomain;
import kr.co.sist.admin.domain.user.UserInfoDomain;
import kr.co.sist.admin.domain.user.UserQnaDomain;
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

    public UserDetailDomain selectUserDetail(String userId) {
        SqlSession ss = myBatis.getMyBatisHandler(false);

        UserDetailDomain detailInfo = ss.selectOne(
                "kr.co.sist.mapper.admin.user.userManageMapper.selectUserDetail", userId);

        myBatis.closeHandler(ss);

        return detailInfo;
    }// selectUserDetail

    public List<UserApplyDomain> selectUserApply(String userId) {
        SqlSession ss = myBatis.getMyBatisHandler(false);

        List<UserApplyDomain> applyList = ss.selectList(
                "kr.co.sist.mapper.admin.user.userManageMapper.selectUserApply", userId);

        myBatis.closeHandler(ss);

        return applyList;
    }// selectUserApply

    public List<UserQnaDomain> selectUserQna(String userId) {
        SqlSession ss = myBatis.getMyBatisHandler(false);

        List<UserQnaDomain> qnaList = ss
                .selectList("kr.co.sist.mapper.admin.user.userManageMapper.selectUserQna", userId);

        myBatis.closeHandler(ss);

        return qnaList;
    }// selectUserQna
}

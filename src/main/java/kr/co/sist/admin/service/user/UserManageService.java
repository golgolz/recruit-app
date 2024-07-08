package kr.co.sist.admin.service.user;

import java.util.List;
import org.springframework.stereotype.Service;
import kr.co.sist.admin.dao.user.UserManageDAO;
import kr.co.sist.admin.domain.user.UserApplyDomain;
import kr.co.sist.admin.domain.user.UserDetailDomain;
import kr.co.sist.admin.domain.user.UserInfoDomain;
import kr.co.sist.admin.domain.user.UserQnaDomain;
import kr.co.sist.admin.vo.user.SearchVO;

@Service
public class UserManageService {
    private final UserManageDAO umDAO;

    public UserManageService(UserManageDAO umDAO) {
        this.umDAO = umDAO;
    }

    public List<UserInfoDomain> searchUserList(SearchVO sVO) {
        List<UserInfoDomain> list = umDAO.selectUserList(sVO);

        return list;
    }// searchUserList

    public int searchUserCnt(SearchVO sVO) {
        int cnt = umDAO.selectUserCnt(sVO);

        return cnt;
    }// searchUserCnt

    public UserDetailDomain searchUserDetail(String userId) {
        UserDetailDomain detailInfo = umDAO.selectUserDetail(userId);

        return detailInfo;
    }// searchUserDetail

    public List<UserApplyDomain> searchUserApply(String userId) {
        List<UserApplyDomain> applyList = umDAO.selectUserApply(userId);

        return applyList;
    }// searchUserApply

    public List<UserQnaDomain> searchUserQna(String userId) {
        List<UserQnaDomain> qnaList = umDAO.selectUserQna(userId);

        return qnaList;
    }// searchUserQna

}

package kr.co.sist.user.service.basic;

import java.util.List;
import org.springframework.stereotype.Service;
import kr.co.sist.user.dao.basic.UserBasicDAO;
import kr.co.sist.user.domain.basic.LoginDomain;
import kr.co.sist.user.domain.basic.QuestionDomain;
import kr.co.sist.user.vo.basic.FindMailVO;
import kr.co.sist.user.vo.basic.FindPassVO;
import kr.co.sist.user.vo.basic.LoginVO;
import kr.co.sist.user.vo.basic.UpdatePassVO;
import kr.co.sist.user.vo.signup.Signup2VO;
import kr.co.sist.user.vo.signup.SignupVO;

@Service
public class UserBasicService {
    private final UserBasicDAO ubDAO;

    public UserBasicService(UserBasicDAO ubDAO) {
        this.ubDAO = ubDAO;
    }

    public LoginDomain userLogin(LoginVO lVO) {
        LoginDomain ld = ubDAO.selectLogin(lVO);

        return ld;
    }

    public int newLoginTime(String userId) {
        int cnt = ubDAO.updateLoginTime(userId);

        return cnt;
    }

    public String checkDuplicationId(String userId) {
        String checkId = ubDAO.selectDuplicationId(userId);

        return checkId;
    }

    public List<QuestionDomain> searchPasswordQList() {
        List<QuestionDomain> list = ubDAO.selectPasswordQList();

        return list;
    }

    public int addUser(SignupVO sVO, Signup2VO s2VO) {
        // 전화번호 format 후 insert
        String formatTel = formatNumber(sVO.getTel());
        String formatPhone = formatNumber(sVO.getPhone());

        sVO.setTel(formatTel);
        sVO.setPhone(formatPhone);

        int cnt = ubDAO.insertUser(sVO, s2VO);

        return cnt;
    }

    public String findUserId(FindMailVO fmVO) {
        String formatPhone = formatNumber(fmVO.getPhone());
        fmVO.setPhone(formatPhone);
        String userId = ubDAO.selectUserId(fmVO);

        return userId;
    }

    public String searchPasswordId(FindPassVO fpVO) {
        String formatPhone = formatNumber(fpVO.getPhone());
        fpVO.setPhone(formatPhone);
        String userId = ubDAO.selectPasswordId(fpVO);

        return userId;
    }

    public int modifyPassword(UpdatePassVO upVO) {
        int cnt = ubDAO.updatePassword(upVO);

        return cnt;
    }

    public int modifyPassFlag(String userId) {
        int cnt = ubDAO.updatePassFlag(userId);

        return cnt;
    }

    public String searchPassFlag(String userId) {
        String passFlag = ubDAO.selectPassFlag(userId);

        return passFlag;
    }

    public String formatNumber(String phoneNumber) {
        // 전화번호 하이픈 추가
        String formatNum = phoneNumber.replaceFirst("(\\d{3})(\\d{3,4})(\\d{4})", "$1-$2-$3");
        return formatNum;
    }

}

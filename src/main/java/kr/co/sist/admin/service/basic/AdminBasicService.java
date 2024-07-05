package kr.co.sist.admin.service.basic;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import kr.co.sist.admin.dao.basic.AdminBasicDAO;
import kr.co.sist.admin.domain.basic.AdminInfoDomain;
import kr.co.sist.admin.domain.basic.AdminLoginDomain;
import kr.co.sist.admin.vo.basic.InsertAdminVO;
import kr.co.sist.admin.vo.basic.SearchVO;
import kr.co.sist.admin.vo.basic.UpdateAdminInfoVO;

@Service
public class AdminBasicService {
    private final AdminBasicDAO amDAO;

    @Autowired
    private PasswordEncoder passwordEncoder;

    public AdminBasicService(AdminBasicDAO amDAO) {
        this.amDAO = amDAO;
    }

    public AdminLoginDomain adminLogin(String adminId) {

        AdminLoginDomain ld = amDAO.selectLogin(adminId);

        return ld;
    }

    public List<AdminInfoDomain> searchAdminList(SearchVO sVO) {
        List<AdminInfoDomain> list = amDAO.selectAdminList(sVO);

        return list;
    }

    public int searchAdminCnt(SearchVO sVO) {
        int cnt = amDAO.selectAdminCnt(sVO);

        return cnt;
    }

    public int addAdmin(InsertAdminVO iVO) {

        String password = iVO.getPassword();
        String cipherPass = passwordEncoder.encode(password);
        iVO.setPassword(cipherPass);

        int cnt = amDAO.insertAdmin(iVO);

        return cnt;
    }

    public AdminInfoDomain searchAdminInfo(String adminId) {
        AdminInfoDomain adminInfo = amDAO.selectAdminInfo(adminId);

        return adminInfo;
    }

    public String chkDuplAdminId(String adminId) {
        String resultId = amDAO.selectAdminId(adminId);

        return resultId;
    }

    public int modifyAdminInfo(UpdateAdminInfoVO adminInfo) {
        int cnt = amDAO.updateAdminInfo(adminInfo);

        return cnt;
    }

}

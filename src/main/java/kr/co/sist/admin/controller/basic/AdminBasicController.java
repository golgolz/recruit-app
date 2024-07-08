package kr.co.sist.admin.controller.basic;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import kr.co.sist.admin.domain.basic.AdminInfoDomain;
import kr.co.sist.admin.domain.basic.AdminLoginDomain;
import kr.co.sist.admin.service.basic.AdminBasicService;
import kr.co.sist.admin.vo.basic.AdminLoginVO;
import kr.co.sist.admin.vo.basic.InsertAdminVO;
import kr.co.sist.admin.vo.basic.SearchVO;
import kr.co.sist.admin.vo.basic.UpdateAdminInfoVO;

@SessionAttributes("adminId")
@Controller
public class AdminBasicController {
    private final AdminBasicService abs;

    @Autowired
    private PasswordEncoder passwordEncoder;

    public AdminBasicController(AdminBasicService abs) {
        this.abs = abs;
    }

    @GetMapping("/manage/adminLogin/adminLoginPage.do")
    public String adminLoginPage() {

        return "manage/adminLogin/adminLogin";
    }

    @PostMapping("/manage/adminLogin/adminLogin.do")
    public String adminLogin(AdminLoginVO lVO, Model model, RedirectAttributes redirectAttributes) {
        String inputAdminId = lVO.getAdminId();
        String inputPassword = lVO.getPassword();

        AdminLoginDomain ld = abs.adminLogin(inputAdminId);

        if (ld == null) {
            redirectAttributes.addFlashAttribute("resultMsg", "존재하지 않는 계정입니다.");
            return "redirect:/manage/adminLogin/adminLoginPage.do";
        }

        boolean login = passwordEncoder.matches(inputPassword, ld.getPassword());

        if (!login) {
            redirectAttributes.addFlashAttribute("resultMsg", "비밀번호가 다릅니다.");
            return "redirect:/manage/adminLogin/adminLoginPage.do";
        }

        String adminId = ld.getAdminId();

        model.addAttribute("adminId", adminId);

        return "redirect:/manage/dashboard/dashboard.do";
    }

    @GetMapping("manage/logout.do")
    public String logout(SessionStatus ss) {

        ss.setComplete();

        return "manage/adminLogin/adminLogin";
    }

    @GetMapping("/api/manage/admins.do")
    @ResponseBody
    public List<AdminInfoDomain> searchAdmin(@ModelAttribute SearchVO sVO) {

        List<AdminInfoDomain> list = abs.searchAdminList(sVO);

        return list;
    }

    @GetMapping("/manage/admin/admins.do")
    public String searchAdminPage() {
        return "manage/admin/admins";
    }

    @GetMapping("/api/manage/admin/counts.do")
    @ResponseBody
    public int searchAdminCount(@ModelAttribute SearchVO searchVO) {
        return abs.searchAdminCnt(searchVO);
    }

    @GetMapping("/manage/user/detail.do")
    public String searchUserDetail(Model model) {

        return "manage/user/detail";
    }


    @PostMapping("/manage/admin/addAdmin.do")
    public @ResponseBody Map<String, Object> addAdmin(InsertAdminVO insertAdminVO) {

        Map<String, Object> response = new HashMap<String, Object>();
        String resultId = abs.chkDuplAdminId(insertAdminVO.getAdminId());

        if (resultId != null || resultId != "") {
            response.put("resultMsg", "duplication");
            return response;
        }

        int cnt = abs.addAdmin(insertAdminVO);

        if (cnt > 0) {
            AdminInfoDomain adminInfo = abs.searchAdminInfo(insertAdminVO.getAdminId());
            response.put("resultMsg", "success");
            response.put("newAdminId", adminInfo.getAdminId());
            response.put("newPosition", adminInfo.getPosition());
            response.put("newAuthority", adminInfo.getAuthority());
            return response;
        } else {
            response.put("resultMsg", "error");
            return response;
        }
    }// addAdmin

    @GetMapping("/api/manage/admin/{adminId}.do")
    @ResponseBody
    public ResponseEntity<AdminInfoDomain> getAdminInfo(@PathVariable String adminId) {
        AdminInfoDomain adminInfo = abs.searchAdminInfo(adminId);
        if (adminInfo != null) {
            return ResponseEntity.ok(adminInfo);
        } else {
            return ResponseEntity.notFound().build();
        }
    }// getAdminInfo

    @GetMapping("/api/manage/admin/modifyAdmin.do")
    @ResponseBody
    public Map<String, Object> modifyAdminInfo(String adminId, UpdateAdminInfoVO adminInfo) {

        Map<String, Object> response = new HashMap<String, Object>();
        String resultId = abs.chkDuplAdminId(adminId);

        if (resultId != null || resultId != "") {
            response.put("resultMsg", "duplication");
            return response;
        }

        adminInfo.setAdminId(adminId);

        int cnt = abs.modifyAdminInfo(adminInfo);
        if (cnt > 0) {
            response.put("resultMsg", "success");
            return response;
        } else {
            response.put("resultMsg", "error");
            return response;
        }
    }

}

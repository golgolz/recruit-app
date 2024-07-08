package kr.co.sist.admin.controller.user;

import java.util.List;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import kr.co.sist.admin.domain.user.UserDetailDomain;
import kr.co.sist.admin.domain.user.UserInfoDomain;
import kr.co.sist.admin.service.user.UserManageService;
import kr.co.sist.admin.vo.user.SearchVO;

@Controller
public class UserManageController {
    private final UserManageService ums;

    public UserManageController(UserManageService ums) {
        this.ums = ums;
    }

    @GetMapping("/manage/user/users.do")
    public String userManagePage() {
        return "manage/user/users";
    }

    @GetMapping("/api/manage/users.do")
    @ResponseBody
    public List<UserInfoDomain> searchUser(@ModelAttribute SearchVO sVO) {
        List<UserInfoDomain> userList = ums.searchUserList(sVO);

        return userList;
    }

    @GetMapping("/api/manage/user/counts.do")
    @ResponseBody
    public int searchUserCount(@ModelAttribute SearchVO searchVO) {
        return ums.searchUserCnt(searchVO);
    }

    @PostMapping("/manage/userDetail.do")
    public String userDetail(@RequestParam("userId") String userId, Model model,
            RedirectAttributes redirectAttributes) {
        UserDetailDomain detailInfo = ums.searchUserDetail(userId);

        if (detailInfo == null) {
            redirectAttributes.addAttribute("resultMsg",
                    "사용자 정보 조회 중 문제가 발생 했습니다. 잠시 후 다시 시도해주세요.");
            return "redirect:/manage/user/users.do";
        }
        System.out.println(detailInfo.getRecentloginDate());

        model.addAttribute("detailInfo", detailInfo);

        return "manage/user/detail";
    }

}

package kr.co.sist.admin.controller.user;

import java.util.List;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.ResponseBody;
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
    public int searchRecruitsCount(@ModelAttribute SearchVO searchVO) {
        return ums.searchUserCnt(searchVO);
    }

}

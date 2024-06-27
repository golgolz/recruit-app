package kr.co.sist.user.controller.basic;

import java.util.HashMap;
import java.util.Map;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import kr.co.sist.user.service.basic.UserBasicService;

@SessionAttributes({"userId", "name"})
@Controller
public class UserBasicController {

    private final UserBasicService ubs;

    public UserBasicController(UserBasicService ubs) {
        this.ubs = ubs;
    }

    @GetMapping("/user/loginPage.do")
    public String LoginPage() {
        return "user/login";
    }

    @GetMapping("/user/signupPage.do")
    public String signupPage() {
        return "user/signup";
    }

    @GetMapping("/user/findMail.do")
    public String findMailPage() {
        return "user/findMail";
    }

    @GetMapping("/user/findPass.do")
    public String findPassPage() {
        return "user/findPass";
    }

    @GetMapping("/main/mainPage.do")
    public String mainPage() {
        return "main/main";
    }

    @GetMapping("/user/checkDuplId.do")
    public @ResponseBody Map<String, String> checkDuplId(String userId) {

        String checkId = ubs.checkDuplicationId(userId);

        Map<String, String> response = new HashMap<String, String>();

        if (checkId == null || checkId.isEmpty()) {
            response.put("result", "success");
            response.put("chkMsg", "가입 가능한 이메일입니다.");
        } else {
            response.put("result", "fail");
            response.put("chkMsg", "이미 가입된 이메일입니다.");
        }

        return response;
    }

}

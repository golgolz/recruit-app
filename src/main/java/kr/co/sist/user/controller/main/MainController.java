package kr.co.sist.user.controller.main;

import java.util.List;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import kr.co.sist.user.service.main.MainService;
import kr.co.sist.user.vo.main.MainVO;

@Controller
public class MainController {
    @Autowired(required = false)
    private MainService mainService;

    
    
    @GetMapping("/mainTest.do")
    public String mainTest(Model model) {
        List<MainVO> recentJobPosts = mainService.getRecentJobPosts();
        model.addAttribute("recentJobPosts", recentJobPosts);
        return "mainTest";
    }
   
    @GetMapping("/")
    public String redirectToMain() {
        return "redirect:/main/main.do";
    }
    
    
    @GetMapping("/main/main.do")
    public String main(HttpSession session, Model model) {
        List<MainVO> recentJobPosts = mainService.getRecentJobPosts();
        List<MainVO> highSalaryPositions = mainService.getHighSalaryPositions();
        List<MainVO> viewHistory = mainService.getViewHistory();

        String userId = (String) session.getAttribute("userId");
        List<MainVO> interestedPositions;

        if (userId != null) {
            interestedPositions = mainService.getInterestedPositions(userId);
        } else {
            interestedPositions = mainService.getDefaultInterestedPositions();
        }

        model.addAttribute("recentJobPosts", recentJobPosts);
        model.addAttribute("interestedPositions", interestedPositions);
        model.addAttribute("highSalaryPositions", highSalaryPositions);
        model.addAttribute("viewHistory", viewHistory);

        return "main/main"; // "WEB-INF/views/main/main.jsp" 경로에 매핑
    }
    
    
    
}

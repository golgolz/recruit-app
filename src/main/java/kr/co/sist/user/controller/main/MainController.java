package kr.co.sist.user.controller.main;

import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.util.List;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import kr.co.sist.user.service.main.MainService;
import kr.co.sist.user.vo.main.MainVO;

@Controller
@RequestMapping("/main")
public class MainController {
    @Autowired(required = false)
    private MainService mainService;

    
    
   
    @GetMapping("/")
    public String redirectToMain() {
        return "redirect:/main/main.do";
    }
    
    
    @GetMapping("/main.do")
    public String main(HttpSession session, HttpServletRequest request, Model model) throws UnsupportedEncodingException {
        List<MainVO> recentJobPosts = mainService.getRecentJobPosts();
        List<MainVO> highSalaryPositions = mainService.getHighSalaryPositions();

        String userId = (String) session.getAttribute("userId");
        List<MainVO> interestedPositions;
        List<MainVO> viewHistory;

        if (userId != null) {
            interestedPositions = mainService.getInterestedPositions(userId);
            viewHistory = mainService.getViewHistory(userId);
        } else {
            interestedPositions = mainService.getDefaultInterestedPositions();
            Cookie[] cookies = request.getCookies();
            String viewHistoryCookie = null;
            if (cookies != null) {
                for (Cookie cookie : cookies) {
                    if (cookie.getName().equals("viewHistory")) {
                        viewHistoryCookie = URLDecoder.decode(cookie.getValue(), "UTF-8");
                        break;
                    }
                }
            }

            // �α� �߰�
            System.out.println("��Ű���� �ҷ��� viewHistoryCookie: " + viewHistoryCookie);

            viewHistory = mainService.getViewHistoryFromCookie(viewHistoryCookie);
        }

        model.addAttribute("recentJobPosts", recentJobPosts);
        model.addAttribute("interestedPositions", interestedPositions);
        model.addAttribute("highSalaryPositions", highSalaryPositions);
        model.addAttribute("viewHistory", viewHistory);

        return "main/main"; // "WEB-INF/views/main/main.jsp" ��ο� ����
    }

    @GetMapping("/detail.do")
    public String mainDetail(HttpServletRequest request, HttpServletResponse response, @RequestParam("id") String recruitNum, Model model) throws Exception {
        // ����� �α� �߰�
        System.out.println("mainDetail �޼ҵ� ȣ��� - recruitNum: " + recruitNum);

        // ���� �� ������ �������� ���� �߰�
        MainVO recruitDetail = mainService.getRecruitDetail(recruitNum);
        model.addAttribute("recruitDetail", recruitDetail);

        // ��Ű�� �湮 ��� �߰�
        Cookie[] cookies = request.getCookies();
        String viewHistoryCookie = null;
        if (cookies != null) {
            for (Cookie cookie : cookies) {
                if (cookie.getName().equals("viewHistory")) {
                    viewHistoryCookie = URLDecoder.decode(cookie.getValue(), "UTF-8");
                    break;
                }
            }
        }

        // �α� �߰�
        System.out.println("���� ��Ű ��: " + viewHistoryCookie);

        if (viewHistoryCookie == null) {
            viewHistoryCookie = recruitNum;
        } else {
            viewHistoryCookie = viewHistoryCookie + "," + recruitNum;
        }

        String encodedCookieValue = URLEncoder.encode(viewHistoryCookie, "UTF-8");
        Cookie newCookie = new Cookie("viewHistory", encodedCookieValue);
        newCookie.setMaxAge(60 * 60 * 24 * 1); // ��Ű ��ȿ�Ⱓ 1��
        newCookie.setPath("/");

        // ��Ű ���� �� �α� ���
        System.out.println("������ ��Ű ��: " + newCookie.getValue());

        response.addCookie(newCookie);

        return "recruit/detail"; // ���� �� ������ JSP ���
    }
    
}

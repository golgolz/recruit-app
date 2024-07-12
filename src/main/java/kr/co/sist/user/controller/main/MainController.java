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
        List<MainVO> interestedPositions = (userId != null) ? mainService.getInterestedPositions(userId) : mainService.getDefaultInterestedPositions();
        List<MainVO> viewHistory;

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

        // 디버깅 로그 추가
        System.out.println("쿠키에서 추출한 viewHistoryCookie: " + viewHistoryCookie);

        viewHistory = mainService.getViewHistoryFromCookie(viewHistoryCookie);

        model.addAttribute("recentJobPosts", recentJobPosts);
        model.addAttribute("interestedPositions", interestedPositions);
        model.addAttribute("highSalaryPositions", highSalaryPositions);
        model.addAttribute("viewHistory", viewHistory);

        return "main/main"; // "WEB-INF/views/main/main.jsp" 파일과 매핑
    }

    @GetMapping("/detail.do")
    public String mainDetail(HttpServletRequest request, HttpServletResponse response, @RequestParam("id") String recruitNum, Model model) throws Exception {
        // 디버깅 로그 추가
        System.out.println("mainDetail 메소드 호출 - recruitNum: " + recruitNum);

        // 채용 공고 상세 정보 조회
        MainVO recruitDetail = mainService.getRecruitDetail(recruitNum);
        model.addAttribute("recruitDetail", recruitDetail);

        // 쿠키에 방문 기록 추가
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

        // 디버깅 로그 추가
        System.out.println("기존 쿠키 값: " + viewHistoryCookie);

        if (viewHistoryCookie == null) {
            viewHistoryCookie = recruitNum;
        } else {
            viewHistoryCookie = viewHistoryCookie + "," + recruitNum;
        }

        String encodedCookieValue = URLEncoder.encode(viewHistoryCookie, "UTF-8");
        Cookie newCookie = new Cookie("viewHistory", encodedCookieValue);
        newCookie.setMaxAge(60 * 60 * 1); // 쿠키 유효기간 1시간
        newCookie.setPath("/");

        // 쿠키 설정 및 로그 추가
        response.addCookie(newCookie);

        return "recruit/detail"; // 상세 페이지로 이동할 JSP 경로
    }
    
    
    @GetMapping("/logout")
    public String logout(HttpSession session, HttpServletRequest request, HttpServletResponse response) throws Exception {
        // 세션 무효화
        session.invalidate();

        // 쿠키 삭제
        Cookie[] cookies = request.getCookies();
        if (cookies != null) {
            for (Cookie cookie : cookies) {
                if ("viewHistory".equals(cookie.getName())) {
                    cookie.setValue(null);
                    cookie.setMaxAge(0);
                    cookie.setPath("/");
                    response.addCookie(cookie);
                }
            }
        }

        // 리디렉션 설정 (쿼리 파라미터 없이)
        return "redirect:/main/main.do";
    }
    
}

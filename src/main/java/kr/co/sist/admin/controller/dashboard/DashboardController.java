package kr.co.sist.admin.controller.dashboard;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import com.fasterxml.jackson.databind.ObjectMapper;
import kr.co.sist.admin.service.dashboard.DashboardService;
import kr.co.sist.admin.vo.dashboard.RegisteredCompanyCountVO;
import kr.co.sist.admin.vo.dashboard.ReviewCountVO;
import kr.co.sist.admin.vo.dashboard.SignupCountVO;
import kr.co.sist.admin.vo.dashboard.SkillCountVO;

@Controller
public class DashboardController {
    @Autowired
    private DashboardService dashboardService;

    // ��ú��� ȭ�� ǥ��
    @GetMapping("/manage/dashboard/dashboard.do")
    public String dashboard(Model model) {
        List<SignupCountVO> signupCountsLastWeek = dashboardService.getSignupCountsForLastWeek();
        List<RegisteredCompanyCountVO> registeredCompanyCountsLastWeek = dashboardService.getRegisteredCompanyCountsForLastWeek();
        List<SkillCountVO> skillCounts = dashboardService.getSkillCounts();
        List<ReviewCountVO> reviewCountsLastSixMonths = dashboardService.getReviewCountsForLastSixMonths();

        // ������ ī��Ʈ
        int totalSignups = signupCountsLastWeek.stream().mapToInt(SignupCountVO::getSignupCount).sum();
        int totalCompanies = registeredCompanyCountsLastWeek.stream().mapToInt(RegisteredCompanyCountVO::getCompanyCount).sum();
        int totalReviews = reviewCountsLastSixMonths.stream().mapToInt(ReviewCountVO::getReviewCount).sum();

        ObjectMapper mapper = new ObjectMapper();
        try {
            String signupCountsJson = mapper.writeValueAsString(signupCountsLastWeek);
            String registeredCompanyCountsJson = mapper.writeValueAsString(registeredCompanyCountsLastWeek);
            String skillCountsJson = mapper.writeValueAsString(skillCounts);
            String reviewCountsJson = mapper.writeValueAsString(reviewCountsLastSixMonths);
            model.addAttribute("signupCountsLastWeekJson", signupCountsJson);
            model.addAttribute("registeredCompanyCountsLastWeekJson", registeredCompanyCountsJson);
            model.addAttribute("skillCountsJson", skillCountsJson);
            model.addAttribute("reviewCountsJson", reviewCountsJson);
            model.addAttribute("totalSignups", totalSignups);
            model.addAttribute("totalCompanies", totalCompanies);
            model.addAttribute("totalReviews", totalReviews);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "manage/dashboard/dashboard";
    }
}


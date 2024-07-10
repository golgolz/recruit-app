package kr.co.sist.admin.controller.recruit;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import kr.co.sist.admin.domain.recruit.RecruitDomain;
import kr.co.sist.admin.domain.resume.CompanyDomain;
import kr.co.sist.admin.service.recruit.RecruitAdminService;
import kr.co.sist.admin.vo.recruit.SearchVO;
import kr.co.sist.admin.vo.resume.RecruitAdminVO;

@Controller
public class RecruitAdminController {
    private final RecruitAdminService recruitAdminService;

    @Autowired(required = false)
    public RecruitAdminController(RecruitAdminService recruitAdminService) {
        this.recruitAdminService = recruitAdminService;
    }

    @GetMapping("/manage/recruit/recruits.do")
    public String showRecruitPage() {
        return "/manage/recruit/recruits";
    }

    @GetMapping("/manage/recruit/detail.do")
    public String showRecruitDetailPage(
            @RequestParam(value = "id", required = false) Integer recruitNum, Model model) {
        model.addAttribute("recruitNum", recruitNum);
        return "/manage/recruit/detail";
    }

    @GetMapping("/api/manage/recruits.do")
    @ResponseBody
    public List<RecruitDomain> searchRecruits(@ModelAttribute SearchVO searchVO) {
        return recruitAdminService.searchRecruits(searchVO);
    }

    @GetMapping("/api/manage/recruit.do")
    @ResponseBody
    public RecruitDomain searchOneRecruit(@RequestParam("id") int recruitNum) {
        RecruitDomain result = recruitAdminService.searchOneRecruit(recruitNum);
        result.setId(recruitNum);

        return result;
    }

    @GetMapping("/api/manage/recruit/counts.do")
    @ResponseBody
    public int searchRecruitsCount(@ModelAttribute SearchVO searchVO) {
        return recruitAdminService.searchRecruitsCount(searchVO);
    }

    @GetMapping("/api/manage/recruit/companies.do")
    @ResponseBody
    public List<CompanyDomain> selectCompanies(String keyword) {
        return recruitAdminService.selectCompanies(keyword);
    }

    @PostMapping("/api/manage/recruit.do")
    @ResponseBody
    public String addRecruit(@RequestBody RecruitAdminVO recruitVO) {
        String result = "success";

        if (!recruitAdminService.addRecruit(recruitVO)) {
            result = "fail";
        }

        return result;
    }

    @PutMapping("/api/manage/recruit.do")
    @ResponseBody
    public String modifyRecruit(@RequestBody RecruitAdminVO recruitVO) {
        String result = "success";
        if (!recruitAdminService.modifyRecruit(recruitVO)) {
            result = "fail";
        }

        return result;
    }

    @DeleteMapping("/api/manage/recruit.do")
    @ResponseBody
    public String deleteRecruit(@RequestParam("id") int recruitNum) {
        String result = "success";

        if (!recruitAdminService.deleteRecruit(recruitNum)) {
            result = "fail";
        }

        return result;
    }
}

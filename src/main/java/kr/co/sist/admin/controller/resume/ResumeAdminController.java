package kr.co.sist.admin.controller.resume;

import java.util.List;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import kr.co.sist.admin.domain.resume.ResumeDomain;
import kr.co.sist.admin.domain.resume.ResumeListDomain;
import kr.co.sist.admin.service.resume.ResumeAdminService;
import kr.co.sist.admin.vo.resume.SearchVO;

@Controller
public class ResumeAdminController {
    private final ResumeAdminService resumeAdminService;

    public ResumeAdminController(ResumeAdminService resumeAdminService) {
        this.resumeAdminService = resumeAdminService;
    }

    @GetMapping("/manage/index.do")
    public String goManage() {
        return "/manage/index";
    }

    @GetMapping("/manage/resumes.do")
    public String showResumePage(@RequestParam("recruitNum") String recruitNum,
            @RequestParam("companyCode") String companyCode, Model model) {
        model.addAttribute("recruitNum", recruitNum);
        model.addAttribute("companyCode", companyCode);
        return "/manage/recruit/resume/resumes";
    }

    @GetMapping(value = "/api/manage/resume/recruit.do", produces = "text/plain;charset=UTF-8")
    @ResponseBody
    public String searchRecruitTitle(@RequestParam("recruitNum") int recruitNum) {
        return resumeAdminService.searchRecruitTitle(recruitNum);
    }

    @GetMapping("/manage/resumes/detail.do")
    public String showResumeDetailPage(@RequestParam("id") String resumeNum,
            @RequestParam("recruitNum") String recruitNum, Model model) {
        model.addAttribute("resumeNum", resumeNum);
        model.addAttribute("recruitNum", recruitNum);
        return "/manage/recruit/resume/detail";
    }

    @GetMapping("/api/manage/resumes.do")
    @ResponseBody
    public List<ResumeListDomain> searchResumes(@ModelAttribute SearchVO searchVO) {
        List<ResumeListDomain> resumes = resumeAdminService.searchResumes(searchVO);
        return resumes;
    }

    @GetMapping("/api/manage/resume/counts.do")
    @ResponseBody
    public int searchResumeCount(@ModelAttribute SearchVO searchVO) {
        return resumeAdminService.searchResumeCount(searchVO);
    }

    @GetMapping("/api/manage/resumes/detail.do")
    @ResponseBody
    public ResumeDomain searchOneResume(@RequestParam("id") String resumeNum) {
        ResumeDomain resume = resumeAdminService.searchOneResume(resumeNum);

        return resume;
    }
}

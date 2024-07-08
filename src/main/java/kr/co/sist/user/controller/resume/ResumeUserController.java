package kr.co.sist.user.controller.resume;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import kr.co.sist.user.domain.resume.ResumeListDomain;
import kr.co.sist.user.service.resume.ResumeUserService;

@Controller
public class ResumeUserController {
    @Autowired(required = false)
    private final ResumeUserService resumeUserService;

    public ResumeUserController(ResumeUserService resumeUserService) {
        this.resumeUserService = resumeUserService;
    }

    @GetMapping("/resumes.do")
    public String showResumePage() {
        return "/resume/resumes";
    }

    @GetMapping("/resume/detail.do")
    public String showResumeDetailPage(
            @RequestParam(value = "id", required = false) Integer resumeNum, Model model) {
        model.addAttribute("resumeNum", resumeNum);
        return "/resumes/detail";
    }

    @GetMapping("/api/resumes.do")
    @ResponseBody
    public List<ResumeListDomain> searchResumes(@RequestParam("id") String resumeNum) {
        return resumeUserService.searchResumes(resumeNum);
    }
}

package kr.co.sist.user.controller.recruit;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import kr.co.sist.admin.domain.recruit.RecruitDomain;
import kr.co.sist.domain.companyinfo.WelfareDomain;
import kr.co.sist.user.domain.recruit.RecruitListDomain;
import kr.co.sist.user.service.recruit.RecruitUserService;
import kr.co.sist.user.vo.recruit.SearchVO;

@Controller
public class RecruitUserController {
    private final RecruitUserService recruitUserService;

    @Autowired(required = false)
    public RecruitUserController(RecruitUserService recruitUserService) {
        this.recruitUserService = recruitUserService;
    }

    @GetMapping("/recruits.do")
    public String showRecruitPage() {
        return "/recruit/recruits";
    }

    @GetMapping("/recruit/detail.do")
    public String showRecruitDetailPage(
            @RequestParam(value = "id", required = false) Integer recruitNum, Model model) {
        model.addAttribute("recruitNum", recruitNum);
        return "/recruit/detail";
    }

    @GetMapping("/api/recruits.do")
    @ResponseBody
    public List<RecruitListDomain> searchRecruits(@ModelAttribute SearchVO searchVO) {
        if (searchVO.getPositions() != null && !searchVO.getPositions().isEmpty()) {
            searchVO.setPositionList(Arrays.asList(searchVO.getPositions().split(",")));
        } else {
            searchVO.setPositionList(new ArrayList<>());
        }

        return recruitUserService.searchRecruits(searchVO);
    }

    @GetMapping("/api/recruits/counts.do")
    @ResponseBody
    public int selectRecruitCount(SearchVO searchVO) {
        if (searchVO.getPositions() != null && !searchVO.getPositions().isEmpty()) {
            searchVO.setPositionList(Arrays.asList(searchVO.getPositions().split(",")));
        } else {
            searchVO.setPositionList(new ArrayList<>());
        }

        return recruitUserService.selectRecruitCount(searchVO);
    }

    @GetMapping("/api/recruit.do")
    @ResponseBody
    public RecruitDomain searchOneRecruit(@RequestParam("id") int recruitId) {
        return recruitUserService.searchOneRecruit(recruitId);
    }

    @GetMapping("/api/welfares.do")
    @ResponseBody
    public List<WelfareDomain> selectWelfare(@RequestParam("company") String companyCode) {
        return recruitUserService.selectWelfare(companyCode);
    }
}

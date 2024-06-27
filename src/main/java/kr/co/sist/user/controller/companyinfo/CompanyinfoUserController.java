package kr.co.sist.user.controller.companyinfo;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import kr.co.sist.domain.companyinfo.SearchDomain;
import kr.co.sist.user.service.companyinfo.CompanyinfoUserService;
import kr.co.sist.vo.companyinfo.SearchVO;

@Controller
public class CompanyinfoUserController {
     @Autowired(required=false)
     private CompanyinfoUserService companyinfoUserService;
//    private final CompanyinfoUserService companyinfoUserService;
//
//    @Autowired(required = false)
//    public CompanyinfoUserController(CompanyinfoUserService companyinfoUserService) {
//        this.companyinfoUserService = companyinfoUserService;
//    }

    @GetMapping("/companyinfo/companyinfoList.do")
    public String searchAllCompanyinfo(Model model) {
        System.out.println("이건 컨트롤러야");
        List<SearchDomain> list=companyinfoUserService.searchAllCompanyinfo();
        model.addAttribute("listCompanyinfo",list);
//        return "companyinfo/companyinfo_list";
        return "companyinfo/user_company_info";
    }
    
    @GetMapping("/companyinfo/search_test.do")
    public String SearchCompanyinfoList(Model model, @ModelAttribute SearchVO sVO) {
        List<SearchDomain> list = companyinfoUserService.searchCompanyinfoList(sVO);
        model.addAttribute("listCompanyinfo", list);
        return "companyinfo/search_test";
    }
    
    @ResponseBody
    @PostMapping("/companyinfo/search_test.do")
    public Map<String, Object> companyinfoSearchList(Model model, @RequestParam(name = "companyName" , defaultValue ="null")String companyName, @RequestParam(name = "avgSal" , defaultValue ="0")String strAvgSal, @RequestParam(name = "selectedValue" , defaultValue ="선택안함")String selectedValue) {
        int avgSal=Integer.parseInt(strAvgSal);
     // 검색 조건을 HashMap에 저장
        Map<String, Object> params = new HashMap<>();
        params.put("companyName", companyName);
        params.put("avgSal", avgSal);
        params.put("companyClassification", selectedValue);
        System.out.println("이건 controller의 params야 : "+params);

        // 서비스 계층에 검색 요청
        List<SearchDomain> companyList = companyinfoUserService.searchCompanyinfo(params);

        // 결과 데이터와 상태를 담을 Map 생성
        Map<String, Object> response = new HashMap<>();
        response.put("companyList", companyList);
        response.put("status", "success"); // 성공 상태 추가

        return response;
    }
    
    @GetMapping("/companyinfo/companyinfoDetail.do")
    public String searchCompanyinfoDetail(String companyCode, Model model) {
        List<SearchDomain> list=companyinfoUserService.searchCompanyinfoDetail(companyCode);
        model.addAttribute("companyDetail",list);
        return "companyinfo/companyinfo_list";
//        return "companyinfo/user_company_detail";
    }

//    @GetMapping("/recruit.do")
//    public RecruitDomain searchOneRecruit(@RequestParam("id") int recruitId) {
//        return recruitUserService.searchOneRecruit(recruitId);
//    }
}

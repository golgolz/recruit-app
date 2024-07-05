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
    @Autowired(required = false)
    private CompanyinfoUserService companyinfoUserService;

    @GetMapping("/companyinfo/companyinfoList.do")
    public String searchAllCompanyinfo(Model model) {
        // System.out.println("�̰� ��Ʈ�ѷ���");
        List<SearchDomain> list = companyinfoUserService.searchAllCompanyinfo();
        model.addAttribute("listCompanyinfo", list);
        // return "companyinfo/companyinfo_list";
        return "companyinfo/user_company_info";
    }

    @GetMapping("/companyinfo/search_test.do")
    public String SearchCompanyinfoList(Model model, @ModelAttribute SearchVO sVO) {
        List<SearchDomain> list = companyinfoUserService.searchCompanyinfoList(sVO);
        model.addAttribute("listCompanyinfo", list);
        return "companyinfo/search_test";
    }

    @ResponseBody
    @PostMapping("/companyinfo/companySearchList.do")
    public Map<String, Object> companyinfoSearchList(Model model,
            @RequestParam(name = "companyName", defaultValue = "null") String companyName,
            @RequestParam(name = "avgSal", defaultValue = "0") String strAvgSal,
            @RequestParam(name = "selectedValue", defaultValue = "���þ���") String selectedValue) {
        int avgSal = Integer.parseInt(strAvgSal);
        // �˻� ������ HashMap�� ����
        Map<String, Object> params = new HashMap<>();
        params.put("companyName", companyName);
        params.put("avgSal", avgSal);
        params.put("companyClassification", selectedValue);
        // System.out.println("�̰� controller�� params�� : "+params);

        // ���� ������ �˻� ��û
        List<SearchDomain> companyList = companyinfoUserService.searchCompanyinfo(params);

        // ��� �����Ϳ� ���¸� ���� Map ����
        Map<String, Object> response = new HashMap<>();
        response.put("companyList", companyList);
        response.put("status", "success"); // ���� ���� �߰�

        return response;
    }

    @GetMapping("/companyinfo/companyinfoDetail.do")
    public String searchCompanyinfoDetail(String companyCode, Model model) {
        List<SearchDomain> list = companyinfoUserService.searchCompanyinfoDetail(companyCode);
        List<SearchDomain> list2 = companyinfoUserService.searchHistory(companyCode);
        List<SearchDomain> list3 = companyinfoUserService.searchWelfare(companyCode);
        model.addAttribute("companyDetail", list);
        model.addAttribute("history", list2);
        model.addAttribute("welfare", list3);
        // return "companyinfo/companyinfo_list";
        return "companyinfo/user_company_detail";
    }

}

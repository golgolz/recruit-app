package kr.co.sist.admin.controller.companyinfo;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import kr.co.sist.admin.service.companyinfo.CompanyinfoAdminService;
import kr.co.sist.domain.companyinfo.SearchDomain;

@Controller
public class CompanyinfoAdminController {
     @Autowired(required=false)
     private CompanyinfoAdminService companyinfoAdminService;

    @GetMapping("/companyinfo/adminCompanyinfoList.do")
    public String searchAllCompanyinfo(Model model) {
        List<SearchDomain> list=companyinfoAdminService.searchAllCompanyinfo();
        model.addAttribute("listCompanyinfo",list);
        return "companyinfo/companies";
    }
    @GetMapping("/companyinfo/adminCompanyinfoDetail.do")
    public String companyinfoDetail(String companyCode, Model model) {
        List<SearchDomain> list=companyinfoAdminService.searchCompanyinfoDetail(companyCode);
        List<SearchDomain> list2=companyinfoAdminService.searchHistory(companyCode);
        List<SearchDomain> list3=companyinfoAdminService.searchWelfare(companyCode);
        model.addAttribute("companyDetail",list);
        model.addAttribute("history",list2);
        model.addAttribute("welfare",list3);
        return "companyinfo/admin_company_detail";
    }
    @GetMapping("/companyinfo/adminCompanyinfoWrite.do")
    public String insertCompanyinfoPage() {
        return "companyinfo/admin_company_detail_write";
    }
    
//    @GetMapping("/companyinfo/search_test.do")
//    public String SearchCompanyinfoList(Model model, @ModelAttribute SearchVO sVO) {
//        List<SearchDomain> list = companyinfoAdminService.searchCompanyinfoList(sVO);
//        model.addAttribute("listCompanyinfo", list);
//        return "companyinfo/search_test";
//    }
//    
//    @ResponseBody
//    @PostMapping("/companyinfo/companySearchList.do")
//    public Map<String, Object> companyinfoSearchList(Model model, @RequestParam(name = "companyName" , defaultValue ="null")String companyName, @RequestParam(name = "avgSal" , defaultValue ="0")String strAvgSal, @RequestParam(name = "selectedValue" , defaultValue ="���þ���")String selectedValue) {
//        int avgSal=Integer.parseInt(strAvgSal);
//     // �˻� ������ HashMap�� ����
//        Map<String, Object> params = new HashMap<>();
//        params.put("companyName", companyName);
//        params.put("avgSal", avgSal);
//        params.put("companyClassification", selectedValue);
//        System.out.println("�̰� controller�� params�� : "+params);
//
//        // ���� ������ �˻� ��û
//        List<SearchDomain> companyList = companyinfoAdminService.searchCompanyinfo(params);
//
//        // ��� �����Ϳ� ���¸� ���� Map ����
//        Map<String, Object> response = new HashMap<>();
//        response.put("companyList", companyList);
//        response.put("status", "success"); // ���� ���� �߰�
//
//        return response;
//    }
//    
//    @GetMapping("/companyinfo/companyinfoDetail.do")
//    public String searchCompanyinfoDetail(String companyCode, Model model) {
//        List<SearchDomain> list=companyinfoAdminService.searchCompanyinfoDetail(companyCode);
//        model.addAttribute("companyDetail",list);
//        return "companyinfo/companyinfo_list";
////        return "companyinfo/user_company_detail";
//    }

}
package kr.co.sist.admin.controller.companyinfo;

import java.io.File;
import java.io.IOException;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import kr.co.sist.admin.service.companyinfo.CompanyinfoAdminService;
import kr.co.sist.domain.companyinfo.SearchDomain;
import kr.co.sist.vo.companyinfo.CompanyinfoVO;

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
        System.out.println("get");
        return "companyinfo/admin_company_detail_write";
    }

    @PostMapping("/companyinfo/addCompanyinfoWrite.do")
    public String insertCompanyinfoPage(CompanyinfoVO cVO,HttpServletRequest request) throws IOException {
        String nextCompNum=companyinfoAdminService.searchNextCompNum();
        String uploadLogoPath = "C:/dev/recruit-app/src/main/webapp/WEB-INF/views/assets/images/company/logo";

        File logoDir = new File(uploadLogoPath);

        if (!logoDir.exists()) {
            logoDir.mkdirs();
        }

        int maxSize = 100 * 1024 * 1024; // 100MB
        MultipartRequest mrLogo = new MultipartRequest(request, uploadLogoPath, maxSize, "UTF-8", new DefaultFileRenamePolicy());

        String companyName = mrLogo.getParameter("companyName");
        String businessNumber = mrLogo.getParameter("businessNumber");
        int headcount = Integer.parseInt(mrLogo.getParameter("headcount"));
        String establishmentDate = mrLogo.getParameter("establishmentDate");
        int revenue = Integer.parseInt(mrLogo.getParameter("revenue"));
        String description = mrLogo.getParameter("description");
        String addr = mrLogo.getParameter("addr");
        String ceoName = mrLogo.getParameter("ceoName");
        int avgSal = Integer.parseInt(mrLogo.getParameter("avgSal"));
        String companyClassification = mrLogo.getParameter("companyClassification");
        String inputDate = mrLogo.getParameter("inputDate");
        String logo = mrLogo.getFilesystemName("logo");
        String companyImg = mrLogo.getFilesystemName("companyImg");

        cVO.setCompanyName(companyName);
        cVO.setBusinessNumber(businessNumber);
        cVO.setHeadcount(headcount);
        cVO.setEstablishmentDate(establishmentDate);
        cVO.setRevenue(revenue);
        cVO.setDescription(description);
        cVO.setAddr(addr);
        cVO.setCeoName(ceoName);
        cVO.setAvgSal(avgSal);
        cVO.setCompanyClassification(companyClassification);
        cVO.setInputDate(inputDate);
        cVO.setLogo(logo);
        cVO.setCompanyImg(companyImg);
        cVO.setCompanyCode(nextCompNum);
        System.out.println("cVO.toString() : " + cVO.toString());
        
        companyinfoAdminService.addCompanyinfoDetail(cVO);
        
        return "companyinfo/admin_company_detail_write";
    }
    
    @PostMapping("/companyinfo/addCompanyinfoDetail.do")
    public String addCompanyinfo(CompanyinfoVO companyinfoVO) {
        String result = "success";
        if (!companyinfoAdminService.addCompanyinfoDetail(companyinfoVO)) {
            result = "fail";
        }
        return result;
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
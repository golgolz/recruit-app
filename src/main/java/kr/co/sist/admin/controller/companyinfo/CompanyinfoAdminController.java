package kr.co.sist.admin.controller.companyinfo;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
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
    public String companyinfoDetail(String companyCode, HttpSession session, Model model) {
        List<SearchDomain> list=companyinfoAdminService.searchCompanyinfoDetail(companyCode);
        List<SearchDomain> list2=companyinfoAdminService.searchHistory(companyCode);
        List<SearchDomain> list3=companyinfoAdminService.searchWelfare(companyCode);
        
        session.setAttribute("companyCode", companyCode);
        
        model.addAttribute("companyDetail",list);
        model.addAttribute("history",list2);
        model.addAttribute("welfare",list3);
        return "companyinfo/admin_company_detail";
    }
    @GetMapping("/companyinfo/adminCompanyinfoWrite.do")
    public String insertCompanyinfoPage() {
        return "companyinfo/admin_company_detail_write";
    }
  
    @GetMapping("/companyinfo/adminHistoryWelfare.do")
    public String selectHistoryWelfareDetail(String companyCode, Model model, HttpSession session) {
        List<SearchDomain> list=companyinfoAdminService.searchCompanyinfoDetail(companyCode);
        List<SearchDomain> list2=companyinfoAdminService.searchHistory(companyCode);
        List<SearchDomain> list3=companyinfoAdminService.searchWelfare(companyCode);
        
        session.setAttribute("companyCode", companyCode);
        
        model.addAttribute("companyDetail",list);
        model.addAttribute("history",list2);
        model.addAttribute("welfare",list3);
      
        return "companyinfo/admin_history_welfare";
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
        
        return "redirect:/companyinfo/adminCompanyinfoList.do";
    }
    
    @PostMapping("/companyinfo/addCompanyinfoDetail.do")
    public String addCompanyinfo(CompanyinfoVO companyinfoVO) {
        String result = "success";
        if (!companyinfoAdminService.addCompanyinfoDetail(companyinfoVO)) {
            result = "fail";
        }
        return result;
    }
    
    @PostMapping("/companyinfo/updateCompanyinfo.do")
    public String updateCompanyinfo(CompanyinfoVO cVO ,HttpServletRequest request, HttpSession session) throws IOException {
        
        
        String uploadLogoPath = "C:/dev/recruit-app/src/main/webapp/WEB-INF/views/assets/images/company/logo";

        File logoDir = new File(uploadLogoPath);
        //경로가 없을 시 예외를 던진다.
        if (!logoDir.exists()) {
            throw new IOException("찾을수 없는 경로입니다");
        }
        
        int maxSize = 100 * 1024 * 1024; // 100MB
        MultipartRequest mrLogo = new MultipartRequest(request, uploadLogoPath, maxSize, "UTF-8", new DefaultFileRenamePolicy());
        
        String mainImg = mrLogo.getFilesystemName("logo");
        String subImg = mrLogo.getFilesystemName("companyImg");
        
        String existingMainImg = mrLogo.getParameter("existLogo");
        String existingSubImg = mrLogo.getParameter("existImg");
        
        //새로 등록한 이미지가 없을경우 본래 이미지로 대체
        if(mainImg == null && existingMainImg != null) {
             mainImg = existingMainImg;
         }
        if(subImg == null && existingSubImg != null) {
            subImg = existingSubImg;
         }
        System.out.println("mainImg: "+mainImg+", subImg: "+subImg+", existingMainImg: "+existingMainImg+", existingSubImg: "+existingSubImg);
        
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
        String companyCode= (String) session.getAttribute("companyCode");

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
        cVO.setLogo(mainImg);
        cVO.setCompanyImg(subImg);
        cVO.setCompanyCode(companyCode);
        System.out.println("cVO.toString() : " + cVO.toString());
        
        File tempFile = new File(logoDir.getAbsolutePath()+"/"+ mainImg);
        File subFile = new File(logoDir.getAbsolutePath()+"/"+ subImg);
  
        if(tempFile.length() > maxSize) { //업로드 제한
            tempFile.delete();
        }
        if(subFile.length() > maxSize) { //업로드 제한
            subFile.delete();
        }
        
        companyinfoAdminService.updateCompanyinfo(cVO);
        
        return "redirect:/companyinfo/adminCompanyinfoList.do";
    }//updateCompanyinfo
    
    @PostMapping("/companyinfo/deleteHistory.do")
    public String deleteHistory(@RequestParam("hidHistory") String baseDate, HttpSession session) {
        Map<String, Object> param=new HashMap<String, Object>();
        String companyCode=(String) session.getAttribute("companyCode");
        param.put("baseDate", baseDate);
        param.put("companyCode", companyCode);
        
        companyinfoAdminService.deleteHistory(param);
        
       return "redirect:/companyinfo/adminHistoryWelfare.do?companyCode=" + companyCode;  
       }
    
    @PostMapping("/companyinfo/deleteWelfare.do")
    public String deleteWelfare(@RequestParam("hidWelfare") String category, HttpSession session) {
        Map<String, Object> param=new HashMap<String, Object>();
        String companyCode=(String) session.getAttribute("companyCode");
        param.put("category", category);
        param.put("companyCode", companyCode);
        
        companyinfoAdminService.deleteWelfare(param);
        
        return "redirect:/companyinfo/adminHistoryWelfare.do?companyCode=" + companyCode;
    }
    
//    @GetMapping("/companyinfo/search_test.do")
//    public String SearchCompanyinfoList(Model model, @ModelAttribute SearchVO sVO) {
//        List<SearchDomain> list = companyinfoAdminService.searchCompanyinfoList(sVO);
//        model.addAttribute("listCompanyinfo", list);
//        return "companyinfo/search_test";
//    }
//    
    @ResponseBody
    @PostMapping("/companyinfo/adminCompanySearchList.do")
    public Map<String, Object> companyinfoSearchList(Model model, @RequestParam(name = "companyName" , defaultValue ="null")String companyName, @RequestParam(name = "avgSal" , defaultValue ="0")String strAvgSal, @RequestParam(name = "selectedValue" , defaultValue ="선택안함")String selectedValue) {
        int avgSal=Integer.parseInt(strAvgSal);
     // 검색 조건을 HashMap에 저장
        Map<String, Object> params = new HashMap<>();
        params.put("companyName", companyName);
        params.put("avgSal", avgSal);
        params.put("companyClassification", selectedValue);
        System.out.println("이건 controller의 params야 : "+params);

        // 서비스 계층에 검색 요청
        List<SearchDomain> companyList = companyinfoAdminService.searchCompanyinfo(params);

        // 결과 데이터와 상태를 담을 Map 생성
        Map<String, Object> response = new HashMap<>();
        response.put("adminCompanyList", companyList);
        response.put("status", "success"); // 성공 상태 추가

        return response;
    }
//    
//    @GetMapping("/companyinfo/companyinfoDetail.do")
//    public String searchCompanyinfoDetail(String companyCode, Model model) {
//        List<SearchDomain> list=companyinfoAdminService.searchCompanyinfoDetail(companyCode);
//        model.addAttribute("companyDetail",list);
//        return "companyinfo/companyinfo_list";
////        return "companyinfo/user_company_detail";
//    }

}
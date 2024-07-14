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
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import kr.co.sist.admin.service.companyinfo.CompanyinfoAdminService;
import kr.co.sist.domain.companyinfo.SearchDomain;
import kr.co.sist.vo.companyinfo.CompanyinfoVO;
import kr.co.sist.vo.companyinfo.HistoryVO;
import kr.co.sist.vo.companyinfo.SearchVO;
import kr.co.sist.vo.companyinfo.WelfareVO;

@Controller
public class CompanyinfoAdminController {
     @Autowired(required=false)
     private CompanyinfoAdminService companyinfoAdminService;

    @GetMapping("/manage/companyinfo/adminCompanyinfoList.do")
    public String searchAllCompanyinfo(@ModelAttribute SearchVO sVO, Model model) {
//        List<SearchDomain> list=companyinfoAdminService.searchAllCompanyinfo();
        System.out.println("처음 getPage : "+sVO.getPage());
     // 페이지 번호가 0이거나 음수일 경우 1로 초기화
        if (sVO.getPage() <= 0) {
            sVO.setPage(1);
        }
        
        List<SearchDomain> list = companyinfoAdminService.selectCompanyinfoList(sVO);
        int page = companyinfoAdminService.selectPage(sVO);
        
        model.addAttribute("companyinfoList",list);
        model.addAttribute("sVO",sVO);
        model.addAttribute("totalPage",page);
        
        System.out.println("===========list : "+list);
        System.out.println("===========list size : "+list.size());
        System.out.println("===========page : "+page);
        
        System.out.println("avgSal : "+sVO.getAvgSal());
        System.out.println(" getPage : "+sVO.getPage());
        
        return "manage/companyinfo/companies";
    }
    
    @GetMapping("/manage/companyinfo/adminCompanyinfoDetail.do")
    public String companyinfoDetail(String companyCode, HttpSession session, Model model) {
        List<SearchDomain> list=companyinfoAdminService.searchCompanyinfoDetail(companyCode);
        List<SearchDomain> list2=companyinfoAdminService.searchHistory(companyCode);
        List<SearchDomain> list3=companyinfoAdminService.searchWelfare(companyCode);
        
        session.setAttribute("companyCode", companyCode);
        
        model.addAttribute("companyDetail",list);
        model.addAttribute("history",list2);
        model.addAttribute("welfare",list3);
        return "manage/companyinfo/admin_company_detail";
    }
    @GetMapping("/manage/companyinfo/adminCompanyinfoWrite.do")
    public String insertCompanyinfoPage() {
        return "manage/companyinfo/admin_company_detail_write";
    }
  
    @GetMapping("/manage/companyinfo/adminHistoryWelfare.do")
    public String selectHistoryWelfareDetail(String companyCode, Model model, HttpSession session) {
        List<SearchDomain> list=companyinfoAdminService.searchCompanyinfoDetail(companyCode);
        List<SearchDomain> list2=companyinfoAdminService.searchHistory(companyCode);
        List<SearchDomain> list3=companyinfoAdminService.searchWelfare(companyCode);
        
        session.setAttribute("companyCode", companyCode);
        
        model.addAttribute("companyDetail",list);
        model.addAttribute("history",list2);
        model.addAttribute("welfare",list3);
      
        return "manage/companyinfo/admin_history_welfare";
    }

    @PostMapping("/manage/companyinfo/addCompanyinfoWrite.do")
    public String insertCompanyinfoPage(CompanyinfoVO cVO,HttpServletRequest request) throws IOException {
        String nextCompNum=companyinfoAdminService.searchNextCompNum();
        File uploadLogoPath = new File("C:/dev/recruit-app/src/main/webapp/assets/images/company/logo");


        if (!uploadLogoPath.exists()) {
            uploadLogoPath.mkdirs();
        }

        int maxSize = 100 * 1024 * 1024; // 100MB
        MultipartRequest mrLogo = new MultipartRequest(request, uploadLogoPath.getAbsolutePath(), maxSize, "UTF-8", new DefaultFileRenamePolicy());

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
        return "redirect:/manage/companyinfo/adminCompanyinfoList.do";
    }
    
    @PostMapping("/manage/companyinfo/addCompanyinfoDetail.do")
    public String addCompanyinfo(CompanyinfoVO companyinfoVO) {
        String result = "success";
        if (!companyinfoAdminService.addCompanyinfoDetail(companyinfoVO)) {
            result = "fail";
        }
        return result;
    }
    
    @PostMapping("/manage/companyinfo/updateCompanyinfo.do")
    public String updateCompanyinfo(CompanyinfoVO cVO ,HttpServletRequest request, HttpSession session) throws IOException {
        
        
        String uploadLogoPath = "C:/dev/recruit-app/src/main/webapp/assets/images/company/logo";

        File logoDir = new File(uploadLogoPath);
        if (!logoDir.exists()) {
            throw new IOException("찾을 수 없는 경로입니다.");
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
  
        if(tempFile.length() > maxSize) { //���ε� ����
            tempFile.delete();
        }
        if(subFile.length() > maxSize) { //���ε� ����
            subFile.delete();
        }
        
        companyinfoAdminService.updateCompanyinfo(cVO);
        
        return "redirect:/manage/companyinfo/adminCompanyinfoList.do";
    }//updateCompanyinfo
    
    @PostMapping("/manage/companyinfo/insertHistory.do")
    public String insertHistory(HttpServletRequest request, HttpSession session) {
        String companyCode= (String) session.getAttribute("companyCode");
        String baseDate = request.getParameter("hidHistoryDate");
        String historyContent = request.getParameter("hidInHistoryContent");

        System.out.println("================Received data================");
        System.out.println("Company Code: " + companyCode);
        System.out.println("Base Date: " + baseDate);
        System.out.println("History Content: " + historyContent);
        
        HistoryVO hVO = new HistoryVO();
        hVO.setCompanyCode(companyCode);
        hVO.setBaseDate(baseDate);
        hVO.setHistoryContent(historyContent);

        companyinfoAdminService.addHistory(hVO);

        return "redirect:/manage/companyinfo/adminHistoryWelfare.do?companyCode=" + companyCode;
    }

    @PostMapping("/companyinfo/insertWelfare.do")
    public String insertWelfare(HttpServletRequest request, HttpSession session) {
        String companyCode= (String) session.getAttribute("companyCode");
        String category = request.getParameter("hidWelfareCategory");
        String welfareContent = request.getParameter("hidWelfareContent");

        System.out.println("================Received data================");
        System.out.println("Company Code: " + companyCode);
        System.out.println("category: " + category);
        System.out.println("welfare Content: " + welfareContent);
        
        WelfareVO wVO = new WelfareVO();
        wVO.setCompanyCode(companyCode);
        wVO.setCategory(category);
        wVO.setWelfareContent(welfareContent);

        companyinfoAdminService.addWelfare(wVO);

        return "redirect:/manage/companyinfo/adminHistoryWelfare.do?companyCode=" + companyCode;
    }
    
    @PostMapping("/manage/companyinfo/deleteHistory.do")
    public String deleteHistory(@RequestParam("hidHistory") String baseDate, HttpSession session) {
        Map<String, Object> param=new HashMap<String, Object>();
        String companyCode=(String) session.getAttribute("companyCode");
        param.put("baseDate", baseDate);
        param.put("companyCode", companyCode);
        
        System.out.println("base date: "+baseDate);
        
        companyinfoAdminService.deleteHistory(param);
        
       return "redirect:/manage/companyinfo/adminHistoryWelfare.do?companyCode=" + companyCode;  
       }
    
    @PostMapping("/manage/companyinfo/deleteWelfare.do")
    public String deleteWelfare(@RequestParam("hidWelfare") String category, HttpSession session) {
        Map<String, Object> param=new HashMap<String, Object>();
        String companyCode=(String) session.getAttribute("companyCode");
        param.put("category", category);
        param.put("companyCode", companyCode);
        
        companyinfoAdminService.deleteWelfare(param);
        
        return "redirect:/manage/companyinfo/adminHistoryWelfare.do?companyCode=" + companyCode;
    }
    
//    @GetMapping("/companyinfo/search_test.do")
//    public String SearchCompanyinfoList(Model model, @ModelAttribute SearchVO sVO) {
//        List<SearchDomain> list = companyinfoAdminService.searchCompanyinfoList(sVO);
//        model.addAttribute("listCompanyinfo", list);
//        return "companyinfo/search_test";
//    }
//    

//    
//    @GetMapping("/companyinfo/companyinfoDetail.do")
//    public String searchCompanyinfoDetail(String companyCode, Model model) {
//        List<SearchDomain> list=companyinfoAdminService.searchCompanyinfoDetail(companyCode);
//        model.addAttribute("companyDetail",list);
//        return "companyinfo/companyinfo_list";
////        return "companyinfo/user_company_detail";
//    }

}
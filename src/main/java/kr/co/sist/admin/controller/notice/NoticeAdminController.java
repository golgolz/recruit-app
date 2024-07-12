package kr.co.sist.admin.controller.notice;

import java.io.IOException;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import kr.co.sist.admin.service.notice.NoticeAdminService;
import kr.co.sist.admin.vo.notice.NoticeAdminVO;
import kr.co.sist.admin.vo.notice.SearchVO;

@Controller
public class NoticeAdminController {
    @Autowired(required=false)
    private NoticeAdminService noticeAdminService;
    
    @GetMapping("/manage/notice/notices.do")
    public String searchAllNotice(SearchVO sVO, Model model) {
        List<SearchVO> list=noticeAdminService.searchAllnotice(sVO);
        model.addAttribute("listNotice",list);
        return "manage/notice/notices";
    }
    @GetMapping("/manage/notice/noticeSearch.do")
    public String searchNotice(Model model) {
        return "";
    }
    @GetMapping("/manage/notice/noticesDetail.do")
    public String searchNoticeDetail(int noticeNum, HttpSession session, Model model) {
        List<SearchVO> list=noticeAdminService.searchNoticeDetail(noticeNum);
        
        session.setAttribute("noticeNum", noticeNum);
        
        model.addAttribute("noticeDetail",list);
        
        return "manage/notice/notices_detail";
    }
    @GetMapping("/manage/notice/noticesWrite.do")
    public String insertNoticePage() {
        
        return "manage/notice/notices_write";
    }
    @GetMapping("/manage/notice/noticesUpdatePage.do")
    public String updateNoticePage(int noticeNum, HttpSession session, Model model) {
        List<SearchVO> list=noticeAdminService.searchNoticeDetail(noticeNum);
        
        session.setAttribute("noticeNum", noticeNum);
        
        model.addAttribute("noticeDetail",list);
        
        return "manage/notice/notices_update";
    }
    @PostMapping("/manage/notice/noticesInsert.do")
    public String insertNotice(NoticeAdminVO nVO, HttpServletRequest request) throws IOException {
        int nextNoticeNum=noticeAdminService.searchNextNoticeNum();
        String category= request.getParameter("category");
        String title = request.getParameter("title");
        String content = request.getParameter("content");
        String adminId = request.getParameter("hidAdminId");
        String modifier = request.getParameter("hidModifier");
        String inputDate = request.getParameter("hidInputDate");
        String updateDate = request.getParameter("hidUpdateDate");
        String blindFlag = request.getParameter("hidBlindFlag");

        System.out.println("================Received data================");
        System.out.println("noticeNum: " + nextNoticeNum);
        System.out.println("category: " + category);
        System.out.println("title: " + title);
        System.out.println("content: " + content);
        
        nVO.setNoticeNum(nextNoticeNum);
        nVO.setCategory(category);
        nVO.setTitle(title);
        nVO.setContent(content);
        nVO.setAdminId(adminId);
        nVO.setModifier(modifier);
        nVO.setInputDate(inputDate);
        nVO.setUpdateDate(updateDate);
        nVO.setBlindFlag(blindFlag);

        noticeAdminService.addNotice(nVO);

        return "redirect:/manage/notice/notices.do";
    }
    @PostMapping("/manage/notice/noticesUpdate.do")
    public String updateNotice(NoticeAdminVO nVO, HttpServletRequest request, Model model) throws IOException {
        String noticeParam = request.getParameter("noticeNum");
        if (noticeParam == null || noticeParam.isEmpty()) {
            throw new IllegalArgumentException("Notice ID cannot be null or empty");
        }
        int noticeNum= Integer.parseInt(noticeParam);
        String category= request.getParameter("category");
        String title = request.getParameter("title");
        String content = request.getParameter("content");
        
        System.out.println("================Received data================");
        System.out.println("noticeNum: " + noticeNum);
        System.out.println("category: " + category);
        System.out.println("title: " + title);
        System.out.println("content: " + content);
        
        nVO.setNoticeNum(noticeNum);
        nVO.setCategory(category);
        nVO.setTitle(title);
        nVO.setContent(content);
        
        noticeAdminService.updateNoticeNum(nVO);
        
        return "redirect:/manage/notice/noticesDetail.do?noticeNum="+noticeNum;
    }
    @PostMapping("/manage/notice/noticesDelete.do")
    public String deleteNotice(int noticeNum, Model model) {
        noticeAdminService.deleteNotice(noticeNum);
        return "redirect:/manage/notice/notices.do";
    }
    
}

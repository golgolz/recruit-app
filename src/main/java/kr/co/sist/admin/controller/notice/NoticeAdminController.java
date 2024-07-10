package kr.co.sist.admin.controller.notice;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import kr.co.sist.admin.service.notice.NoticeAdminService;
import kr.co.sist.admin.vo.notice.SearchVO;

@Controller
public class NoticeAdminController {
    @Autowired(required=false)
    private NoticeAdminService noticeAdminService;
    
    @GetMapping("/manage/notice/notices.do")
    public String searchAllNotice(Model model) {
        List<SearchVO> list=noticeAdminService.searchAllnotice();
        model.addAttribute("listNotice",list);
        return "manage/notice/notices";
    }
    @GetMapping("/manage/notice/noticeSearch.do")
    public String searchNotice(Model model) {
        return "";
    }
    @GetMapping("/manage/notice/noticesDetail.do")
    public String searchNoticeDetail(Model model) {
        return "manage/notice/notices_detail";
    }
    @GetMapping("/manage/notice/noticesWrite.do")
    public String insertNoticePage() {
        return "manage/notice/notices_write";
    }
    @GetMapping("/manage/notice/noticesInsert.do")
    public String insertNotice(Model model) {
        return "";
    }
    @GetMapping("/manage/notice/noticesUpdate.do")
    public String updateNotice(Model model) {
        return "manage/notice/notices_update";
    }
    @GetMapping("/manage/notice/noticesDelete.do")
    public String deleteNotice(Model model) {
        return "";
    }
    
}

package kr.co.sist.user.controller.notice;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import kr.co.sist.user.domain.notice.NoticeUserDomain;
import kr.co.sist.user.service.notice.NoticeUserService;
import kr.co.sist.user.vo.notice.NoticeUserVO;

@Controller
public class NoticeUserContoller {
    @Autowired(required = false)
    private NoticeUserService noticeUserService;

    public NoticeUserContoller(NoticeUserService noticeUserService) {
        this.noticeUserService = noticeUserService;
    }

    @GetMapping("/notice/notices.do")
    public String searchNotices(Model model) {
        List<NoticeUserDomain> noticeList = noticeUserService.searchNotices();
        model.addAttribute("noticeList", noticeList);
        return "/notice/notices";
    } // 전체 공지사항 불러오기



    @GetMapping("/notice/noticesByCategory.do")
    @ResponseBody
    public Map<String, Object> searhNoticesByCategory(@RequestParam("category") String category) {
        List<NoticeUserDomain> noticeList = noticeUserService.searchNoticesByCategory(category);
        Map<String, Object> response = new HashMap<>();
        response.put("noticeList", noticeList);
        return response; // 공지사항 카테고리별 검색
    }



    @GetMapping("/notice/noticesbyKeyword.do")
    @ResponseBody
    public ResponseEntity<Map<String, Object>> searchNoticesbyKeyword(
            @RequestParam("keyword") String keyword,
            @RequestParam("searchType") String searchType) {
        System.out
                .println("Received search keyword: " + keyword + " and searchType: " + searchType);
        List<NoticeUserDomain> noticeList;
        if ("선택".equals(searchType)) {
            noticeList = noticeUserService.searchNotices();
        } else {
            noticeList = noticeUserService.searchNoticesbyKeyword(keyword, searchType);
        }
        Map<String, Object> response = new HashMap<>();
        response.put("noticeList", noticeList);
        // System.out.println("~~~~~~~~~~searchResult~~~~" + noticeList);
        return ResponseEntity.ok(response);
    }// 공지사항 키워드 검색



    @GetMapping("/notice/detail.do")
    public String searchOneNotice(NoticeUserVO nVO, Model model) {
        int notice_num = nVO.getNotice_num();
        NoticeUserDomain noticeDetail = noticeUserService.searchOneNotice(notice_num);
        model.addAttribute("noticeDetail", noticeDetail);
        return "notice/detail";
    } // 공지사항 상세조회

}

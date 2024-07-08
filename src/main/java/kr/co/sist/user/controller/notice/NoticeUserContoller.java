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
    } // 공지사항 리스트 불러오기

    @GetMapping("/notice/noticesByCategory.do")
    @ResponseBody
    public Map<String, Object> searhNoticesByCategory(@RequestParam("category") String category) {
        // System.out.println("-----------------" + category);
        List<NoticeUserDomain> noticeList = noticeUserService.searchNoticesByCategory(category);
        // System.out.println("---------????--------" + noticeList);
        Map<String, Object> response = new HashMap<>();
        response.put("noticeList", noticeList);
        return response; // 공지사항 카테고리 검색
    }

    @GetMapping("/notice/noticesbyKeyword.do")
    @ResponseBody
    public ResponseEntity<Map<String, Object>> searchNoticesbyKeyword(
            @RequestParam("keyword") String keyword,
            @RequestParam("searchType") String searchType) {
        System.out
                .println("Received search keyword: " + keyword + " and searchType: " + searchType);
        List<NoticeUserDomain> noticeList;
        // 검색 옵션이 '선택'인 경우 전체 공지사항 리스트를 가져오도록 처리
        if ("선택".equals(searchType)) {
            noticeList = noticeUserService.searchNotices(); // 전체 공지사항 리스트를 가져오는 메서드 호출
        } else {
            // 기타 검색 타입에 따라 필요한 로직 수행
            noticeList = noticeUserService.searchNoticesbyKeyword(keyword, searchType);
        }
        Map<String, Object> response = new HashMap<>();
        response.put("noticeList", noticeList);
        // System.out.println("~~~~~~~~~~searchResult~~~~" + noticeList);
        return ResponseEntity.ok(response);
    }

    @GetMapping("/notice/detail.do")
    public String searchOneNotice(NoticeUserVO nVO, Model model) {
        int notice_num = nVO.getNotice_num();
        NoticeUserDomain noticeDetail = noticeUserService.searchOneNotice(notice_num);
        model.addAttribute("noticeDetail", noticeDetail);
        return "notice/detail";
    } // 공시사항 세부조회

}


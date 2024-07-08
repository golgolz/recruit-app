package kr.co.sist.user.controller.mypage;

import java.util.List;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import kr.co.sist.user.domain.basic.QuestionDomain;
import kr.co.sist.user.domain.mypage.QuestResultDomain;
import kr.co.sist.user.domain.mypage.UserApplyDomain;
import kr.co.sist.user.domain.mypage.UserCareerDomain;
import kr.co.sist.user.domain.mypage.UserInfoDomain;
import kr.co.sist.user.domain.mypage.UserReviewDomain;
import kr.co.sist.user.service.basic.UserBasicService;
import kr.co.sist.user.service.mypage.MypageService;
import kr.co.sist.user.vo.mypage.QuestionVO;
import kr.co.sist.user.vo.mypage.SearchVO;
import kr.co.sist.user.vo.mypage.UpdateUserVO;

@Controller
public class MypageController {

    private MypageService ms;
    private UserBasicService ubs;

    public MypageController(MypageService ms, UserBasicService ubs) {
        this.ms = ms;
        this.ubs = ubs;
    }


    @GetMapping("/user/mypage/mypageUserInfo.do")
    public String mypageInfo(@SessionAttribute("userId") String userId, Model model) {

        UserInfoDomain userInfo = ms.searchUserInfo(userId);

        model.addAttribute("userInfo", userInfo);

        return "user/mypage/mypageUserInfo";
    }

    @GetMapping("/user/mypage/checkPass.do")
    public String checkPass() {
        return "user/mypage/checkPass";
    }

    @GetMapping("/user/mypage/modifyUserPage.do")
    public String modifyInfoPage(@SessionAttribute("userId") String userId, Model model) {

        UserInfoDomain userInfo = ms.searchModifyInfo(userId);
        List<QuestionDomain> qList = ubs.searchPasswordQList();

        model.addAttribute("userInfo", userInfo);
        model.addAttribute("qList", qList);

        return "user/mypage/modifyUserInfo";
    }

    @PostMapping("/user/mypage/modifyUser.do")
    public String modifyUserInfo(@SessionAttribute("userId") String userId, UpdateUserVO uVO,
            RedirectAttributes redirectAttributes) {
        uVO.setUserId(userId);
        int cnt = ms.modifyUserInfo(uVO);

        if (cnt > 0) {
            redirectAttributes.addFlashAttribute("resultMsg", "회원 정보 변경이 완료 되었습니다.");

        } else {
            redirectAttributes.addFlashAttribute("resultMsg",
                    "회원 정보 변경 중 문제가 발생 했습니다. 잠시 후 다시 시도해주세요.");
        }
        return "redirect:/user/mypage/modifyUserProcess.do";
    }

    @GetMapping("/user/mypage/modifyUserProcess.do")
    public String modifyUserProcess() {
        return "user/mypage/modifyUserProcess";
    }

    @GetMapping("/user/mypage/modifyPassProcess.do")
    public String modifyPassProcess() {
        return "user/mypage/modifyPassProcess";
    }


    @PostMapping("/user/mypage/certification.do")
    public String certificationQuest(@SessionAttribute("userId") String userId, QuestionVO qVO,
            RedirectAttributes redirectAttributes) {
        qVO.setUserId(userId);
        System.out.println(qVO.getQNum());
        QuestResultDomain qrd = ms.certificationQuest(qVO);
        if (qrd == null) {
            redirectAttributes.addFlashAttribute("resultMsg", "인증에 실패 하였습니다.");
            return "redirect:/user/mypage/modifyUserPage.do";
        }

        return "redirect:/user/mypage/modifyPassPage.do";
    }


    @GetMapping("/user/mypage/modifyPassPage.do")
    public String modifyPassPage() {
        return "user/mypage/modifyPass";
    }

    @GetMapping("/user/mypage/mypageApplyPage.do")
    public String ApplyPage() {
        return "user/mypage/mypageApply";
    }

    @GetMapping("api/mypage/mypageApply.do")
    @ResponseBody
    public List<UserApplyDomain> mypageApply(@SessionAttribute("userId") String userId,
            @ModelAttribute SearchVO sVO) {
        sVO.setUserId(userId);
        List<UserApplyDomain> applyList = ms.searchUserApply(sVO);

        return applyList;
    }

    @GetMapping("api/mypage/applyCount.do")
    @ResponseBody
    public int applyCnt(@SessionAttribute("userId") String userId, @ModelAttribute SearchVO sVO) {
        sVO.setUserId(userId);
        int cnt = ms.searchApplyCnt(sVO);

        return cnt;
    }

    @GetMapping("/user/mypage/mypageCareer.do")
    public String mypageCareer(@SessionAttribute("userId") String userId, Model model) {
        List<UserCareerDomain> careerList = ms.searchUserCareer(userId);

        model.addAttribute("careerList", careerList);

        return "user/mypage/mypageCareer";
    }

    @GetMapping("/user/mypage/mypageReview.do")
    public String mypageReview(@SessionAttribute("userId") String userId, Model model) {
        List<UserReviewDomain> reviewList = ms.searchUserReview(userId);

        model.addAttribute("reviewList", reviewList);

        return "user/mypage/mypageReview";
    }

}

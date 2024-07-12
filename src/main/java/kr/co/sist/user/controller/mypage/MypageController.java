package kr.co.sist.user.controller.mypage;

import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.UUID;
import javax.servlet.http.HttpServletRequest;
import org.apache.commons.io.FilenameUtils;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import kr.co.sist.user.domain.basic.QuestionDomain;
import kr.co.sist.user.domain.mypage.QuestResultDomain;
import kr.co.sist.user.domain.mypage.UserApplyDomain;
import kr.co.sist.user.domain.mypage.UserCareerDomain;
import kr.co.sist.user.domain.mypage.UserInfoDomain;
import kr.co.sist.user.domain.mypage.UserReviewDomain;
import kr.co.sist.user.service.basic.UserBasicService;
import kr.co.sist.user.service.mypage.MypageService;
import kr.co.sist.user.vo.mypage.CareerVO;
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
            RedirectAttributes redirectAttributes, HttpServletRequest request) throws IOException {


        String uploadProfilePath =
                "C:/dev/sts-git/recruit-app/src/main/webapp/assets/images/mypage/uploadImg";

        File profileDir = new File(uploadProfilePath);

        if (!profileDir.exists()) {
            profileDir.mkdirs();
            // throw new IOException("error");
        }

        int maxSize = 100 * 1024 * 1024;
        MultipartRequest mrProfile = new MultipartRequest(request, uploadProfilePath, maxSize,
                "UTF-8", new DefaultFileRenamePolicy());

        // 새로 업로드 된 이미지
        String uploadImg = mrProfile.getFilesystemName("uploadImg");
        // 기존 이미지
        String profileImg = mrProfile.getParameter("profileImg");

        String phone = mrProfile.getParameter("phone");
        String tel = mrProfile.getParameter("tel");
        String name = mrProfile.getParameter("name");

        if (uploadImg == null && profileImg != null) {
            uploadImg = profileImg;
        }
        String extension = FilenameUtils.getExtension(uploadImg); // 파일 확장자 가져오기
        String newFileName = UUID.randomUUID().toString() + "." + extension; // 새 고유 파일명 생성

        uVO.setUserId(userId);
        uVO.setName(name);
        uVO.setTel(tel);
        uVO.setPhone(phone);

        File tempFile = new File(profileDir.getAbsoluteFile() + "/" + uploadImg);
        File newFile = new File(profileDir.getAbsoluteFile() + "/" + newFileName);

        tempFile.renameTo(newFile); // 파일 이동

        uVO.setProfileImg(newFileName);

        if (tempFile.length() > maxSize) { // 파일 크기 검증
            tempFile.delete();
        }

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

    @GetMapping("/user/mypage/passFlagON.do")
    public String passFlagON(RedirectAttributes redirectAttributes) {
        redirectAttributes.addFlashAttribute("resultMsg", "비밀번호 변경 후 서비스 이용이 가능합니다.");

        return "redirect:/user/mypage/flagOnPage.do";
    }

    @GetMapping("/user/mypage/flagOnPage.do")
    public String flagONPage() {
        return "user/mypage/flagON";
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
    public String mypageCareer() {

        return "user/mypage/mypageCareer";
    }

    @GetMapping("/api/mypage/getCareer.do")
    @ResponseBody
    public List<UserCareerDomain> getCareerList(@SessionAttribute("userId") String userId,
            @ModelAttribute CareerVO cVO) {
        cVO.setUserId(userId);
        List<UserCareerDomain> careerList = ms.searchUserCareer(cVO);

        return careerList;
    }

    @GetMapping("/api/mypage/careerCount.do")
    @ResponseBody
    public int careerCnt(@SessionAttribute("userId") String userId, @ModelAttribute CareerVO cVO) {
        cVO.setUserId(userId);
        int cnt = ms.searchCareerCnt(cVO);

        return cnt;
    }

    @GetMapping("/user/mypage/mypageReview.do")
    public String mypageReview(Model model) {

        return "user/mypage/mypageReview";
    }

    @GetMapping("/api/mypage/getReviews.do")
    @ResponseBody
    public List<UserReviewDomain> getReviewList(@SessionAttribute("userId") String userId,
            @ModelAttribute CareerVO cVO) {
        cVO.setUserId(userId);

        List<UserReviewDomain> reviewList = ms.searchUserReview(cVO);

        return reviewList;
    }

    @GetMapping("/api/mypage/reviewCount.do")
    @ResponseBody
    public int reviewCnt(@SessionAttribute("userId") String userId, @ModelAttribute CareerVO cVO) {
        cVO.setUserId(userId);

        int cnt = ms.searchReviewCnt(cVO);

        return cnt;
    }


}

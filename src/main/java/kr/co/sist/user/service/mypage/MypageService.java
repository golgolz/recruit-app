package kr.co.sist.user.service.mypage;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;
import java.util.Iterator;
import java.util.List;
import java.util.UUID;
import javax.imageio.ImageIO;
import javax.imageio.ImageReader;
import javax.imageio.stream.ImageInputStream;
import org.apache.commons.io.FilenameUtils;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import kr.co.sist.user.dao.basic.UserBasicDAO;
import kr.co.sist.user.dao.mypage.MypageDAO;
import kr.co.sist.user.domain.mypage.QuestResultDomain;
import kr.co.sist.user.domain.mypage.UserApplyDomain;
import kr.co.sist.user.domain.mypage.UserCareerDomain;
import kr.co.sist.user.domain.mypage.UserInfoDomain;
import kr.co.sist.user.domain.mypage.UserReviewDomain;
import kr.co.sist.user.vo.basic.UpdatePassVO;
import kr.co.sist.user.vo.mypage.CareerVO;
import kr.co.sist.user.vo.mypage.QuestionVO;
import kr.co.sist.user.vo.mypage.SearchVO;
import kr.co.sist.user.vo.mypage.UpdateUserVO;

@Service
public class MypageService {
    private UserBasicDAO ubDAO;
    private MypageDAO mDAO;

    @Value("${file.upload-dir}")
    private String uploadDir;

    public MypageService(UserBasicDAO ubDAO, MypageDAO mDAO) {
        this.ubDAO = ubDAO;
        this.mDAO = mDAO;
    }

    public int modifyPassword(UpdatePassVO upVO) {
        int cnt = ubDAO.updatePassword(upVO);

        return cnt;
    }

    public int modifyPassFlag(String userId) {
        int cnt = mDAO.updatePassFlag(userId);

        return cnt;
    }

    public UserInfoDomain searchUserInfo(String userId) {
        UserInfoDomain userInfo = mDAO.selectUserInfo(userId);

        return userInfo;
    }

    public String searchChkPass(String userId) {
        String password = mDAO.selectChkPass(userId);

        return password;
    }

    public UserInfoDomain searchModifyInfo(String userId) {
        UserInfoDomain userInfo = mDAO.selectUserInfo(userId);

        String formatTel = replaceDash(userInfo.getTel());
        String formatPhone = replaceDash(userInfo.getPhone());

        userInfo.setTel(formatTel);
        userInfo.setPhone(formatPhone);

        return userInfo;
    }

    public int modifyUserInfo(UpdateUserVO uVO) {

        String formatTel = formatNumber(uVO.getTel());
        String formatPhone = formatNumber(uVO.getPhone());

        uVO.setTel(formatTel);
        uVO.setPhone(formatPhone);

        int cnt = mDAO.updateUserInfo(uVO);

        return cnt;
    }

    public QuestResultDomain certificationQuest(QuestionVO qVO) {
        QuestResultDomain qrd = mDAO.selectChkQuestion(qVO);

        return qrd;
    }

    public List<UserApplyDomain> searchUserApply(SearchVO sVO) {
        List<UserApplyDomain> applyList = mDAO.selectUserApply(sVO);

        return applyList;
    }

    public int searchApplyCnt(SearchVO sVO) {
        int cnt = mDAO.selectApplyCnt(sVO);

        return cnt;
    }

    public List<UserCareerDomain> searchUserCareer(CareerVO cVO) {
        List<UserCareerDomain> careerList = mDAO.selectUserCareer(cVO);

        return careerList;
    }

    public int searchCareerCnt(CareerVO cVO) {
        int cnt = mDAO.selectCareerCnt(cVO);

        return cnt;
    }

    public List<UserReviewDomain> searchUserReview(CareerVO cVO) {
        List<UserReviewDomain> reviewList = mDAO.selectUserReview(cVO);

        return reviewList;
    }

    public int searchReviewCnt(CareerVO cVO) {
        int cnt = mDAO.selectReviewCnt(cVO);

        return cnt;
    }

    public String replaceDash(String phoneNumber) {
        return phoneNumber.replace("-", "");
    }

    public String formatNumber(String phoneNumber) {
        String formatNum = "";
        if (phoneNumber.length() == 10) {
            formatNum = phoneNumber.replaceFirst("(\\d{2})(\\d{3,4})(\\d{4})", "$1-$2-$3");
        } else {
            formatNum = phoneNumber.replaceFirst("(\\d{3})(\\d{3,4})(\\d{4})", "$1-$2-$3");
        }
        return formatNum;
    }

    public String storeProfileImage(MultipartFile file) throws FileStorageException {
        try {
            // 파일 유효성 검사
            if (file.isEmpty()) {
                throw new FileStorageException("파일이 비어있습니다.");
            }
            if (!isImage(file)) {
                throw new FileStorageException("이미지 파일만 업로드 가능합니다.");
            }
            if (file.getSize() > 5 * 1024 * 1024) { // 5MB 제한
                throw new FileStorageException("파일 크기는 5MB를 초과할 수 없습니다.");
            }

            // 파일 이름 생성 및 저장
            String fileName = generateUniqueFileName(file.getOriginalFilename());
            Path targetLocation = Paths.get(uploadDir).resolve(fileName);
            Files.copy(file.getInputStream(), targetLocation, StandardCopyOption.REPLACE_EXISTING);

            return fileName;
        } catch (IOException ie) {
            throw new FileStorageException("파일 저장 실패: " + file.getOriginalFilename(), ie);
        }
    }

    private String generateUniqueFileName(String originalFilename) {
        // 고유한 파일 이름 생성 (UUID + 확장자)
        String extension = FilenameUtils.getExtension(originalFilename);
        return UUID.randomUUID().toString() + "." + extension;
    }

    private boolean isImage(MultipartFile file) {
        try {
            ImageInputStream iis = ImageIO.createImageInputStream(file.getInputStream());
            Iterator<ImageReader> imageReaders = ImageIO.getImageReaders(iis);
            return imageReaders.hasNext();
        } catch (IOException ex) {
            return false;
        }
    }

}

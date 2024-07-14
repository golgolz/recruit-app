package kr.co.sist.user.service.resume;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import kr.co.sist.user.dao.resume.ResumeUserDAO;
import kr.co.sist.user.domain.resume.ResumeListDomain;
import kr.co.sist.user.vo.resume.ApplyVO;
import kr.co.sist.user.vo.resume.ProfileVO;
import kr.co.sist.user.vo.resume.ResumeVO;

@Service
public class ResumeUserService {
    @Autowired(required = false)
    private final ResumeUserDAO resumeUserDAO;

    public ResumeUserService(ResumeUserDAO resumeUserDAO) {
        this.resumeUserDAO = resumeUserDAO;
    }

    public List<ResumeListDomain> searchResumes(String resumeNum) {
        return resumeUserDAO.selectResumes(resumeNum);
    }

    public ProfileVO searchProfile(String userId) {
        return resumeUserDAO.selectProfileInfo(userId);
    }

    public int apply(ApplyVO apply) {
        return resumeUserDAO.insertApply(apply);
    }

    public int addResume(ResumeVO resumeVO) {
        String userId = resumeVO.getEmail();
        int count = resumeUserDAO.selectResumeCount(resumeVO.getEmail());
        resumeVO.setId(userId.substring(0, userId.lastIndexOf('.')) + "_" + (count + 1));
        return resumeUserDAO.insertResume(resumeVO);
    }

    public int modifyResume(ResumeVO resumeVO) {
        return resumeUserDAO.updateResume(resumeVO);
    }

    public int removeResume(String resumeNum) {
        return resumeUserDAO.deleteResume(resumeNum);
    }
}

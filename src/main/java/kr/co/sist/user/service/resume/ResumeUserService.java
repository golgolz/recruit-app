package kr.co.sist.user.service.resume;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import kr.co.sist.admin.domain.resume.ResumeDomain;
import kr.co.sist.user.dao.resume.ResumeUserDAO;
import kr.co.sist.user.domain.resume.ResumeListDomain;

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

    public ResumeDomain searchOneResume() {
        ResumeDomain resume = null;

        return resume;
    }
}

package kr.co.sist.admin.service.resume;

import java.util.List;
import org.springframework.stereotype.Service;
import kr.co.sist.admin.dao.resume.ResumeAdminDAO;
import kr.co.sist.admin.domain.resume.ResumeDomain;
import kr.co.sist.admin.domain.resume.ResumeListDomain;
import kr.co.sist.admin.vo.resume.SearchVO;

@Service
public class ResumeAdminService {
    private final ResumeAdminDAO resumeAdminDAO;

    public ResumeAdminService(ResumeAdminDAO resumeAdminDAO) {
        this.resumeAdminDAO = resumeAdminDAO;
    }

    public List<ResumeListDomain> searchResumes(SearchVO searchVO) {
        switch (searchVO.getCareer()) {
            case "0":
                searchVO.setCareer("");
                break;
            case "1":
                searchVO.setCareer("����");
                break;
            case "2":
                searchVO.setCareer("���");
                break;
        }

        // switch (searchVO.getEndSchool()) {
        // case "0":
        // searchVO.setEndSchool("");
        // break;
        // case "1":
        // searchVO.setEndSchool("����б�");
        // break;
        // case "2":
        // searchVO.setEndSchool("���б�(2,3��)");
        // break;
        // case "3":
        // searchVO.setEndSchool("");
        // break;
        // case "4":
        // searchVO.setEndSchool("");
        // break;
        // case "5":
        // searchVO.setEndSchool("");
        // break;
        // }
        System.out.println(searchVO.toString());
        List<ResumeListDomain> resumes = resumeAdminDAO.selectResumes(searchVO);
        return resumes;
    }

    public int searchResumeCount(SearchVO searchVO) {
        return resumeAdminDAO.selectResumeCount(searchVO);
    }

    public ResumeDomain searchOneResume(String resumeNum) {
        ResumeDomain resume = resumeAdminDAO.searchOneResume(resumeNum);

        return resume;
    }
}

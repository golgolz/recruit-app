package kr.co.sist.user.service.recruit;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import kr.co.sist.admin.domain.recruit.RecruitDomain;
import kr.co.sist.domain.companyinfo.WelfareDomain;
import kr.co.sist.user.dao.recruit.RecruitUserDAO;
import kr.co.sist.user.domain.recruit.RecruitListDomain;
import kr.co.sist.user.vo.recruit.SearchVO;

@Service
public class RecruitUserService {
    private final RecruitUserDAO recruitUserDAO;

    @Autowired(required = false)
    public RecruitUserService(RecruitUserDAO recruitUserDAO) {
        this.recruitUserDAO = recruitUserDAO;
    }

    public List<RecruitListDomain> searchRecruits(SearchVO searchVO) {
        List<RecruitListDomain> recruits = recruitUserDAO.selectRecruits(searchVO);

        for (RecruitListDomain recruit : recruits) {
            switch (recruit.getEducation()) {
                case "1":
                    recruit.setEducation("고등학교");
                    break;
                case "2":
                    recruit.setEducation("대학교(2,3년제)");
                    break;
                case "3":
                    recruit.setEducation("대학교(4년제)");
                    break;
                case "4":
                    recruit.setEducation("대학원(석사)");
                    break;
                case "5":
                    recruit.setEducation("대학원(박사)");
                    break;
            }
        }

        return recruits;
    }

    public int selectRecruitCount(SearchVO searchVO) {
        return recruitUserDAO.selectRecruitCount(searchVO);
    }

    public RecruitDomain searchOneRecruit(int recruitId) {
        RecruitDomain recruit = null;
        recruit = recruitUserDAO.selectOneRecruit(recruitId);
        return recruit;
    }

    public List<WelfareDomain> selectWelfare(String companyCode) {
        return recruitUserDAO.selectWelfare(companyCode);
    }
}

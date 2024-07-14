package kr.co.sist.admin.dao.resume;

import java.util.ArrayList;
import java.util.List;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import kr.co.sist.admin.domain.resume.ResumeDomain;
import kr.co.sist.admin.domain.resume.ResumeListDomain;
import kr.co.sist.admin.vo.resume.SearchVO;
import kr.co.sist.properties.MyBatisConfig;

@Component
public class ResumeAdminDAO {
    private final MyBatisConfig myBatis;

    @Autowired(required = false)
    public ResumeAdminDAO(MyBatisConfig myBatis) {
        this.myBatis = myBatis;
    }

    public List<ResumeListDomain> selectResumes(SearchVO searchVO) {
        System.out.println(searchVO.toString());
        SqlSession session = myBatis.getMyBatisHandler(false);
        List<ResumeListDomain> resumes = new ArrayList<ResumeListDomain>();
        resumes = session.selectList("kr.co.sist.resume.admin.selectResumes", searchVO);
        myBatis.closeHandler(session);

        return resumes;
    }

    public int selectResumeCount(SearchVO searchVO) {
        SqlSession session = myBatis.getMyBatisHandler(false);
        int count = session.selectOne("kr.co.sist.resume.admin.selectResumeCount", searchVO);
        myBatis.closeHandler(session);

        return count;
    }

    public String selectRecruitTitle(int recruitNum) {
        SqlSession session = myBatis.getMyBatisHandler(false);
        String title = session.selectOne("kr.co.sist.resume.admin.selectRecruitTitle", recruitNum);
        myBatis.closeHandler(session);

        return title;
    }

    public ResumeDomain searchOneResume(String resumeNum) {
        SqlSession session = myBatis.getMyBatisHandler(false);
        StringBuilder subData = new StringBuilder("{");
        String[] subDataQueries = {"selectSkillResume", "selectEduResume", "selectCareerResume",
                "selectCertificationResume", "selectLanguageResume"};
        String result = "";

        ResumeDomain resume =
                session.selectOne("kr.co.sist.resume.admin.selectMetaResume", resumeNum);

        for (String query : subDataQueries) {
            result = session.selectOne("kr.co.sist.resume.admin." + query, resumeNum);
            subData.append(result.substring(1, result.length() - 1)).append(",");
        }

        subData.setCharAt(subData.length() - 1, '}');
        resume.setId(resumeNum);
        resume.setSubData(subData.toString());

        return resume;
    }
}

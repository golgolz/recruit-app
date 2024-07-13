package kr.co.sist.user.dao.resume;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import kr.co.sist.properties.MyBatisConfig;
import kr.co.sist.user.domain.resume.ResumeListDomain;
import kr.co.sist.user.vo.resume.ApplyVO;
import kr.co.sist.user.vo.resume.ResumeVO;
import kr.co.sist.user.vo.resume.SkillVO;

@Component
public class ResumeUserDAO {
    private final MyBatisConfig myBatis;

    @Autowired(required = false)
    public ResumeUserDAO(MyBatisConfig myBatis) {
        this.myBatis = myBatis;
    }

    public List<ResumeListDomain> selectResumes(String resumeNum) {
        SqlSession session = myBatis.getMyBatisHandler(false);
        List<ResumeListDomain> resumes = new ArrayList<ResumeListDomain>();
        resumes = session.selectList("kr.co.sist.resume.user.selectResumes", resumeNum);
        myBatis.closeHandler(session);

        return resumes;
    }

    public int selectResumeCount(String userId) {
        SqlSession session = myBatis.getMyBatisHandler(false);

        int result = session.selectOne("kr.co.sist.resume.user.countResumesPerUser", userId);
        myBatis.closeHandler(session);

        return result;
    }

    public int insertApply(ApplyVO apply) {
        SqlSession session = myBatis.getMyBatisHandler(false);
        int result = session.insert("kr.co.sist.resume.user.apply", apply);

        if (result == 1) {
            session.commit();
        } else {
            session.rollback();
        }

        myBatis.closeHandler(session);

        return result;
    }

    public int insertResume(ResumeVO resumeVO) {
        SqlSession session = myBatis.getMyBatisHandler(false);
        myBatis.closeHandler(session);
        return 0;
    }

    public int updateResume(ResumeVO resumeVO) {
        SqlSession session = myBatis.getMyBatisHandler(false);

        String[] subDatas = {"Skill", "Edu", "Career", "Certification", "Language"};
        int result = 0;

        result = session.update("kr.co.sist.resume.user.updateResume", resumeVO);

        if (result != 1) {
            session.rollback();
        } else {
            session.commit();
        }

        myBatis.closeHandler(session);

        saveResumeData(resumeVO);
        return 0;
    }

    public void saveResumeData(ResumeVO resumeVO) {
        System.out.println("saveResumeData");
        ObjectMapper mapper = new ObjectMapper();
        try {
            Map<String, Object> subData = mapper.readValue(resumeVO.getSubData(),
                    new TypeReference<Map<String, Object>>() {});

            List<SkillVO> skills = mapper.convertValue(subData.get("skills"),
                    new TypeReference<List<SkillVO>>() {});

            String resumeNum = resumeVO.getId();

            for (SkillVO skill : skills) {
                skill.setResumeNum(resumeNum);
            }

            deleteSkill(resumeNum);
            insertSkill(skills);

        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public int insertSkill(List<SkillVO> skills) {
        SqlSession session = myBatis.getMyBatisHandler(false);
        int result = session.insert("kr.co.sist.resume.user.insertSkill", skills);

        if (result == skills.size()) {
            session.commit();
        } else {
            session.rollback();
        }

        myBatis.closeHandler(session);

        return result;
    }

    public int deleteSkill(String resumeNum) {
        SqlSession session = myBatis.getMyBatisHandler(true);

        int result = 0;
        result = session.delete("kr.co.sist.resume.user.deleteSkill", resumeNum);

        myBatis.closeHandler(session);
        return 0;
    }

    public int deleteEdu(String resumeNum) {
        SqlSession session = myBatis.getMyBatisHandler(false);

        int result = 0;

        result = session.delete("kr.co.sist.resume.user.deleteEdu", resumeNum);

        if (result != 1) {
            session.rollback();
        } else {
            session.commit();
        }

        myBatis.closeHandler(session);
        return 0;
    }

    public int deleteCareer(String resumeNum) {
        SqlSession session = myBatis.getMyBatisHandler(false);

        int result = 0;

        result = session.delete("kr.co.sist.resume.user.deleteCareer", resumeNum);

        if (result != 1) {
            session.rollback();
        } else {
            session.commit();
        }

        myBatis.closeHandler(session);
        return 0;
    }

    public int deleteCertification(String resumeNum) {
        SqlSession session = myBatis.getMyBatisHandler(false);

        int result = 0;

        result = session.delete("kr.co.sist.resume.user.deleteCertification", resumeNum);

        if (result != 1) {
            session.rollback();
        } else {
            session.commit();
        }

        myBatis.closeHandler(session);
        return 0;
    }

    public int deleteLanguage(String resumeNum) {
        SqlSession session = myBatis.getMyBatisHandler(false);

        int result = 0;

        result = session.delete("kr.co.sist.resume.user.deleteLanguage", resumeNum);

        if (result != 1) {
            session.rollback();
        } else {
            session.commit();
        }

        myBatis.closeHandler(session);
        return 0;
    }
}

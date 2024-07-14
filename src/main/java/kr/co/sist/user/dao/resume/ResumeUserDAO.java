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
import kr.co.sist.user.vo.resume.CareerVO;
import kr.co.sist.user.vo.resume.CertificationVO;
import kr.co.sist.user.vo.resume.EducationVO;
import kr.co.sist.user.vo.resume.LanguageVO;
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

            List<EducationVO> educations = mapper.convertValue(subData.get("education"),
                    new TypeReference<List<EducationVO>>() {});
            // System.out.println("edu size is " + educations.size()); --- > why 1?
            if (educations != null && !educations.isEmpty()) {
                for (EducationVO education : educations) {
                    education.setResumeNum(resumeNum);
                }

                deleteEdu(resumeNum);
                insertEdu(educations);
            }

            List<CareerVO> careers = mapper.convertValue(subData.get("career"),
                    new TypeReference<List<CareerVO>>() {});
            if (careers != null && !careers.isEmpty()) {
                for (CareerVO career : careers) {
                    career.setResumeNum(resumeNum);
                }

                deleteCareer(resumeNum);
                insertCareer(careers);
            }

            List<CertificationVO> certifications = mapper.convertValue(
                    subData.get("certifications"), new TypeReference<List<CertificationVO>>() {});
            if (certifications != null && !certifications.isEmpty()) {
                for (CertificationVO certification : certifications) {
                    certification.setResumeNum(resumeNum);
                }

                deleteCertification(resumeNum);
                insertCertification(certifications);
            }

            List<LanguageVO> languages = mapper.convertValue(subData.get("languages"),
                    new TypeReference<List<LanguageVO>>() {});
            if (languages != null && !languages.isEmpty()) {
                for (LanguageVO language : languages) {
                    language.setResumeNum(resumeNum);
                }

                deleteLanguage(resumeNum);
                insertLanguage(languages);
            }
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

    public int insertEdu(List<EducationVO> edus) {
        SqlSession session = myBatis.getMyBatisHandler(false);
        int result = session.insert("kr.co.sist.resume.user.insertEducation", edus);

        if (result == edus.size()) {
            session.commit();
        } else {
            session.rollback();
        }

        myBatis.closeHandler(session);

        return result;
    }

    public int insertCareer(List<CareerVO> careers) {
        SqlSession session = myBatis.getMyBatisHandler(false);
        int result = session.insert("kr.co.sist.resume.user.insertCareer", careers);

        if (result == careers.size()) {
            session.commit();
        } else {
            session.rollback();
        }

        myBatis.closeHandler(session);

        return result;
    }

    public int insertCertification(List<CertificationVO> certifications) {
        SqlSession session = myBatis.getMyBatisHandler(false);
        int result = session.insert("kr.co.sist.resume.user.insertCertification", certifications);

        if (result == certifications.size()) {
            session.commit();
        } else {
            session.rollback();
        }

        myBatis.closeHandler(session);

        return result;
    }

    public int insertLanguage(List<LanguageVO> languages) {
        SqlSession session = myBatis.getMyBatisHandler(false);
        int result = session.insert("kr.co.sist.resume.user.insertLanguage", languages);

        if (result == languages.size()) {
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
        SqlSession session = myBatis.getMyBatisHandler(true);

        int result = 0;

        result = session.delete("kr.co.sist.resume.user.deleteEdu", resumeNum);

        myBatis.closeHandler(session);
        return 0;
    }

    public int deleteCareer(String resumeNum) {
        SqlSession session = myBatis.getMyBatisHandler(true);

        int result = 0;

        result = session.delete("kr.co.sist.resume.user.deleteCareer", resumeNum);

        myBatis.closeHandler(session);
        return 0;
    }

    public int deleteCertification(String resumeNum) {
        SqlSession session = myBatis.getMyBatisHandler(true);

        int result = 0;

        result = session.delete("kr.co.sist.resume.user.deleteCertifacation", resumeNum);

        myBatis.closeHandler(session);
        return 0;
    }

    public int deleteLanguage(String resumeNum) {
        SqlSession session = myBatis.getMyBatisHandler(true);

        int result = 0;

        result = session.delete("kr.co.sist.resume.user.deleteLanguage", resumeNum);

        myBatis.closeHandler(session);
        return 0;
    }
}

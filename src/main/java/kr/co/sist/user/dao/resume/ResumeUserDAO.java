package kr.co.sist.user.dao.resume;

import java.util.ArrayList;
import java.util.List;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import kr.co.sist.properties.MyBatisConfig;
import kr.co.sist.user.domain.resume.ResumeListDomain;
import kr.co.sist.user.vo.resume.ApplyVO;
import kr.co.sist.user.vo.resume.ResumeVO;

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
        return 0;
    }
}

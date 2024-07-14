package kr.co.sist.admin.dao.recruit;

import java.util.ArrayList;
import java.util.List;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import kr.co.sist.admin.domain.recruit.RecruitDomain;
import kr.co.sist.admin.domain.resume.CompanyDomain;
import kr.co.sist.admin.domain.resume.SummaryDomain;
import kr.co.sist.admin.vo.recruit.SearchVO;
import kr.co.sist.admin.vo.resume.RecruitAdminVO;
import kr.co.sist.admin.vo.resume.SummaryVO;
import kr.co.sist.exceptions.UnexpectedRowCountException;
import kr.co.sist.properties.MyBatisConfig;

@Component
public class RecruitAdminDAO {
    private final MyBatisConfig myBatis;

    @Autowired(required = false)
    public RecruitAdminDAO(MyBatisConfig myBatis) {
        this.myBatis = myBatis;
    }

    public List<RecruitDomain> selectRecruits(SearchVO searchVO) {
        SqlSession session = myBatis.getMyBatisHandler(false);
        List<RecruitDomain> recruits = new ArrayList<RecruitDomain>();
        recruits = session.selectList("kr.co.sist.recruit.admin.selectRecruits", searchVO);
        myBatis.closeHandler(session);

        return recruits;
    }

    public RecruitDomain selectOneRecruit(int recruitNum) {
        SqlSession session = myBatis.getMyBatisHandler(false);
        RecruitDomain recruit =
                session.selectOne("kr.co.sist.recruit.admin.selectOneRecruit", recruitNum);
        myBatis.closeHandler(session);
        return recruit;
    }

    public SummaryDomain selectRecruitSummary(SummaryVO summary) {
        SqlSession session = myBatis.getMyBatisHandler(false);
        SummaryDomain result =
                session.selectOne("kr.co.sist.recruit.admin.selectRecruitSummary", summary);
        myBatis.closeHandler(session);
        return result;
    }

    public int selectRecruitsCount(SearchVO searchVO) {
        SqlSession session = myBatis.getMyBatisHandler(false);
        int result = session.selectOne("kr.co.sist.recruit.admin.countRecruits", searchVO);
        myBatis.closeHandler(session);
        return result;
    }

    public List<CompanyDomain> selectCompanies(String keyword) {
        SqlSession session = myBatis.getMyBatisHandler(false);
        List<CompanyDomain> companies =
                session.selectList("kr.co.sist.recruit.admin.selectCompanyNames", keyword);
        myBatis.closeHandler(session);
        return companies;
    }

    public boolean insertRecruit(RecruitAdminVO recruitVO) {
        boolean result = true;
        SqlSession session = myBatis.getMyBatisHandler(false);
        try {
            int affectedRows = session.insert("kr.co.sist.recruit.admin.insertRecruit", recruitVO);

            if (affectedRows != 1) {
                throw new UnexpectedRowCountException(1, affectedRows);
            }

            session.commit();
        } catch (UnexpectedRowCountException e) {
            session.rollback();
            result = false;
        } finally {
            myBatis.closeHandler(session);
        }
        return result;
    }

    public boolean updateRecruit(RecruitAdminVO recruitVO) {
        boolean result = true;
        SqlSession session = myBatis.getMyBatisHandler(false);
        try {
            int affectedRows = session.insert("kr.co.sist.recruit.admin.updateRecruit", recruitVO);

            if (affectedRows != 1) {
                throw new UnexpectedRowCountException(1, affectedRows);
            }

            session.commit();
        } catch (UnexpectedRowCountException e) {
            session.rollback();
            result = false;
        } finally {
            myBatis.closeHandler(session);
        }
        return result;
    }

    public boolean deleteRecruit(int recruitNum) {
        boolean result = true;
        SqlSession session = myBatis.getMyBatisHandler(false);
        try {
            int affectedRows =
                    session.update("kr.co.sist.recruit.admin.deleteOneRecruit", recruitNum);

            if (affectedRows != 1) {
                throw new UnexpectedRowCountException(1, affectedRows);
            }

            session.commit();
        } catch (UnexpectedRowCountException e) {
            session.rollback();
            result = false;
        } finally {
            myBatis.closeHandler(session);
        }

        return result;
    }
}

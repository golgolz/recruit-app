package kr.co.sist.user.dao.recruit;

import java.util.ArrayList;
import java.util.List;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import kr.co.sist.admin.domain.recruit.RecruitDomain;
import kr.co.sist.domain.companyinfo.WelfareDomain;
import kr.co.sist.properties.MyBatisConfig;
import kr.co.sist.user.domain.recruit.RecruitListDomain;
import kr.co.sist.user.vo.recruit.SearchVO;

@Component
public class RecruitUserDAO {
    private final MyBatisConfig myBatis;

    @Autowired(required = false)
    public RecruitUserDAO(MyBatisConfig myBatis) {
        this.myBatis = myBatis;
    }

    public List<RecruitListDomain> selectRecruits(SearchVO searchVO) {
        SqlSession session = myBatis.getMyBatisHandler(false);
        List<RecruitListDomain> recruits = new ArrayList<RecruitListDomain>();
        recruits = session.selectList("kr.co.sist.recruit.user.selectRecruits", searchVO);
        myBatis.closeHandler(session);

        return recruits;
    }

    public int selectRecruitCount(SearchVO searchVO) {
        SqlSession session = myBatis.getMyBatisHandler(false);
        int count = session.selectOne("kr.co.sist.recruit.user.countRecruits", searchVO);
        myBatis.closeHandler(session);

        return count;
    }

    public RecruitDomain selectOneRecruit(int recruitNum) {
        SqlSession session = myBatis.getMyBatisHandler(false);
        RecruitDomain recruit =
                session.selectOne("kr.co.sist.recruit.user.selectOneRecruit", recruitNum);
        myBatis.closeHandler(session);
        return recruit;
    }

    public List<WelfareDomain> selectWelfare(String companyCode) {
        SqlSession session = myBatis.getMyBatisHandler(false);
        List<WelfareDomain> welfares =
                session.selectList("kr.co.sist.recruit.user.selectWelfares", companyCode);
        myBatis.closeHandler(session);
        return welfares;
    }
}

package kr.co.sist.admin.dao.basic;

import java.util.List;
import org.apache.ibatis.exceptions.PersistenceException;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Component;
import kr.co.sist.admin.domain.basic.AdminInfoDomain;
import kr.co.sist.admin.domain.basic.AdminLoginDomain;
import kr.co.sist.admin.vo.basic.InsertAdminVO;
import kr.co.sist.admin.vo.basic.SearchVO;
import kr.co.sist.admin.vo.basic.UpdateAdminInfoVO;
import kr.co.sist.properties.MyBatisConfig;

@Component
public class AdminBasicDAO {
    private final MyBatisConfig myBatis;

    public AdminBasicDAO(MyBatisConfig myBatis) {
        this.myBatis = myBatis;
    }

    public AdminLoginDomain selectLogin(String adminId) throws PersistenceException {
        SqlSession ss = myBatis.getMyBatisHandler(false);

        AdminLoginDomain ld =
                ss.selectOne("kr.co.sist.mapper.admin.basic.adminMapper.selectLogin", adminId);
        myBatis.closeHandler(ss);

        return ld;
    }// selectLogin

    public List<AdminInfoDomain> selectAdminList(SearchVO sVO) {

        SqlSession ss = myBatis.getMyBatisHandler(false);

        List<AdminInfoDomain> list =
                ss.selectList("kr.co.sist.mapper.admin.basic.adminMapper.selectAdminList", sVO);

        System.out.println(sVO.getStartNum() + " : " + sVO.getEndNum());
        for (AdminInfoDomain aid : list) {
            System.out.println(aid.getAdminId());
        }
        myBatis.closeHandler(ss);

        return list;
    }// selectAdminList

    public int selectAdminCnt(SearchVO sVO) {
        SqlSession ss = myBatis.getMyBatisHandler(false);

        int cnt = ss.selectOne("kr.co.sist.mapper.admin.basic.adminMapper.selectAdminCnt", sVO);

        myBatis.closeHandler(ss);

        return cnt;
    }// selectAdminCnt

    public int insertAdmin(InsertAdminVO iVO) {
        SqlSession ss = myBatis.getMyBatisHandler(false);

        int cnt = ss.insert("kr.co.sist.mapper.admin.basic.adminMapper.insertAdmin", iVO);

        if (cnt > 0) {
            ss.commit();
        } else {
            ss.rollback();
        }

        return cnt;
    }// insertAdmin

    public AdminInfoDomain selectAdminInfo(String adminId) {
        SqlSession ss = myBatis.getMyBatisHandler(false);

        AdminInfoDomain adminInfo =
                ss.selectOne("kr.co.sist.mapper.admin.basic.adminMapper.selectAdminInfo", adminId);

        myBatis.closeHandler(ss);

        return adminInfo;
    }// selectAdminInfo

    public int updateAdminInfo(UpdateAdminInfoVO adminInfo) {
        SqlSession ss = myBatis.getMyBatisHandler(false);

        int cnt = ss.update("kr.co.sist.mapper.admin.basic.adminMapper.updateAdminInfo", adminInfo);

        if (cnt > 0) {
            ss.commit();
        } else {
            ss.rollback();
        }

        myBatis.closeHandler(ss);

        return cnt;
    }// updateAdminInfo

}

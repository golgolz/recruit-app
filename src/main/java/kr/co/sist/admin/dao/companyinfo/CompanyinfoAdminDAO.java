package kr.co.sist.admin.dao.companyinfo;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import org.apache.ibatis.exceptions.PersistenceException;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import kr.co.sist.domain.companyinfo.SearchDomain;
import kr.co.sist.exceptions.UnexpectedRowCountException;
import kr.co.sist.properties.MyBatisConfig;
import kr.co.sist.vo.companyinfo.CompanyinfoVO;
import kr.co.sist.vo.companyinfo.SearchVO;

@Component
public class CompanyinfoAdminDAO {

    @Autowired(required=false)
    private MyBatisConfig mbConfig;

    public List<SearchDomain> selectAllCompanyinfo()throws PersistenceException{
        System.out.println("이건 다오야");
        SqlSession ss=mbConfig.getMyBatisHandler(false);
        List<SearchDomain> list= new ArrayList<SearchDomain>();
        list=ss.selectList("kr.co.sist.admin.companyinfo.selectAllCompanyinfo");
        mbConfig.closeHandler(ss);
        System.out.println("값 잘 받아옴?");
        return list;
    }
    
    public List<SearchDomain> selectCompanyinfoList(SearchVO sVO)throws PersistenceException{
        List<SearchDomain> list=null;
        SqlSession ss=mbConfig.getMyBatisHandler(false);
        list=ss.selectList("kr.co.sist.admin.companyinfo.selectAllCompanyinfo", sVO);
        mbConfig.closeHandler(ss);
        
        return list;
    }
    
    public List<SearchDomain> selectCompanyinfo(Map<String, Object> params)throws PersistenceException{
        List<SearchDomain> list=null;
        SqlSession ss=mbConfig.getMyBatisHandler(false);
        list=ss.selectList("kr.co.sist.admin.companyinfo.selectCompanyinfo", params);
        mbConfig.closeHandler(ss);
        System.out.println("이것은 params야 : "+params);
        System.out.println("이것은 list야 : "+list);
        return list;
    }

    public List<SearchDomain> selectCompanyinfoDetail(String companyCode)throws PersistenceException{
        List<SearchDomain> list=null;
        SqlSession ss=mbConfig.getMyBatisHandler(false);
        list=ss.selectList("kr.co.sist.admin.companyinfo.selectCompanyinfoDetail", companyCode);
        mbConfig.closeHandler(ss);
        
        return list;
    }
    public List<SearchDomain> selectHistory(String companyCode)throws PersistenceException{
        List<SearchDomain> list=null;
        SqlSession ss=mbConfig.getMyBatisHandler(false);
        list=ss.selectList("kr.co.sist.admin.companyinfo.selectHistory", companyCode);
        mbConfig.closeHandler(ss);
        
        return list;
    }
    public List<SearchDomain> selectWelfare(String companyCode)throws PersistenceException{
        List<SearchDomain> list=null;
        SqlSession ss=mbConfig.getMyBatisHandler(false);
        list=ss.selectList("kr.co.sist.admin.companyinfo.selectWelfare", companyCode);
        mbConfig.closeHandler(ss);
        
        return list;
    }
    
    public boolean insertCompanyinfoDetail(CompanyinfoVO companyinfoVO) {
        boolean result = true;
        SqlSession ss = mbConfig.getMyBatisHandler(true);
        try {
            int company = ss.insert("kr.co.sist.admin.companyinfo.insertCompanyinfoDetail", companyinfoVO);

            if (company != 1) {
                throw new UnexpectedRowCountException(1, company);
            }

            ss.commit();
        } catch (UnexpectedRowCountException e) {
            ss.rollback();
            result = false;
        } finally {
            mbConfig.closeHandler(ss);
        }
        return result;
    }

    public String selectLastCompNum() throws PersistenceException {
        
        String lastCompNum="";
        SqlSession ss=mbConfig.getMyBatisHandler(false);
        lastCompNum=ss.selectOne("kr.co.sist.admin.companyinfo.lastCompNum");
        mbConfig.closeHandler(ss);
     
        return lastCompNum;
    }

    public int updateCompanyinfo(CompanyinfoVO cVO)throws PersistenceException {
        int result=0;
        SqlSession ss=mbConfig.getMyBatisHandler(true);
        result=ss.update("kr.co.sist.admin.companyinfo.updateCompanyinfoDetail", cVO);
        mbConfig.closeHandler(ss);
        
        return result;
    }
    
    public int deleteHistory(Map<String, Object> param)throws PersistenceException {
        int result=0;
        SqlSession ss=mbConfig.getMyBatisHandler(false);
        result=ss.update("kr.co.sist.admin.companyinfo.deleteHistory", param);
        mbConfig.closeHandler(ss);
        
        return result;
    }
    
    public int deleteWelfare(Map<String, Object> param)throws PersistenceException {
        int result=0;
        SqlSession ss=mbConfig.getMyBatisHandler(false);
        result=ss.update("kr.co.sist.admin.companyinfo.deleteWelfare", param);
        mbConfig.closeHandler(ss);
        
        return result;
    }
    
}

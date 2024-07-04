package kr.co.sist.user.dao.companyinfo;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import org.apache.ibatis.exceptions.PersistenceException;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import kr.co.sist.domain.companyinfo.SearchDomain;
import kr.co.sist.properties.MyBatisConfig;
import kr.co.sist.vo.companyinfo.SearchVO;

@Component
public class CompanyinfoUserDAO {

    @Autowired(required=false)
    private MyBatisConfig mbConfig;

    public List<SearchDomain> selectAllCompanyinfo()throws PersistenceException{
        System.out.println("�̰� �ٿ���");
        SqlSession ss=mbConfig.getMyBatisHandler(false);
        List<SearchDomain> list= new ArrayList<SearchDomain>();
        list=ss.selectList("kr.co.sist.user.companyinfo.selectAllCompanyinfo");
        mbConfig.closeHandler(ss);
        System.out.println("�� �� �޾ƿ�?");
        return list;
    }
    
    public List<SearchDomain> selectCompanyinfoList(SearchVO sVO)throws PersistenceException{
        List<SearchDomain> list=null;
        SqlSession ss=mbConfig.getMyBatisHandler(false);
        list=ss.selectList("kr.co.sist.user.companyinfo.selectAllCompanyinfo", sVO);
        mbConfig.closeHandler(ss);
        
        return list;
    }
    
    public List<SearchDomain> selectCompanyinfo(Map<String, Object> params)throws PersistenceException{
        List<SearchDomain> list=null;
        SqlSession ss=mbConfig.getMyBatisHandler(false);
        list=ss.selectList("kr.co.sist.user.companyinfo.selectCompanyinfo", params);
        mbConfig.closeHandler(ss);
        System.out.println("�̰��� params�� : "+params);
        System.out.println("�̰��� list�� : "+list);
        return list;
    }

    public List<SearchDomain> selectCompanyinfoDetail(String companyCode)throws PersistenceException{
        List<SearchDomain> list=null;
        SqlSession ss=mbConfig.getMyBatisHandler(false);
        list=ss.selectList("kr.co.sist.user.companyinfo.selectCompanyinfoDetail", companyCode);
        mbConfig.closeHandler(ss);
        
        return list;
    }
    public List<SearchDomain> selectHistory(String companyCode)throws PersistenceException{
        List<SearchDomain> list=null;
        SqlSession ss=mbConfig.getMyBatisHandler(false);
        list=ss.selectList("kr.co.sist.user.companyinfo.selectHistory", companyCode);
        mbConfig.closeHandler(ss);
        
        return list;
    }
    public List<SearchDomain> selectWelfare(String companyCode)throws PersistenceException{
        List<SearchDomain> list=null;
        SqlSession ss=mbConfig.getMyBatisHandler(false);
        list=ss.selectList("kr.co.sist.user.companyinfo.selectWelfare", companyCode);
        mbConfig.closeHandler(ss);
        
        return list;
    }
    
}

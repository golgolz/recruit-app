package kr.co.sist.user.service.companyinfo;

import java.util.List;
import java.util.Map;
import org.apache.ibatis.exceptions.PersistenceException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import kr.co.sist.domain.companyinfo.SearchDomain;
import kr.co.sist.user.dao.companyinfo.CompanyinfoUserDAO;
import kr.co.sist.vo.companyinfo.SearchVO;

@Service
public class CompanyinfoUserService {

    @Autowired(required = false)
    private CompanyinfoUserDAO companyinfoUserDAO;

    public List<SearchDomain> searchAllCompanyinfo() {
        // System.out.println("�̰� ���񽺾�");

        List<SearchDomain> list = null;
        list = companyinfoUserDAO.selectAllCompanyinfo();

        return list;
        // return companyinfoUserDAO.selectAllCompanyinfo();
    }

    public List<SearchDomain> searchCompanyinfoList(SearchVO sVO) {

        return companyinfoUserDAO.selectCompanyinfoList(sVO);
    }

    public List<SearchDomain> searchCompanyinfo(Map<String, Object> params) {
        // System.out.println("�̰� service�� params�� : "+params);
        // if("companyClassification"==null) {
        //
        // }
        return companyinfoUserDAO.selectCompanyinfo(params);
    }


    public List<SearchDomain> searchCompanyinfoDetail(String companyCode) {
        List<SearchDomain> list = null;
        try {
            list = companyinfoUserDAO.selectCompanyinfoDetail(companyCode);

        } catch (PersistenceException pe) {
            pe.printStackTrace();
        }
        return list;
    }

    public List<SearchDomain> searchHistory(String companyCode) {
        List<SearchDomain> list = null;
        try {
            list = companyinfoUserDAO.selectHistory(companyCode);

        } catch (PersistenceException pe) {
            pe.printStackTrace();
        }
        return list;
    }

    public List<SearchDomain> searchWelfare(String companyCode) {
        List<SearchDomain> list = null;
        try {
            list = companyinfoUserDAO.selectWelfare(companyCode);

        } catch (PersistenceException pe) {
            pe.printStackTrace();
        }
        return list;
    }


}

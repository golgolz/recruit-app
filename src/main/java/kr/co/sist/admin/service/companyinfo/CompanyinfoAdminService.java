package kr.co.sist.admin.service.companyinfo;

import java.util.List;
import java.util.Map;
import org.apache.ibatis.exceptions.PersistenceException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import kr.co.sist.admin.dao.companyinfo.CompanyinfoAdminDAO;
import kr.co.sist.domain.companyinfo.SearchDomain;
import kr.co.sist.vo.companyinfo.SearchVO;

@Service
public class CompanyinfoAdminService {

    @Autowired(required = false)
    private CompanyinfoAdminDAO companyinfoAdminDAO;

    public List<SearchDomain> searchAllCompanyinfo() {
        // System.out.println("�̰� ���񽺾�");

        List<SearchDomain> list = null;
        list = companyinfoAdminDAO.selectAllCompanyinfo();

        return list;
        // return companyinfoUserDAO.selectAllCompanyinfo();
    }

    public List<SearchDomain> searchCompanyinfoList(SearchVO sVO) {

        return companyinfoAdminDAO.selectCompanyinfoList(sVO);
    }

    public List<SearchDomain> searchCompanyinfo(Map<String, Object> params) {
        // System.out.println("�̰� service�� params�� : "+params);
        // if("companyClassification"==null) {
        //
        // }
        return companyinfoAdminDAO.selectCompanyinfo(params);
    }


    public List<SearchDomain> searchCompanyinfoDetail(String companyCode) {
        List<SearchDomain> list = null;
        try {
            list = companyinfoAdminDAO.selectCompanyinfoDetail(companyCode);

        } catch (PersistenceException pe) {
            pe.printStackTrace();
        }
        return list;
    }

    public List<SearchDomain> searchHistory(String companyCode) {
        List<SearchDomain> list = null;
        try {
            list = companyinfoAdminDAO.selectHistory(companyCode);

        } catch (PersistenceException pe) {
            pe.printStackTrace();
        }
        return list;
    }

    public List<SearchDomain> searchWelfare(String companyCode) {
        List<SearchDomain> list = null;
        try {
            list = companyinfoAdminDAO.selectWelfare(companyCode);

        } catch (PersistenceException pe) {
            pe.printStackTrace();
        }
        return list;
    }

}

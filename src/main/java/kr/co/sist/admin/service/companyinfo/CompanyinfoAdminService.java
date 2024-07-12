package kr.co.sist.admin.service.companyinfo;

import java.util.List;
import java.util.Map;
import org.apache.ibatis.exceptions.PersistenceException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import kr.co.sist.admin.dao.companyinfo.CompanyinfoAdminDAO;
import kr.co.sist.domain.companyinfo.SearchDomain;
import kr.co.sist.vo.companyinfo.CompanyinfoVO;
import kr.co.sist.vo.companyinfo.HistoryVO;
import kr.co.sist.vo.companyinfo.SearchVO;
import kr.co.sist.vo.companyinfo.WelfareVO;

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
    
    public boolean addCompanyinfoDetail(CompanyinfoVO companyinfoVO) {
        return companyinfoAdminDAO.insertCompanyinfoDetail(companyinfoVO);
    }

    public String searchNextCompNum() {

      //�̺�Ʈ ������ ��ȣ + 1 �޼���
        String nextCompNum = "";
        try {
            String lastCompNum = companyinfoAdminDAO.selectLastCompNum();
            //���� ���� ����
            String prefix = "comp_";
            String numberStr = lastCompNum.substring(prefix.length());
            int number = Integer.parseInt(numberStr);
            number++;
            //������ ���� ���Ŀ� ���� ���ڿ� ��ȯ
            nextCompNum = String.format("%s%04d", prefix,number);
        }catch(PersistenceException pe) {
            pe.printStackTrace();
        }

        return nextCompNum;
        
    }

    public boolean updateCompanyinfo(CompanyinfoVO cVO) {
        boolean result=false;
        int i=0;
        i=companyinfoAdminDAO.updateCompanyinfo(cVO);
        if(i == 0) {
            result=false;
        }else {
            result=true;
        }
        
        return result;
    }
    
    public boolean addHistory(HistoryVO hVO) {
        boolean result=false;
        int i=0;
        i=companyinfoAdminDAO.insertHistory(hVO);
        if(i==0) {
            result=false;
        }else {
            result=true;
        }
        return result;
    }
    
    public boolean deleteHistory(Map<String, Object> param) {
        boolean result=false;
        int i=0;
        i=companyinfoAdminDAO.deleteHistory(param);
        if(i == 0) {
            result=false;
        }else {
            result=true;
        }
        
        return result;
    }
    
    public boolean addWelfare(WelfareVO wVO) {
        boolean result=false;
        int i=0;
        i=companyinfoAdminDAO.insertWelfare(wVO);
        if(i==0) {
            result=false;
        }else {
            result=true;
        }
        return result;
    }
    
    public boolean deleteWelfare(Map<String, Object> param) {
        boolean result=false;
        int i=0;
        i=companyinfoAdminDAO.deleteWelfare(param);
        if(i == 0) {
            result=false;
        }else {
            result=true;
        }
        
        return result;
    }

    
    
}

package kr.co.sist.admin.service.dashboard;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import kr.co.sist.admin.dao.dashboard.DashboardDAO;
import kr.co.sist.admin.vo.dashboard.RegisteredCompanyCountVO;
import kr.co.sist.admin.vo.dashboard.SignupCountVO;
import kr.co.sist.properties.MyBatisConfig;

@Service
public class DashboardService {
    @Autowired
    private MyBatisConfig myBatis; // MyBatisHandler Ÿ������ ����
    
    @Autowired
    public DashboardService(MyBatisConfig myBatis) {
        this.myBatis = myBatis;
    }
    
    @Autowired(required = false)
    private DashboardDAO dashboardDAO;

    //ȸ�������� ��
    public List<SignupCountVO> getSignupCountsForLastWeek() {
        return dashboardDAO.getSignupCountsForLastWeek();
    }
    
    //��� ��� ��
    public List<RegisteredCompanyCountVO> getRegisteredCompanyCountsForLastWeek() {
        return dashboardDAO.getRegisteredCompanyCountsForLastWeek();
    }
}
package kr.co.sist.user.service.main;

import java.util.ArrayList;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import kr.co.sist.user.dao.main.UserMainDAO;
import kr.co.sist.user.vo.main.MainVO;

 
@Service
public class MainService {
    
    @Autowired(required = false)
    private UserMainDAO userMainDAO;


    public List<MainVO> getRecentJobPosts() {
        return userMainDAO.selectRecentJobPosts();
    }

    public List<MainVO> getInterestedPositions(String userId) {
        return userMainDAO.selectInterestedPositions(userId);
    }

    public List<MainVO> getDefaultInterestedPositions() {
        return userMainDAO.selectDefaultInterestedPositions();
    }

    public List<MainVO> getHighSalaryPositions() {
        return userMainDAO.selectHighSalaryPositions();
    }

    public List<MainVO> getViewHistory(String userId) {
        return userMainDAO.selectViewHistory(userId);
    }
    
    //ÄíÅ°
//    public List<MainVO> getViewHistoryFromCookie(String cookieValue) {
//        if (cookieValue == null || cookieValue.isEmpty()) {
//            return new ArrayList<>();
//        }
//
//        List<MainVO> viewHistory = new ArrayList<>();
//        String[] recruitNums = cookieValue.split(",");
//        for (String recruitNum : recruitNums) {
//            MainVO post = userMainDAO.selectRecruitByNum(recruitNum);
//            if (post != null) {
//                viewHistory.add(post);
//            }
//        }
//        return viewHistory;
//    }
    
    public List<MainVO> getViewHistoryFromCookie(String cookieValue) {
        if (cookieValue == null || cookieValue.isEmpty()) {
            return new ArrayList<>();
        }

        String[] recruitNums = cookieValue.split(",");
        return userMainDAO.selectViewHistoryFromCookie(recruitNums);
    }

    public MainVO getRecruitDetail(String recruitNum) {
        return userMainDAO.selectRecruitByNum(recruitNum);
    }
    
    
}
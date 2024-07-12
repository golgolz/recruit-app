package kr.co.sist.user.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.util.WebUtils;
import kr.co.sist.user.service.basic.UserBasicService;

public class UserInterceptor implements HandlerInterceptor {

    private final UserBasicService ubs;

    @Autowired
    public UserInterceptor(UserBasicService ubs) {
        this.ubs = ubs;
    }

    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response,
            Object handler) throws Exception {

        String userId = (String) WebUtils.getSessionAttribute(request, "userId");
        if (userId == null) {
            response.sendRedirect("http://localhost/recruit-app/user/chkLogin.do");
            return false;
        } // end if

        String passFlag = ubs.searchPassFlag(userId);

        if (passFlag.equals("Y")) {
            response.sendRedirect("http://localhost/recruit-app/user/mypage/passFlagON.do");
            return false;
        }

        return true;
    }

    @Override
    public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
            ModelAndView modelAndView) throws Exception {}

    @Override
    public void afterCompletion(HttpServletRequest request, HttpServletResponse response,
            Object handler, Exception ex) throws Exception {}

}

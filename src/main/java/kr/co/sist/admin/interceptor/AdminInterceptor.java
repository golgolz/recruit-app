package kr.co.sist.admin.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.util.WebUtils;

public class AdminInterceptor implements HandlerInterceptor {

    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response,
            Object handler) throws Exception {
        /*
         * HttpSession session = request.getSession(false); if (session.getAttribute("userId") ==
         * null) { response.sendRedirect(
         * "http://localhost/recruit-app/manage/adminLogin/adminLoginPage.do"); return false; }
         */

        Object adminId = WebUtils.getSessionAttribute(request, "adminId");
        if (adminId == null) {
            response.sendRedirect(
                    "http://localhost/recruit-app/manage/adminLogin/adminLoginPage.do");
            return false;
        } // end if

        return true;
    }

    @Override
    public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
            ModelAndView modelAndView) throws Exception {}

    @Override
    public void afterCompletion(HttpServletRequest request, HttpServletResponse response,
            Object handler, Exception ex) throws Exception {}



}

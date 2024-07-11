package kr.co.sist.admin.interceptor;

import java.util.Map;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.util.WebUtils;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import kr.co.sist.admin.domain.basic.AdminInfoDomain;
import kr.co.sist.admin.service.basic.AdminBasicService;

public class ReviewAuthInterceptor implements HandlerInterceptor {
    private final AdminBasicService abs;

    @Autowired
    public ReviewAuthInterceptor(AdminBasicService abs) {
        this.abs = abs;
    }

    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response,
            Object handler) throws Exception {
        boolean flag = false;

        String adminId = (String) WebUtils.getSessionAttribute(request, "adminId");
        AdminInfoDomain adminInfo = abs.searchAdminInfo(adminId);

        String authorityJson = adminInfo.getAuthority();

        if (authorityJson != null) {

            ObjectMapper objectMapper = new ObjectMapper();
            try {
                Map<String, String> authorityMap = objectMapper.readValue(authorityJson,
                        new TypeReference<Map<String, String>>() {});

                String reviewAuth = authorityMap.get("review");
                // 권한에 따른 추가 로직 수행
                System.out.println(reviewAuth);
                flag = reviewAuth.equals("Y");
                if (!flag) {
                    response.sendRedirect("http://localhost/recruit-app/manage/chkAuth.do");
                }

            } catch (JsonProcessingException e) {
                e.printStackTrace();
            } // end catch
        } // end if

        return flag;
    }

    @Override
    public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
            ModelAndView modelAndView) throws Exception {}

    @Override
    public void afterCompletion(HttpServletRequest request, HttpServletResponse response,
            Object handler, Exception ex) throws Exception {}
}
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    info=""%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
    $(function() {
        <c:if test="${ empty resultMsg }">
        	setTimeout(function(){
        		location.href="../mypage/mypageUserInfo.do";
        	},100);
        </c:if>
        <c:if test="${not empty resultMsg}">
            alert("${resultMsg}");
            
            setTimeout(function() {
            <c:choose>
                <c:when test="${resultMsg == '회원 정보 변경이 완료 되었습니다.'}">
                	location.href = "../mypage/mypageUserInfo.do"; // 성공 시 Mypage로 이동
                </c:when>
                <c:otherwise>
                    location.href = "../mypage/modifyUserPage.do"; // 실패 시 다시 회원정보수정 화면으로 이동
                </c:otherwise>
            </c:choose>
            }, 1500);
        </c:if>
    });
</script>
</html>
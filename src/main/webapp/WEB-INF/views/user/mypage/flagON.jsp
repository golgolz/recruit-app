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
	            alert("${resultMsg}");
        		location.href= "http://localhost/recruit-app/user/mypage/modifyPassPage.do";
        	},100);
        </c:if>
        <c:if test="${not empty resultMsg}">
            alert("${resultMsg}");
            
            setTimeout(function() {
                	location.href = "http://localhost/recruit-app/user/mypage/modifyPassPage.do"; 
            }, 100);
        </c:if>
    });
</script>
</html>
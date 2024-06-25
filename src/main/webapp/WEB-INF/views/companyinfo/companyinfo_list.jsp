<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    info="부서별 사원정보 조회"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="icon" href="http://192.168.10.216/spring_mvc/common/favicon.ico"/>
<!--bootstrap 시작-->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
<!--bootstrap 끝-->
<link rel="stylesheet" href="http://192.168.10.216/spring_mvc/common/css/main.css" type="text/css" media="all" />
<link rel="stylesheet" href="http://192.168.10.216/spring_mvc/common/css/board.css" type="text/css" media="all" />
<!--jQuery CDN 시작-->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<!--jQuery CDN 끝-->
<style type="text/css">
	
</style>
<script type="text/javascript">
	$(function(){
		
	});//ready
</script>
</head>
<body>
<div>
입력하신 부서번호 [<strong><c:out value="${ param.companyCode }"/></strong>번]의 사원정보 검색결과<br>
<c:catch var="e">
<table class="table table-hover">
<tr>
<th style="width: 80px">기업코드</th>
<th style="width: 200px">기업명</th>
<th style="width: 120px">기업로고</th>
<th style="width: 120px">매출액</th>
<th style="width: 200px">사원수</th>
<th style="width: 200px">등록일</th>
<th style="width: 200px">등록일</th>
<th style="width: 200px">등록일</th>
<th style="width: 200px">등록일</th>
<th style="width: 200px">등록일</th>
<th style="width: 200px">등록일</th>
<th style="width: 200px">등록일</th>
<th style="width: 200px">등록일</th>
</tr>
<c:if test="${ empty requestScope.companyDetail }">
<tr>
<td colspan="5" style="text-align:center">
사원이 존재하지 않는 부서
</td>
</tr>
</c:if>
<tr>
<%-- <td><c:out value="${ company.companyCode }"/></td> requestScope.listCompanyinfo
<td><c:out value="${ company.companyName }"/></td>
<td><c:out value="${ company.logo }"/></td>
<td><c:out value="${ company.revenue }"/></td>
<td><c:out value="${ company.headcount }"/></td>
<td><c:out value="${ company.inputDate }"/></td> --%>
<td><c:out value="${ companyDetail[0].companyCode }"/></td>
<td><c:out value="${ companyDetail[0].companyName }"/></td>
<td><c:out value="${ companyDetail[0].logo }"/></td>
<td><c:out value="${ companyDetail[0].companyImg }"/></td>
<td><c:out value="${ companyDetail[0].description }"/></td>
<td><c:out value="${ companyDetail[0].headcount }"/></td>
<td><c:out value="${ companyDetail[0].revenue }"/></td>
<td><c:out value="${ companyDetail[0].ceoName }"/></td>
<td><c:out value="${ companyDetail[0].addr }"/></td>
<td><c:out value="${ companyDetail[0].establishmentDate }"/></td>
<td><c:out value="${ companyDetail[0].welfareContent }"/></td>
<td><c:out value="${ companyDetail[0].baseDate }"/></td>
<td><c:out value="${ companyDetail[0].historyContent }"/></td>
</tr>
<%-- </c:forEach> --%>
</table>
</c:catch>
<c:if test="${not empty e }">
사원수는 숫자로만 구성됩니다.
</c:if>
</div>
</body>
</html>
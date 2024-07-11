<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    info="부서별 사원정보 조회"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %> <%-- fn 태그 라이브러리 추가 --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="icon" href="http://stu6.sist.co.kr/spring_mvc/common/favicon.ico"/>
<!--bootstrap 시작-->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
<!--bootstrap 끝-->
<link rel="stylesheet" href="http://stu6.sist.co.kr/spring_mvc/common/css/main.css" type="text/css" media="all" />
<link rel="stylesheet" href="http://stu6.sist.co.kr/spring_mvc/common/css/board.css" type="text/css" media="all" />
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
<c:if test="${not empty requestScope.companyDetail}">
    <c:set var="companyIntroDetail" value="${requestScope.companyDetail[0]}" /> <%-- 변수 설정 --%>
</c:if>
<table class="table table-hover">
<tr>
<th style="width: 80px">companyCode</th>
<th style="width: 200px">companyName</th>
<th style="width: 120px">logo</th>
<th style="width: 120px">companyImg</th>
<th style="width: 200px">description</th>
<th style="width: 200px">headcount</th>
<th style="width: 200px">revenue</th>
<th style="width: 200px">ceoName</th>
<th style="width: 200px">addr</th>
<th style="width: 200px">establishmentDate</th>
<th style="width: 200px">inputDate</th>
<th style="width: 200px">category</th>
<th style="width: 200px">welfareContent</th>
<th style="width: 200px">baseDate</th>
<th style="width: 200px">historyContent</th>
</tr>
<c:if test="${ empty requestScope.companyDetail }">
<tr>
<td colspan="5" style="text-align:center">
사원이 존재하지 않는 부서
</td>
</tr>
</c:if>
  <c:if test="${not empty requestScope.companyDetail}">
        <tr> <%-- 첫 번째 행은 companyDetail의 첫 번째 요소만 출력 --%>
            <td><c:out value="${companyIntroDetail.companyCode}"/></td>
            <td><c:out value="${companyIntroDetail.companyName}"/></td>
            <td><c:out value="${companyIntroDetail.logo}"/></td>
            <td><c:out value="${companyIntroDetail.companyImg}"/></td>
            <td><c:out value="${companyIntroDetail.description}"/></td>
            <td><c:out value="${companyIntroDetail.headcount}"/></td>
            <td><c:out value="${companyIntroDetail.revenue}"/></td>
            <td><c:out value="${companyIntroDetail.ceoName}"/></td>
            <td><c:out value="${companyIntroDetail.addr}"/></td>
            <td><c:out value="${companyIntroDetail.establishmentDate}"/></td>
            <td><c:out value="${companyIntroDetail.inputDate}"/></td>
            <%-- 나머지 셀은 빈 칸으로 남겨두기 --%>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
        </tr>
    </c:if>

    <c:forEach var="company" items="${requestScope.companyDetail}"> 
        <tr> <%-- 두 번째 행부터는 category 아래 데이터만큼 반복 --%>
            <td></td> <%-- 첫 열부터 10열까지는 빈 칸으로 남겨두기 --%>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td><c:out value="${company.category}"/></td>
            <td><c:out value="${company.welfareContent}"/></td>
            <td><c:out value="${company.baseDate}"/></td>
            <td><c:out value="${company.historyContent}"/></td>
        </tr>
    </c:forEach>
<%-- <c:forEach var="company" items="${requestScope.companyDetail}" varStatus="status">
    <c:if test="${status.index < fn:length(requestScope.companyDetail)}"> 리스트 크기만큼만 반복
    <tr>
        <td><c:out value="${company.companyCode}"/></td>
        <td><c:out value="${company.companyName}"/></td>
        <td><c:out value="${company.logo}"/></td>
        <td><c:out value="${company.companyImg}"/></td>
        <td><c:out value="${company.description}"/></td>
        <td><c:out value="${company.headcount}"/></td>
        <td><c:out value="${company.revenue}"/></td>
        <td><c:out value="${company.ceoName}"/></td>
        <td><c:out value="${company.addr}"/></td>
        <td><c:out value="${company.establishmentDate}"/></td>
        <td><c:out value="${company.inputDate}"/></td>
        <td><c:out value="${company.category}"/></td>
        <td><c:out value="${company.welfareContent}"/></td>
        <td><c:out value="${company.baseDate}"/></td>
        <td><c:out value="${company.historyContent}"/></td>
    </tr>
    </c:if>
</c:forEach> --%>
<tr>
<%-- <td><c:out value="${ company.companyCode }"/></td> requestScope.listCompanyinfo
<td><c:out value="${ company.companyName }"/></td>
<td><c:out value="${ company.logo }"/></td>
<td><c:out value="${ company.revenue }"/></td>
<td><c:out value="${ company.headcount }"/></td>
<td><c:out value="${ company.inputDate }"/></td> --%>
<%-- <td><c:out value="${ companyDetail[0].companyCode }"/></td>
<td><c:out value="${ companyDetail[0].companyName }"/></td>
<td><c:out value="${ companyDetail[0].logo }"/></td>
<td><c:out value="${ companyDetail[0].companyImg }"/></td>
<td><c:out value="${ companyDetail[0].description }"/></td>
<td><c:out value="${ companyDetail[0].headcount }"/></td>
<td><c:out value="${ companyDetail[0].revenue }"/></td>
<td><c:out value="${ companyDetail[0].ceoName }"/></td>
<td><c:out value="${ companyDetail[0].addr }"/></td>
<td><c:out value="${ companyDetail[0].establishmentDate }"/></td>
<td><c:out value="${ companyDetail[0].inputDate }"/></td>
<td><c:out value="${ companyDetail[0].category }"/></td>
<td><c:out value="${ companyDetail[0].welfareContent }"/></td>
<td><c:out value="${ companyDetail[0].baseDate }"/></td>
<td><c:out value="${ companyDetail[0].historyContent }"/></td>
</tr>
<tr>
<td><c:out value="${ companyDetail[1].companyCode }"/></td>
<td><c:out value="${ companyDetail[1].companyName }"/></td>
<td><c:out value="${ companyDetail[1].logo }"/></td>
<td><c:out value="${ companyDetail[1].companyImg }"/></td>
<td><c:out value="${ companyDetail[1].description }"/></td>
<td><c:out value="${ companyDetail[1].headcount }"/></td>
<td><c:out value="${ companyDetail[1].revenue }"/></td>
<td><c:out value="${ companyDetail[1].ceoName }"/></td>
<td><c:out value="${ companyDetail[1].addr }"/></td>
<td><c:out value="${ companyDetail[1].establishmentDate }"/></td>
<td><c:out value="${ companyDetail[1].inputDate }"/></td>
<td><c:out value="${ companyDetail[1].category }"/></td>
<td><c:out value="${ companyDetail[1].welfareContent }"/></td>
<td><c:out value="${ companyDetail[1].baseDate }"/></td>
<td><c:out value="${ companyDetail[1].historyContent }"/></td>
</tr>
<tr>
<td><c:out value="${ companyDetail[2].companyCode }"/></td>
<td><c:out value="${ companyDetail[2].companyName }"/></td>
<td><c:out value="${ companyDetail[2].logo }"/></td>
<td><c:out value="${ companyDetail[2].companyImg }"/></td>
<td><c:out value="${ companyDetail[2].description }"/></td>
<td><c:out value="${ companyDetail[2].headcount }"/></td>
<td><c:out value="${ companyDetail[2].revenue }"/></td>
<td><c:out value="${ companyDetail[2].ceoName }"/></td>
<td><c:out value="${ companyDetail[2].addr }"/></td>
<td><c:out value="${ companyDetail[2].establishmentDate }"/></td>
<td><c:out value="${ companyDetail[2].inputDate }"/></td>
<td><c:out value="${ companyDetail[2].category }"/></td>
<td><c:out value="${ companyDetail[2].welfareContent }"/></td>
<td><c:out value="${ companyDetail[2].baseDate }"/></td>
<td><c:out value="${ companyDetail[2].historyContent }"/></td>
</tr> --%>
<%-- </c:forEach> --%>
</table>
</c:catch>
<c:if test="${not empty e }">
사원수는 숫자로만 구성됩니다.
</c:if>
</div>
</body>
</html>
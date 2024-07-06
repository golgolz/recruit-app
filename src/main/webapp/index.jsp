<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    info=""%>
 <%
    response.sendRedirect("main/main.do");
%>  
<!DOCTYPE html>
<html>
<head>
	<jsp:include page="./assets/layout/user/lib.jsp" />  
	<!-- golgolz start -->
	<!-- golgolz end -->
	<style text="text/css">
		<!-- golgolz start -->
		<!-- golgolz end -->
	</style>
	<script text="text/javascript">
		$(function(){
			<!-- golgolz start -->
			//location.href="http://localhost/recruit-app/main/main.jsp";
			<!-- golgolz end -->
		});
	</script>
</head>
<body>
    <div id="__next" data-reactroot="">
		<jsp:include page="./assets/layout/user/header.jsp" />
		<main class="JobsFeed_Jobsfeed__DpeV9">  
			<section class="Section_Section__P1hhc">
			<!-- golgolz start -->
			<a href="http://localhost/recruit-app/companyinfo/companyinfoList.do">기업리스트</a>
			<a href="http://localhost/recruit-app/companyinfo/search_test.do">테스트</a>
			<a href="http://localhost/recruit-app/companyinfo/companyinfoDetail.do?companyCode=comp_0002">기업상세보기</a>
			<a href="http://localhost/recruit-app/companyinfo/adminCompanyinfoList.do">관리자 기업리스트</a>
			<a href="http://localhost/recruit-app/main/main.do">| 메인 페이지 |</a><br>
			<a href="http://localhost/recruit-app/review/reviewResult.do"> 리뷰 페이지 |</a>
			<a href="http://localhost/recruit-app/review/reviewWrite.do"> 리뷰 작성 |</a> <br>
			<a href="http://localhost/recruit-app/manage/dashboard/dashboard.do"> 대시보드 |</a>
			<a href="http://localhost/recruit-app/manage/review/review.do"> 관리자리뷰 |</a>
			
			<!-- golgolz end -->
			</section>
			<jsp:include page="./assets/layout/user/footer.jsp" />  
		</main>
	</div>
</body>
</html>
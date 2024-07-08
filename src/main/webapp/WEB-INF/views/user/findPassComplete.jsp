<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    info=""%>
<!DOCTYPE html>
<html>
<%
	String tempPassword = (String)request.getAttribute("tempPassword");
	if(tempPassword == null || tempPassword.isEmpty()){
	    response.sendRedirect("../user/loginPage.do");
	} 
%>
<head>
	<jsp:include page="../assets/layout/user/lib.jsp" />  
	<!-- golgolz start -->
	<!-- golgolz start -->
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<link rel="shortcut icon" href="https://static.wanted.co.kr/favicon/new/favicon.ico">
	<link rel="stylesheet" href="http://localhost/recruit-app/assets/css/user_login.css"/>
	<link rel="stylesheet" href="http://localhost/recruit-app/assets/css/find_user_info.css"/>
	<!-- golgolz end -->
	<style>
		<!-- golgolz start -->
		<!-- golgolz end -->
	</style>
	<script type="text/javascript">
		$(function(){
			<!-- golgolz start -->
			<!-- golgolz end -->
		});
	</script>
</head>
<body>
    <div id="__next" data-reactroot="">
		<jsp:include page="../assets/layout/user/header.jsp" />
		<main class="JobsFeed_Jobsfeed__DpeV9">  
			<section class="Section_Section__P1hhc">
			<!-- golgolz start -->
			<div class="css-wohrsg">
				<div class="css-v1s0lc">
					<div class="css-1ktsezg">
						<div class="css-1nm9gyu">
							<div class="css-oan6e"><button type="button" class="css-1krggrv"><span
										class="css-1ihsymv"><svg viewBox="0 0 24 24" class="css-t07f4u">
											<path fill="#171719"
												d="M16.1363 3.36297C16.4877 3.71444 16.4877 4.28429 16.1363 4.63576L8.77265 11.9994L16.1362 19.363C16.4877 19.7144 16.4877 20.2843 16.1362 20.6358C15.7848 20.9872 15.2149 20.9872 14.8635 20.6358L6.86346 12.6358C6.51199 12.2843 6.51199 11.7144 6.86346 11.363L14.8635 3.36297C15.2149 3.0115 15.7848 3.0115 16.1363 3.36297Z">
											</path>
										</svg></span></button></div>
							<div class="css-1iooy02">
								<p data-testid="Typography" color="#000000" class="css-14qpgc6">비밀번호 찾기</p>
							</div>
							<div class="css-1jxi7lq"></div>
						</div>
						<div class="css-ng7qrx">
							<h3 data-testid="Typography" color="#000000" class="css-1qgiy3i" style="text-align: center; margin-bottom: 20px;">임시 비밀번호를 발급했어요.</h3>
							<p data-testid="Typography" color="rgba(55, 56, 60, 0.61)" class="css-d08m0c">${ resultMsg }</p>
							<div style="padding: 13px 0px; width: 100%; height: 50px; background-color: rgb(244, 244, 245); text-align: center;">
								<p class="css-14qpgc6" style="font-size: 16px; font-weight: normal;">${ tempPassword }</p>										
							</div>
							<div data-testid="Typography" color="#000000" class="css-ng7qrx" style="text-align: center;">
								<a href="../user/loginPage.do"><strong>로그인 하러가기</strong></a>
							</div>
						</div>
					</div>
				</div>
			</div>
			<!-- golgolz end -->
			</section>
			<jsp:include page="../assets/layout/user/footer.jsp" />  
		</main>
	</div>
</body>
</html>
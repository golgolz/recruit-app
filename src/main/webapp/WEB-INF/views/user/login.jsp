<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" info=""%>
<!DOCTYPE html>
<html>
<head>
<jsp:include page="../assets/layout/user/lib.jsp" />
<!-- golgolz start -->
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<!-- 파비콘 -->
<link rel="shortcut icon" href="https://static.wanted.co.kr/favicon/new/favicon.ico">
<link rel="stylesheet" href="http://localhost/recruit-app/assets/css/user_login.css"/>
<link rel="stylesheet" href="http://localhost/recruit-app/assets/css/find_user_info.css"/>
<!-- golgolz end -->
<style>
<!-- golgolz start -->
<!-- golgolz end-->
</style>
<%
	String resultMsg = (String)request.getAttribute("resultMsg");
%>
<script type="text/javascript">
		$(function(){
			<!-- golgolz start -->
			var emailInput = $('#email');
		    var passwordInput = $('input[name="password"]');
		    var loginButton = $("#loginBtn");
			
			$('#loginBtn').click(function(){
				chkInput = checkInputs();
				if(chkInput === true){
					login();
				}
				
			});
			
			// 회원가입 페이지 이동
			$('#signupBtn').click(function(){
				location.href='http://localhost/recruit-app/user/signupPage.do';
			});

		    // 로그인 조건 충족 여부 확인 / 로그인 버튼 활성화, 비활성화
		    function checkInputs() {
		        var emailNotEmpty = emailInput.val().trim() !== '';
		        var passwordNotEmpty = passwordInput.val().trim() !== '';
		        var isValidateEmail = validateEmail();
		        var isValidatePass = validatePass();

		        if (emailNotEmpty && passwordNotEmpty && isValidateEmail && isValidatePass) {
		            loginButton.prop('disabled', false); // 버튼 활성화
		            return true;
		        } else {
		            loginButton.prop('disabled', true);  // 버튼 비활성화
		            return false;
		        }
		    }
		    
		 	// 페이지 로드 시 초기 확인
		    checkInputs();

		    // 입력 값 변경 시 이벤트 리스너
		    emailInput.on('input', checkInputs);
		    passwordInput.on('input', checkInputs);
		    
		    
		 	// 이메일 유효성 검증
		    function validateEmail() {
		    	  var email = emailInput.val().trim();
		    	  // 이메일 유효성 정규식
		    	  var emailRegex = /^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,30}$/;
		    	  return emailRegex.test(email);
		    	}//function
		    
		     // 비밀번호 유효성 검증
		     function validatePass(){
		    	 var pass = passwordInput.val().trim();
		    	 // 비밀번호 유효성 정규식
		    	 var passRegex = /^(?=.*[a-zA-Z])(?=.*\d)(?=.*[!@#$%^&*()-=])[a-zA-Z\d!@#$%^&*()-=]{8,16}$/;
		    	 return passRegex.test(pass);
		    	}
		    
		     function login(){
		    	 	$("#loginFrm").submit();
			    }
		    
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
							<div class="css-7qdx4z">
								<div class="css-1ktsezg">
									<div class="css-1nm9gyu">
										<div class="css-oan6e">
											<button type="button" class="css-1krggrv"></button>
										</div>
										<div class="css-1iooy02">
											<p data-testid="Typography" color="#000000"
												class="css-14qpgc6">로그인</p>
										</div>
										<div class="css-1jxi7lq"></div>
									</div>
									<div class="css-ng7qrx">
										<form class="css-e130a2" action="../user/login.do" id="loginFrm" method="post">
											<div>
												<div class="css-14o8ny9">
													<div class="css-cssveg">
														<div class="css-env1z2">
															<label data-testid="Typography"
																color="rgba(55, 56, 60, 0.61)" for="email"
																class="css-afh7p0">이메일</label>
														</div>
														<input type="email" placeholder="이메일을 입력해주세요." id="email"
															name="userId" data-testid="Input_email" autofocus=""
															autocomplete="on" class="css-1sbrczv" value="" maxlength="30">
													</div>
												</div>
												<div class="css-1dxhdfz">
													<div class="css-env1z2">
														<label data-testid="Typography"
															color="rgba(55, 56, 60, 0.61)" for="password"
															class="css-afh7p0">비밀번호</label>
													</div>
													<input type="password" placeholder="비밀번호를 입력해주세요."
														name="password" data-testid="Input_password"
														autocomplete="on" class="css-1sbrczv" value="">
													<button type="button" class="css-15fzn57"></button>
												</div>
												<% if(resultMsg != null){ %>
												<div class="resultMsg">
												<p style="font-size: 15px; color: red;"><%= resultMsg %></p>
												</div>
												<%} %>
												<button type="button" data-testid="Button"
													data-attribute-id="signup__email__login" class="css-1yzn4b" id="loginBtn">
													<span data-testid="Typography" color="#000000"
														class="css-kfktv3">로그인</span>
												</button>
											</div>
											<div class="css-z0tt1n">
												<p data-testid="Typography" color="#000000"
													class="css-1q5pm8j">또는</p>
												<div class="button-group" style="margin-bottom: 80px;">
													<button type="button" class="css-1akojk6" onclick="location.href='http://localhost/recruit-app/user/signupPage.do'">
														<span data-testid="Typography" color="#000000"
															class="css-kfktv3">
															<a href="http://localhost/recruit-app/user/signupPage.do">회원가입</a></span>
													</button>
													<button type="button" data-testid="Button"
														class="css-zzrlz5">
														<span data-testid="Typography" color="#000000"
															class="css-1nosfqs">
															<a href="http://localhost/recruit-app/user/findMail.do">계정 찾기</a></span>
													</button>
													<button type="button" data-testid="Button"
														class="css-zzrlz5">
														<span data-testid="Typography" color="#000000"
															class="css-1nosfqs">
															<a href="http://localhost/recruit-app/user/findPass.do">비밀번호 찾기</a></span>
													</button>
												</div>
											</div>
										</form>
									</div>
								</div>
							</div>
						<footer class="css-1rhbhpi"></footer>
				<!-- golgolz end -->
			</section>
		</main>
			<jsp:include page="../assets/layout/user/footer.jsp" />
	</div>
</body>
</html>
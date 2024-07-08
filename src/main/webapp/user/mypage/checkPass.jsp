<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    info=""%>
<!DOCTYPE html>
<html>
<head>
	<jsp:include page="../../assets/layout/user/lib.jsp" />  
	<!-- golgolz start -->
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<!-- golgolz start -->
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<link rel="shortcut icon" href="https://static.wanted.co.kr/favicon/new/favicon.ico">
	<link rel="stylesheet" href="https://doberman-ready-termite.ngrok-free.app/recruit-app/assets/css/user_login.css"/>
	<link rel="stylesheet" href="https://doberman-ready-termite.ngrok-free.app/recruit-app/assets/css/find_user_info.css"/>
	<!-- golgolz end -->
	<style type="text/css">
		<!-- golgolz start -->
		<!-- golgolz end -->
	</style>
	<script type="text/javascript">
			<!-- golgolz start -->
			/* document.addEventListener('DOMContentLoaded', function() {
				  const elements = document.querySelectorAll('.css-1w1wifl'); // 클래스가 css-1w1wifl인 모든 요소 선택

				  elements.forEach(element => {
				    element.addEventListener('click', function(event) {
				      // 필요한 경우 event.preventDefault(); 추가
				      window.location.href = "modifyUserInfo.jsp";
				    });
				  });
				}); */
				
			$(function(){
				
				$("#nextBtn").click(function(){
					isNull = chkNull();
					isValidatePass = validatePass();
					
					if(!isNull){
						alert('비밀번호를 입력해주세요.');
						return;
					}else if(!isValidatePass){
						alert('잘못된 비밀번호 형식입니다.');
						inputPass.val('');
						$("#nextBtn").prop("disabled",true);
						return;
					}
					
					if(isNull && isValidatePass){
						location.href='modifyUserInfo.jsp';
					}
				});//click
				
				var inputPass = $("#inputPass");
				
				function chkNull(){
					
					var isNotEmptyPass = inputPass.val().trim() !== '';
					
					if(isNotEmptyPass){
						$("#nextBtn").prop("disabled",false);
					}else{
						$("#nextBtn").prop("disabled",true);
					}
					
					return isNotEmptyPass;
				}//function
				
				
			    function validatePass(){
			    	 var pass = inputPass.val().trim();
			    	 var passRegex = /^(?=.*[a-zA-Z])(?=.*\d)(?=.*[!@#$%^&*()])[a-zA-Z\d!@#$%^&*()]{8,16}$/;
			    	 return passRegex.test(pass);
			    }//function
			    
			    // 데이터 베이스 조회 후 입력한 비밀번호와 비교하는 로직 추가 예정
			    function chkUserPass(){
			    	
			    }//function
				
				// 초기 로딩
			    chkNull();
				
			    inputPass.on("input",chkNull);
				
			});//ready
			<!-- golgolz end -->
	</script>
</head>
<body>
    <div id="__next" data-reactroot="">
		<jsp:include page="../../assets/layout/user/header.jsp" />
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
								<p data-testid="Typography" color="#000000" class="css-14qpgc6">비밀번호 확인</p>
							</div>
							<div class="css-1jxi7lq"></div>
						</div>
						<div class="css-ng7qrx">
							<p data-testid="Typography" color="rgba(55, 56, 60, 0.61)" class="css-d08m0c" >개인정보 변경을 위해 비밀번호 확인이 필요해요.</p>
							<div class="css-env1z2"><label data-testid="Typography" color="rgba(55, 56, 60, 0.61)"
									for="mobile" class="css-afh7p0">비밀번호</label></div>
							<div class="css-14o8ny9">
								<div class="css-gjm025">
							<input type="password" id="inputPass"
										placeholder="비밀번호를 입력해주세요" name="password" class="css-1sbrczv" value=""></div>
							</div>
							<br/>
							<button type="button" id="nextBtn" class="css-1w1wifl">
								<span color="#000000" class="css-kfktv3">계속</span>
							</button>
						</div>
					</div>
				</div>
			</div>
			<!-- golgolz end -->
			</section>
			<jsp:include page="../../assets/layout/user/footer.jsp" />  
		</main>
	</div>
</body>
</html>
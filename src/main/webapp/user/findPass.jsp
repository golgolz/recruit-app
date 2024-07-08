<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    info=""%>
<!DOCTYPE html>
<html>
<head>
	<jsp:include page="../assets/layout/user/lib.jsp" />
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>  
	<!-- golgolz start -->
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<link rel="shortcut icon" href="https://static.wanted.co.kr/favicon/new/favicon.ico">
	<link rel="stylesheet" href="https://doberman-ready-termite.ngrok-free.app/recruit-app/assets/css/user_login.css"/>
	<link rel="stylesheet" href="https://doberman-ready-termite.ngrok-free.app/recruit-app/assets/css/find_user_info.css"/>
	<!-- golgolz end -->
	<style>
		<!-- golgolz start -->
		.findPassResult.success {
			  color: green;
			}
			
		.findPassResult.error {
			  color: red;
			}
		<!-- golgolz end -->
	</style>
	<script type="text/javascript">
		$(function(){
			<!-- golgolz start -->
			
			var inputEmail = $('#email');
			var inputPhone = $('#phone');
			var inputName = $('#name');
			var findBtn = $('#findPassBtn');
			var findResult = $('.findPassResult')
			
			findBtn.click(function(){
				var msg = '';
				var isValidateEmail = validateEmail();
				var isValidatePhoneNumber = validatePhoneNumber();
				var isValidateName = validateName();
				
				var resultFlag = isValidateEmail && isValidatePhoneNumber && isValidateName;
				
				if(!isValidateEmail){
					msg ='잘못된 이메일 형식입니다.'
					findResult.text(msg);
					findResult.addClass('error');
					findResult.show();
					return;
				}
				else if(!isValidateName){
					msg = '이름은 한글 또는 영문으로 최대 10자까지만 입력이 가능합니다.';
					findResult.text(msg);
					findResult.addClass('error');
					findResult.show();
					return;
				}
				else if(!isValidatePhoneNumber){
					msg = '휴대폰 번호는 숫자로 최대 11자까지만 입력이 가능합니다.';
					findResult.text(msg);
					findResult.addClass('error');
					findResult.show();
					return;
				}
				
				if(resultFlag){
					//DB 검색
					$("#findPassFrm").submit();
					/* var isSearchPass = searchPass();
					if(isSearchPass){ // 정보가 존재할 경우
						findResult.hide();
						alert('비밀번호 찾기 성공!');
						location.href='https://doberman-ready-termite.ngrok-free.app/recruit-app/user/findPassComplete.jsp';
						
					}else { // 조회 정보 없음
						msg ='입력하신 정보로 조회된 정보가 없습니다.';
						findResult.text(msg);
						findResult.addClass('error');
						findResult.show();
						return;
					} */
				}else{
					alert('문제가 발생했습니다. 잠시 후 다시 시도해주세요.');
					return;
				}
				
			});//click
			
			function chkNull(){
				var emailNotEmpty = inputEmail.val().trim() !== '';
				var phoneNotEmpty = inputPhone.val().trim() !== '';
				var nameNotEmpty = inputName.val().trim() !== '';
				var isNotNull = emailNotEmpty && phoneNotEmpty && nameNotEmpty;
				
				if(isNotNull){
					findBtn.prop('disabled',false);
				}else{
					findBtn.prop('disabled',true);
				}
				return isNotNull;
			}//chkNull
			
			//초기 로딩
			chkNull();
			
			//리스너 등록
			inputEmail.on('input',chkNull);
			inputPhone.on('input',chkNull);
			inputName.on('input',chkNull);
			
			
			// 이메일 유효성 검증
		    function validateEmail() {
		    	  var email = inputEmail.val().trim();
		    	  // 이메일 유효성 정규식 : 이메일 형식@,'.'
		    	  var emailRegex = /^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,30}$/;
		    	  return emailRegex.test(email);
		    	}//function
		    	
		    //휴대폰번호 유효성 검증
		    function validatePhoneNumber() {
				  var chkPhoneNumber = inputPhone.val().trim().replace(/-/g, '');
				  // 휴대폰번호 유효성 정규식 : 시작문자 010/011, 숫자 10-11자로 구성
				  var isValid = /^(010|011)\d{7,8}$/.test(chkPhoneNumber); 
				  return isValid;
				}//function
			
			// 이름 유효성 검증
			function validateName() {
				var name = inputName.val().trim();
				// 이름 유효성 정규식: 10자 이내, 한글 또는 영문만 허용
				var nameRegex = /^[가-힣a-zA-Z]{1,10}$/;

				return nameRegex.test(name);
				}//function
			<!-- golgolz end -->
		});//ready
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
						<form id="findPassFrm" action="findPassword.do" method="post">
							<h3 color="#000000" class="css-1qgiy3i" style="text-align: center; margin-bottom: 10px;">회원정보를 입력해 주세요.</h3>
							<p color="rgba(55, 56, 60, 0.61)" class="css-d08m0c" style="margin-bottom: 5px;">입력하신 이메일로 재설정 된 비밀번호를 보내드려요.</p>
							<div class="findPassResult" style='display: none; text-align: center;'>
							</div>
							<div class="css-env1z2" style="margin-top: 20px;"><label color="rgba(55, 56, 60, 0.61)"
									for="email" class="css-afh7p0">이메일</label></div>
							<div class="css-14o8ny9">
								<div class="css-gjm025">
							<input type="text" placeholder="이메일을 입력해주세요" id="email" name="userId" class="css-1sbrczv" value=""></div>
							</div>
							<br/>
							<div class="css-env1z2"><label color="rgba(55, 56, 60, 0.61)"
									for="mobile" class="css-afh7p0">이름</label></div>
							<div class="css-14o8ny9">
								<div class="css-gjm025">
							<input type="text" placeholder="이름을 입력해주세요" id="name" name="name" class="css-1sbrczv" value="" maxlength="18"></div>
							</div>
							<br/>
							<div class="css-env1z2"><label color="rgba(55, 56, 60, 0.61)" 
								for="phone" class="css-afh7p0">휴대폰 번호(-제외)</label></div>
							<div class="css-14o8ny9">
								<div class="css-gjm025">
							<input type="tel" pattern="[0-9]*" placeholder="(예시) 01013245768" id="phone" name="phone" class="css-1sbrczv" value="" maxlength="11"></div>
							</div>
							<button type="button" id="findPassBtn" class="css-1w1wifl"><span
									data-testid="Typography" color="#000000" class="css-kfktv3">비밀번호 찾기</span></button>
						</form>
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
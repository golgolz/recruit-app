<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    info=""%>
<!DOCTYPE html>
<html>
<head>
	<jsp:include page="../assets/layout/user/lib.jsp" />  
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<!-- bootstrap start -->
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css">
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/css/bootstrap-datepicker.min.css">
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/js/bootstrap-datepicker.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/locales/bootstrap-datepicker.ko.min.js"></script> 
	<!-- bootstrap end -->
	<!-- golgolz start -->
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<link rel="shortcut icon" href="https://static.wanted.co.kr/favicon/new/favicon.ico">
	<link rel="stylesheet" href="https://doberman-ready-termite.ngrok-free.app/recruit-app/assets/css/user_login.css"/>
	<link rel="stylesheet" href="https://doberman-ready-termite.ngrok-free.app/recruit-app/assets/css/find_user_info.css"/>
	<link rel="stylesheet" href="https://doberman-ready-termite.ngrok-free.app/recruit-app/assets/css/signup.css"/>
	<!-- golgolz end -->
	<style type="text/css">
		<!-- golgolz start -->
			.input-group-text img {
			 width: 5px;
			height: 5px;
			}
			.css-1b2vfnn {
				padding: 0;
			}
			
			.passConResult.success , .duplResult.success{
			  color: green;
			}
			
			.passConResult.error , .duplResult.error{
			  color: red;
			}
		<!-- golgolz end -->
	</style>
	<script type="text/javascript">
		$(function(){
			<!-- golgolz start -->
			$('#datepicker').datepicker({
				format: 'yyyy-mm-dd', // 날짜 형식 지정
				autoclose: true, // 날짜 선택 후 자동으로 닫힘
				language: 'ko' // 한국어 설정
			});
			
			$('#backBtn').click(function(){
				location.href ='https://doberman-ready-termite.ngrok-free.app/recruit-app/user/loginPage.do';
			});
			
			
			$("#signup-next").click(function(){
				var duplFlag = $('.duplResult').text() === '가입 가능한 이메일입니다.'; // 임시 추후 수정 예정
				var nullFlag = chkNull();
				var passFlag = chkPassCon();
				var mailFlag = chkEmail();
				var isValidateEmail = validateEmail();
				var isValidatePass = validatePass();
				var isValidatePhone = validatePhoneNumber();
				var isValidateTel = validateTelNumber(); 
				var isValidateName = validateName(); 
				var resultFlag = duplFlag && nullFlag && passFlag && mailFlag;
				
				if(!isValidateEmail){
					alert('잘못된 이메일 형식입니다.');
					return;
				}
				else if(!isValidateName){
					alert('이름은 한글 또는 영문으로 최대 10자까지만 입력이 가능합니다.');
					return;
				}
				else if(!isValidatePhone){
					alert('잘못된 휴대폰번호 형식입니다.');
					return;
				}
				else if(!isValidateTel){
					alert('전화번호는 숫자로 최대 11자까지만 입력이 가능합니다.');
					return;
				}
				else if(!isValidatePass){
					alert('잘못된 비밀번호 형식입니다.');
					return;
				}
				
				if(resultFlag){
					$("#signupFrm").submit();
					//location.href="https://doberman-ready-termite.ngrok-free.app/recruit-app/user/signup2.do"
				}else{
					alert('입력 정보를 다시 확인해주세요.');
					return;
				}
			});//click
			
			
			var inputEmail = $('#userId');
			var inputName = $('#name');
			var inputPhone = $('#phone');
			var inputTel = $('#tel');
			var inputPass = $('#pass');
			var inputPassConfirm = $('#passConfirm');
			
			// Null 체크
			function chkNull(){
				var emailNotEmpty = inputEmail.val().trim() !== '';
				var nameNotEmpty = inputName.val().trim() !== '';
				var phoneNotEmpty = inputPhone.val().trim() !== '';
				var telNotEmpty = inputTel.val().trim() !== '';
				var passNotEmpty = inputPass.val().trim() !== '';
				var passConNotEmpty = inputPassConfirm.val().trim() !== '';
				var signupNext = $('#signup-next');
				var checkNull = emailNotEmpty && nameNotEmpty && phoneNotEmpty && telNotEmpty && passNotEmpty && passConNotEmpty;
				
				if(checkNull){
					signupNext.prop('disabled',false);
				}else{
					signupNext.prop('disabled',true);
				}
				
				return checkNull;
			}//chkNull
			
			//이메일 유효성 체크
			function chkEmail() {
				var emailNotEmpty = inputEmail.val().trim() !== '';
				
				var isValidateEmail = validateEmail();
				var duplBtn = $('#duplBtn');
				var mailFlag = false;
				
				if(!isValidateEmail){
					$('.duplResult').hide();
				}
				if(emailNotEmpty && isValidateEmail){
					duplBtn.prop('disabled',false);
					mailFlag = true;
				}else {
					duplBtn.prop('disabled',true);
				}
				
				return mailFlag;
			}//chkEmail
			
			
			// 비밀번호 확인 체크
			function chkPassCon() {
				var msg = '';
				var pass = inputPass.val().trim();
				var passCon = inputPassConfirm.val().trim();
				
				if(pass==='' || passCon===''){
					$(".passConResult").hide();
					return;
				}
				
				var chkPass = pass===passCon;
				
				if(chkPass){
					msg = '비밀번호가 동일합니다.';
					$('.passConResult').text(msg);
					$('.passConResult').removeClass('error').addClass('success');
					$('.passConResult').show();
				}else {
					msg = '비밀번호가 다릅니다.';
					$('.passConResult').text(msg);
					$('.passConResult').removeClass('success').addClass('error');
					$('.passConResult').show();
				}
				
				return chkPass;
			}//chkPassCon
			
			// 초기 로딩
			chkNull();
			chkEmail();
			chkPassCon();
			
			// 이벤트 리스너
			inputEmail.on('input',chkEmail);
			inputEmail.on('input',chkNull);
			inputPass.on('input', chkPassCon);
			inputPassConfirm.on('input', chkPassCon);
			inputPass.on('input',chkNull);
			inputPassConfirm.on('input',chkNull);
			inputName.on('input',chkNull);
			inputPhone.on('input',chkNull);
			inputTel.on('input',chkNull);
			
			// 이메일 유효성 검증 형식
		    function validateEmail() {
		    	  var email = inputEmail.val().trim();
		    	  // 이메일 유효성 정규식 : 이메일 형식@,'.'
		    	  var emailRegex = /^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,30}$/;
		    	  return emailRegex.test(email);
		    	}//function
		    
		     // 비밀번호 유효성 검증 형식
		     function validatePass(){
		    	 var pass = inputPass.val().trim();
		    	 // 비밀번호 유효성 정규식 :8-16자리 구성, 영문 대소문자, 숫자, 특수문자 포함
		    	 var passRegex = /^(?=.*[a-zA-Z])(?=.*\d)(?=.*[!@#$%^&*()])[a-zA-Z\d!@#$%^&*()]{8,16}$/;
		    	 return passRegex.test(pass);
		    	}
		    	
		    //휴대폰번호 유효성 검증 형식
		    function validatePhoneNumber() {
				  var chkPhoneNumber = inputPhone.val().trim().replace(/-/g, '');
				  // 휴대폰번호 유효성 정규식 : 시작문자 010/011, 숫자 10-11자로 구성
				  var isValid = /^(010|011)\d{7,8}$/.test(chkPhoneNumber); 
				  return isValid;
			}//function

			//전화번호 유효성 검증 형식
		    function validateTelNumber() {
				  var chkTelNumber = inputTel.val().trim().replace(/-/g, '');
				  // 전화번호 유효성 정규식 : 숫자 10-11자로 구성
				  var isValid = /^\d{10,11}$/.test(chkTelNumber); 
				  return isValid;
			}//function
			
			// 이름 유효성 검증
			function validateName() {
				var name = inputName.val().trim();
				// 이름 유효성 정규식: 10자 이내, 한글 또는 영문만 허용
				var nameRegex = /^[가-힣a-zA-Z]{1,10}$/;

				return nameRegex.test(name);
				}//function
				
			
				 // 이메일 중복 확인
				 $('#duplBtn').click(function() {
				        var userId = $('#userId').val();
				        
				        $.ajax({
				            url: '../user/checkDuplId.do',
				            type: 'GET',
				            data: {userId: userId},
				            success: function(response) {
				                if (response.result === 'success') {
				                    // 아이디 사용 가능 처리 (가입 가능한 이메일)
				                    $('.duplResult').text(response.chkMsg);
									$('.duplResult').removeClass('error').addClass('success');
									$('.duplResult').show();
				                } else {
				                    // 아이디 사용 불가 처리 (이미 가입된 이메일)
				                    $('.duplResult').text(response.chkMsg);
									$('.duplResult').removeClass('success').addClass('error');
									$('.duplResult').show();
				                }
				            },
				            error: function(xhr) {
				                //alert(xhr.status);
				                alert('중복 확인 중 오류가 발생했습니다.');
				            }
				        });//ajax
				    });//click
				
			
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
							<div class="css-hpuads">
							<button type="button" class="css-dkzxe" id="backBtn">
								<span class="css-1ihsymv"><svg
								viewBox="0 0 24 24" color="rgba(55, 56, 60, 0.61)" class="css-1h47l4s">
								<path fill-rule="evenodd" clip-rule="evenodd" fill="rgba(55, 56, 60, 0.61)"
									d="M2.8637 11.3635C2.51223 11.715 2.51223 12.2848 2.8637 12.6363L9.8637 19.6363C10.2152 19.9878 10.785 19.9878 11.1365 19.6363C11.488 19.2848 11.488 18.715 11.1365 18.3635L5.67289 12.8999H20.5001C20.9972 12.8999 21.4001 12.497 21.4001 11.9999C21.4001 11.5028 20.9972 11.0999 20.5001 11.0999L5.67289 11.0999L11.1365 5.6363C11.488 5.28483 11.488 4.71498 11.1365 4.36351C10.785 4.01203 10.2152 4.01203 9.8637 4.36351L2.8637 11.3635Z">
								</path>
							</svg></span>
						<p ="Typography" color="rgba(55, 56, 60, 0.61)" class="css-k88rq" style="margin-top: 10px;">취소하고 돌아가기</p>
					</button></div>
				<div class="css-1ktsezg">
					<div class="css-1nm9gyu">
						<div class="css-oan6e"><button type="button" class="css-1krggrv">
								<p color="#000000" class="css-1ub1oa4">취소</p>
							</button></div>
						<div class="css-1iooy02">
							<p color="#000000" class="css-14qpgc6">회원가입</p>
						</div>
						<div class="css-1jxi7lq"></div>
					</div>
					<div class="css-ng7qrx">
						<form class="css-1b2vfnn" id="signupFrm" name="signupFrm" action="../user/nextSignup.do" method="post">
							<div>
								<div class="css-1ia1k3o">
									<div class="css-cssveg">
										<div class="css-env1z2">
										<label ="Typography"
												color="rgba(55, 56, 60, 0.61)" for="email"
												class="css-afh7p0">이메일</label></div>
												<input type="email" placeholder="이메일을 입력해주세요." id="userId" name="userId"
											autocomplete="new-password" class="css-1sbrczv" value="">
									</div>
									<button type="button"  class="css-zzrlz5" id="duplBtn">
									<span color="#000000" class="css-htgykj" >중복 확인</span></button>
								</div>
								<div class="duplResult">
								</div>
							</div>
							<div class="css-evy94o">
								<div class="css-env1z2"><label ="Typography" color="rgba(55, 56, 60, 0.61)"
										for="name" class="css-afh7p0">이름</label></div>
										<input type="text" placeholder="이름을 입력해주세요." name="name" id="name"
									autocomplete="new-password" class="css-1sbrczv" value="" maxlength="10">
							</div>
							<div>
								<div class="css-env1z2"><label color="rgba(55, 56, 60, 0.61)"
										for="phone" class="css-afh7p0">휴대폰 번호(-제외)</label></div>
								<div class="css-14o8ny9">
									<div class="css-gjm025" style="margin-bottom: 20px;">
									<input type="tel" pattern="[0-9]*" placeholder="(예시) 01013245768" name="phone" id="phone"
											autocomplete="on" class="css-1sbrczv" value="" maxlength="11">
								</div>
							</div>
								<div class="css-env1z2"><label ="Typography" color="rgba(55, 56, 60, 0.61)"
										for="tel" class="css-afh7p0">전화번호(-제외)</label></div>
								<div class="css-14o8ny9">
									<div class="css-gjm025" style="margin-bottom: 15px;">
									<input type="tel" pattern="[0-9]*" placeholder="(예시) 021234567" name="tel" id="tel" 
											autocomplete="on" class="css-1sbrczv" value="" maxlength="11">
								</div>
								</div>
							</div>
							<div class="css-evy94o">
								<div class="css-env1z2"><label ="Typography" color="rgba(55, 56, 60, 0.61)"
										for="password" class="css-afh7p0">비밀번호</label></div>
								<div class="css-evy94o">
								<input type="password" placeholder="비밀번호를 입력해주세요." name="password" id="pass"
								 autocomplete="on" class="css-1sbrczv" value=""></div>
								<input type="password" placeholder="비밀번호를 다시 한번 입력해주세요." name="passwordConfirm" id="passConfirm"
								 autocomplete="on" class="css-1sbrczv" value="">
								<div class="passConResult">
								</div>
								<p ="Typography" color="rgba(55, 56, 60, 0.61)" class="css-1eroab9" style="font-size: 14px;">영문 대소문자,
									숫자, 특수문자를 3가지 이상으로 조합해 8자 이상 16자 이하로 입력해주세요.</p>
							</div>
							<div class="css-1tbd2jx">
								<div class="css-1csonyh"></div>
								<div class="css-270vek"></div>
								<button type="button" class="css-1yzn4b" id="signup-next">
								<span color="#000000" class="css-kfktv3">다음으로</span>
								</button>
							</div>
						</form>
					</div>
				</div>
			<!-- golgolz end -->
			</section>
			<jsp:include page="../assets/layout/user/footer.jsp" />  
		</main>
	</div>
</body>
</html>
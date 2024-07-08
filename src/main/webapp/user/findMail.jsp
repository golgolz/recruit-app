<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    info=""%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
		.findResult.success {
			  color: green;
			}
			
		.findResult.error {
			  color: red;
			}
		<!-- golgolz end -->
	</style>
	<script type="text/javascript">
		$(function(){
			<!-- golgolz start -->
			var inputPhone = $('#phone');
			var inputName = $('#name');
			var findBtn = $('#findBtn');
			var findResult = $('.findResult');
			var findMailFrm = $('#findMailFrm');
			
			findBtn.click(function(){
				var msg = '';
				var valiPhone = validatePhoneNumber();
				var nullFlag = chkNull();
				var ResultFlag = valiPhone && nullFlag;
				if(!valiPhone){
					msg = '휴대폰 번호는 숫자로 최대 11자까지만 입력이 가능합니다.';
					findResult.text(msg);
					findResult.addClass('error');
					findResult.show();
					return;
				}
				
				if(ResultFlag){
					var isMailFlag = searchMail();
					if(isMailFlag){
						findResult.hide();
						findMailFrm.submit();
						/* alert('계정 찾기 성공!');
						location.href='https://doberman-ready-termite.ngrok-free.app/recruit-app/user/findMailComplete.jsp'; */
					}else {
						msg = ${ requestScope.resultMsg };
						findResult.text(msg);
						findResult.addClass('error');
						findResult.show();
					}
					return;
				}else{
					alert('문제가 발생 했습니다. 잠시 후 다시 시도해주세요.');
					return;
				}
			});//click
			
			
			function chkNull(){
				phoneNotEmpty = inputPhone.val().trim() !== '';
				nameNotEmpty = inputName.val().trim() != '';
				isNullFlag = phoneNotEmpty && nameNotEmpty;
				
				if(isNullFlag){
					findBtn.prop('disabled',false);
				}else{
					findBtn.prop('disabled',true);
				}
				
				return isNullFlag;
			}//function
			
			function validatePhoneNumber() {
				  var chkPhoneNumber = inputPhone.val().trim().replace(/-/g, '');
				  // 시작문자 010/011, 숫자로만 구성, 길이 유효성 검증
				  var isValid = /^(010|011)\d{7,8}$/.test(chkPhoneNumber); 
				  return isValid;
			}//function
			
			function searchMail(){
				
				//DB 조회 결과 확인
				var flag = true; // 임시 설정
				
				return flag;
			}
			
			//초기 로딩
			chkNull();
			
			inputPhone.on('input',chkNull);
			inputName.on('input',chkNull);
			
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
								<p data-testid="Typography" color="#000000" class="css-14qpgc6">계정 찾기</p>
							</div>
							<div class="css-1jxi7lq"></div>
						</div>
						<form id="findMailFrm" action="../user/findMailComplete.do" method="post">
							<div class="css-ng7qrx">
								<p data-testid="Typography" color="rgba(55, 56, 60, 0.61)" class="css-d08m0c" style="margin-bottom: 5px;">계정을 찾기 위해
									이름과 전화번호를 입력해주세요.</p>
								<div class="findResult" style="display: none; text-align: center;"></div>
								<div class="css-env1z2"><label data-testid="Typography" color="rgba(55, 56, 60, 0.61)"
										for="mobile" class="css-afh7p0">이름</label></div>
								<div class="css-14o8ny9">
									<div class="css-gjm025">
								<input type="text" placeholder="이름을 입력해주세요" id="name" class="css-1sbrczv" value="" maxlength="10"></div>
								</div>
								<br/>
								<div class="css-env1z2"><label color="rgba(55, 56, 60, 0.61)"
										for="phone" class="css-afh7p0">휴대폰 번호(-제외)</label></div>
								<div class="css-14o8ny9">
									<div class="css-gjm025">
								<input type="tel" pattern="[0-9]*" id="phone"
											placeholder="(예시) 01013245768" name="phone" class="css-1sbrczv" value="" maxlength="11"></div>
								</div>
								<button type="button" id="findBtn" class="css-1w1wifl"><span
										data-testid="Typography" color="#000000" class="css-kfktv3">계정 찾기</span></button>
							</div>
						</form>
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
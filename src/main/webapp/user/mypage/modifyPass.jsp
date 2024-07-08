<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    info=""%>
<!DOCTYPE html>
<html>
<head>
	<jsp:include page="../../assets/layout/user/lib.jsp" />  
	<!-- golgolz start -->
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<!-- 파비콘 -->
    <link rel="shortcut icon" href="https://static.wanted.co.kr/favicon/new/favicon.ico"/>
    <link rel="stylesheet" href="https://asset.wanted.co.kr/userweb/www/_next/static/css/c76e012c05e1318d.css" crossorigin="anonymous" data-n-g=""/>
	<link rel="stylesheet" href="https://doberman-ready-termite.ngrok-free.app/recruit-app/assets/css/mypage.css"/>
	<link rel="stylesheet" href="https://doberman-ready-termite.ngrok-free.app/recruit-app/assets/css/signup.css"/>
	<link rel="stylesheet" href="https://doberman-ready-termite.ngrok-free.app/recruit-app/assets/css/layout/user/btn-bootstrap.css" />
	<!-- golgolz end -->
<style>
	@media (max-width: 767px) {
    .css-9dug5j {
        min-width: auto;
    }
    .css-j2itip {
        display: flex;
        flex-direction: column;
        align-items: flex-end;
	    }
	}
	.css-j2itip {
	    color: rgb(23, 23, 25);
	    font-weight: var(--text-weight-body-normal);
	    text-align: left;
	    letter-spacing: var(--text-spacing-body);
	    font-size: var(--text-size-body);
	    line-height: var(--text-height-body);
	    flex: 1 1 0%;
	    margin-right: 15px;
	    word-break: break-all;
	}
	.css-15hfbq8:not(:first-child) {
	    border-top: 1px solid rgba(112, 115, 124, 0.22);
	}
	.css-15hfbq8 {
	    display: flex;
	    -webkit-box-align: center;
	    align-items: center;
	    cursor: pointer;
	}
	.css-xr5rwo:not(:first-child) {
	    border-top: 1px solid rgba(112, 115, 124, 0.22);
	}
	.css-xr5rwo {
	    display: flex;
	    -webkit-box-align: center;
	    cursor: pointer;
	    align-items: flex-start;
	}
	#__next {
	    padding: 0;
	    margin: 0;
	    width: 100%;
	    height: 100%;
	    min-width: 320px;
	    text-rendering: optimizeLegibility;
	    word-break: keep-all;
	    overflow-wrap: anywhere;
	}
	body {
	background-color: #FFFFFF;
	}
	.css-1sbrczv {
		    width: 100%;
		    height: 48px;
		    min-height: 48px;
		    padding: 0px 16px;
		    outline: none;
		    background-color: transparent;
		    border: 1px solid rgba(112, 115, 124, 0.22);
		    color: #171719;
		    border-radius: 10px;
		    font-size: 15px;
		    font-weight: 400;
		}
    </style>
	<style type="text/css">
		<!-- golgolz start -->
			.button{
            width: 120px; height: 40px; border: 1px solid rgba(112, 115, 124, 0.22); border-radius: 10px;
            }
            .btn{
            width: 120px; height: 40px; font-size: 15px;
            }
            .modifyPassBtn{
            background-color: grey;
            color: #FFFFFF;
            }
            .modifyBtn{
            background-color: skyblue;
            color: #FFFFFF;
            }
		<!-- golgolz end -->
	</style>
	<!-- golgolz start -->
	<script type="text/javascript">
		$(function(){
			
				var newPass = $("#newPass");
				var newPassCon = $("#newPassCon");
				
				$('#cancleBtn').click(function(){
	      	  	  alert('비밀번호 변경이 취소 되었습니다.');
	      	  	  location.href='mypageUserInfo.jsp';		
	      	  	});//click	
	      	  	
	      	  	$('#modifyBtn').click(function(){
	      	  	  var isEmptyPass = newPass.val().trim() !== '';
	      	  	  var isEmptyPassCon = newPassCon.val().trim() !== '';
				  var isValidatePass = validatePass();
				  var isConfirmPass = newPass.val().trim() === newPassCon.val().trim()
				  var chkPassFlag = isEmptyPass && isEmptyPassCon && isValidatePass && isConfirmPass
				  
				  if(chkPassFlag){
		      	  	  alert('비밀번호 변경이 완료 되었습니다.');
		      	  	  location.href='mypageUserInfo.jsp';
				  }else if(!isEmptyPass || !isEmptyPassCon) {
					  alert('변경할 비밀번호를 입력해주세요.');
					  return;
				  }else if(!isValidatePass){
					  alert('잘못된 비밀번호 형식입니다.');
					  return;
				  }else if(!isConfirmPass){
					  alert('비밀번호가 동일하지 않습니다.');
					  return;
				  }
	      	  	});//click
	      	  	
	      		// 비밀번호 유효성 검증 형식
			    function validatePass(){
			    	 var pass = newPass.val().trim();
			    	 // 비밀번호 유효성 정규식 :8-16자리 구성, 영문 대소문자, 숫자, 특수문자 포함
			    	 var passRegex = /^(?=.*[a-zA-Z])(?=.*\d)(?=.*[!@#$%^&*()])[a-zA-Z\d!@#$%^&*()]{8,16}$/;
			    	 return passRegex.test(pass);
			    }//function
			   
		});//ready
	</script>
	<!-- golgolz end -->
</head>
<body>
    <div id="__next" data-reactroot="">
		<jsp:include page="../../assets/layout/user/header.jsp" />
		<main class="JobsFeed_Jobsfeed__DpeV9">  
			<section class="Section_Section__P1hhc">
			<!-- golgolz start -->
        <div class="MainLayout_MainLayout__root__p6itg">
          <div class="Grid_Grid__container__J9CcC Grid_Grid__spacing__5__ZwgDV">
          <jsp:include page="mypage_layout.jsp"/>
            <div
              class="Grid_Grid__item__FUkSS Grid_Grid__align-items_flex-start__PA0JE Grid_Grid__grid__md__1__aOHPk MainLayout_MainLayout__space__8eQvZ"
            ></div>
            <div
              class="Grid_Grid__item__FUkSS Grid_Grid__justify_center__QJu2X Grid_Grid__align-items_flex-start__PA0JE Grid_Grid__grid__xs__12__rVqKh Grid_Grid__grid__md__6__9g_JE"
            >
              <div
                class="Grid_Grid__container__J9CcC Grid_Grid__direction_column__jR3AZ Grid_Grid__wrap_nowrap__4r_cp ProfileView_ProfileView__root__eOS_q"
              >
                <div class="Grid_Grid__container__J9CcC Grid_Grid__align-items_center__VEikH ProfileViewFollowerFollwingInfo_ProfileViewFollowerFollwingInfo__root__TSJnS" >
                </div>
                <section class="Grid_Grid__item__FUkSS Grid_Grid__align-items_flex-start__PA0JE ProfileView_ProfileView__borderSection__VkDe7" style="margin: 30px 0px 30px 0px;">
                  <h1 style="font-size: 25px;">비밀번호 재설정</h1>
                </section>
                <section
                  class="Grid_Grid__item__FUkSS Grid_Grid__align-items_flex-start__PA0JE" style="margin-bottom: 50px;"
                >
                  <article class="css-dnwsdj">
                  <div class="css-9as5im">
                  <p data-testid="Typography" color="rgba(55, 56, 60, 0.61)" class="css-1b12nwt"><strong>새로운 비밀번호</strong>를 입력해주세요.</p>
                  </div>
                  <ul class="css-14jv0iu">
                  <li data-list-type="SOCIAL_LINK" tabindex="0" class="css-15hfbq8"><p data-testid="Typography" color="#000000" class="css-9dug5j">새로운 비밀번호</p>
                  <input type="password" id="newPass" name="password" autocomplete="on" class="css-1sbrczv" value="">
                  </li>
                  <li data-list-type="SOCIAL_LINK" tabindex="0" class="css-15hfbq8"><p data-testid="Typography" color="#000000" class="css-9dug5j">비밀번호 확인</p>
                  <input type="password" id="newPassCon" name="password" autocomplete="on" class="css-1sbrczv" value="">
                  </li>
                   <li data-list-type="SOCIAL_LINK" tabindex="0" style="text-align: center;">
                   <input type="button" id="modifyBtn" value="수정완료" class="btn btn-outline-warning btn-sm update-btn" style="margin: 5px;">
                   <input type="button" id="cancleBtn" value="취소" class="btn btn-outline-danger btn-sm remove-btn" style="margin: 5px;">
                   </li>
                  </ul></article>
                </section>
              </div>
            </div>
            <div
              class="Grid_Grid__item__FUkSS Grid_Grid__align-items_flex-start__PA0JE Grid_Grid__grid__md__1__aOHPk MainLayout_MainLayout__space__8eQvZ"
            ></div>
          </div>
        </div>
			<!-- golgolz end -->
			</section>
			<jsp:include page="../../assets/layout/user/footer.jsp" />
		</main>
	</div>
</body>
</html>
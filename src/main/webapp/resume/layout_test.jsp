<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    info=""%>
<!DOCTYPE html>
<html>
<head>
	
	<jsp:include page="../assets/layout/user/lib.jsp" />  
	<!-- golgolz start -->
    <link href="https://doberman-ready-termite.ngrok-free.app/recruit-app/assets/css/resume/write-sv-202405231305.css" rel="stylesheet" type="text/css"/>
    <link href="https://doberman-ready-termite.ngrok-free.app/recruit-app/assets/css/resume/flow.css" />
    <link href="https://doberman-ready-termite.ngrok-free.app/recruit-app/assets/css/resume/layout-sv-202401301659.css" rel="stylesheet" type="text/css"/>
    <style>
      .autocomplete .list .hover {
        background-color: #f5f5f5;
      }
      .popupSearchDuty .list .hover {
        background-color: #f5f5f5;
      }
    </style>
    <style>
      .async-hide {
        opacity: 0 !important;
      }
    </style>
    <!-- End Google Tag Manager -->
    <!-- 상단 선언 스크립트 : 모든페이지 공통 상단 필수 -->
    <!-- PlayD TERA Log Definition Script Start -->
    <script>
      window.onload = function () {
        (function (win, name) {
          win["LogAnalyticsObject"] = name;
          win[name] =
            win[name] ||
            function () {
              (win[name].q = win[name].q || []).push(arguments);
            };
        })(window, "_LA");
      };
    </script>
    <script src="https://doberman-ready-termite.ngrok-free.app/recruit-app/assets/js/user/resume/json2.js"></script>
    <script src="https://doberman-ready-termite.ngrok-free.app/recruit-app/assets/js/user/resume/jquery"></script>
    <script src="https://doberman-ready-termite.ngrok-free.app/recruit-app/assets/js/user/resume/itemtemplate.js"></script>
    <script src="https://doberman-ready-termite.ngrok-free.app/recruit-app/assets/js/user/resume/JK_Cookie.js"></script>
    <script src="https://doberman-ready-termite.ngrok-free.app/recruit-app/assets/js/user/resume/JK5cript"></script>
    <script src="https://doberman-ready-termite.ngrok-free.app/recruit-app/assets/js/user/resume/ResumeReg"></script>
	<!-- golgolz end -->
	<style text="text/css">
		<!-- golgolz start -->
		.resumeContainer{
			width: 940px;
		}
		<!-- golgolz end -->
	</style>
	<script text="text/javascript">
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
							<div class="resumePage">
					<form action="https://www.jobkorea.co.kr/User/Resume/Save" method="post" id="frm1">
						<div class="resumeWrapper">
							<div class="resumeContainer">
								<div class="formWrap formWrapCareer" id="formCareer" style="">
									<div class="header">
										<h2 class="header">제목</h2>
									</div>
								</div>
								<div class="resumeTitle">
									<input id="UserResume_M_Resume_Title" maxlength="100" name="UserResume.M_Resume_Title" placeholder="기업에게 나에 대해 알려줍시다. 강점, 목표, 관심분야도 좋아요." type="text" value="" />
								</div>
 								<jsp:include page="./category/language.jsp" />
							</div>
						</div>
					</form>
				</div>
				<div id="healthLayer" style="display: none"></div>
				<script src="https://doberman-ready-termite.ngrok-free.app/recruit-app/assets/js/user/resume/countdown.js"></script>
				<script src="https://doberman-ready-termite.ngrok-free.app/recruit-app/assets/js/user/resume/LoginWatcher.js"></script>
				<script type="text/javascript" src="https://doberman-ready-termite.ngrok-free.app/recruit-app/assets/js/user/resume/page_leave.js"></script>
				<script type="text/template" id="tplKeywordCheckBox"></script>
				<script type="text/template" id="tplCommonDirectInput"></script>
				<script type="text/template" id="tplCommonNotFound"></script>
				<script type="text/template" id="tplCommonSearch"></script>
				<script type="text/template" id="tplDepthCommonItem"></script>
			<!-- golgolz end -->
			</section>
			<jsp:include page="../assets/layout/user/footer.jsp" />  
		</main>
	</div>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    info=""%>
<!DOCTYPE html>
<html>
<head> 
	<!-- golgolz start -->
    <link href="http://localhost/recruit-app/assets/css/resume/write-sv-202405231305.css" rel="stylesheet" type="text/css"/>
    <link href="http://localhost/recruit-app/assets/css/resume/flow.css" />
    <link href="http://localhost/recruit-app/assets/css/resume/layout-sv-202401301659.css" rel="stylesheet" type="text/css"/>
    <link rel="stylesheet" href="http://localhost/recruit-app/assets/css/layout/user/btn-bootstrap.css" />
    <style>
      .autocomplete .list .hover {
        background-color: #f5f5f5;
      }
      .popupSearchDuty .list .hover {
        background-color: #f5f5f5;
      }
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
	<jsp:include page="../assets/layout/user/lib.jsp" /> 
    <script src="http://localhost/recruit-app/assets/js/user/resume/json2.js"></script>
    <script src="http://localhost/recruit-app/assets/js/user/resume/jquery"></script>
    <script src="http://localhost/recruit-app/assets/js/user/resume/itemtemplate.js"></script>
    <script src="http://localhost/recruit-app/assets/js/user/resume/JK_Cookie.js"></script>
    <script src="http://localhost/recruit-app/assets/js/user/resume/JK5cript.js"></script>
    <script src="http://localhost/recruit-app/assets/js/user/resume/ResumeReg"></script>
	<!-- golgolz end -->
	<script type="text/javascript" src="http://localhost/recruit-app/assets/js/user/resume/edu.js"></script>
    <link rel="stylesheet" href="http://localhost/recruit-app/assets/css/resume/detail.css" />
	<style text="text/css">
		<!-- golgolz start -->
		<!-- golgolz end -->
	</style>
	<script text="text/javascript">
		$(function(){
			<!-- golgolz start -->
			//$('.chip[data-value="Vue.js"]').addClass("active"); // select before rendering
	        $(".chip").click(function () {
	          $(this).toggleClass("active");

	          var selectedValues = $(".chip.active")
	            .map(function () {
	              return $(this).data("value");
	            })
	            .get();
	        });
			
	        $("#resetButton").click(function(event) {
                event.preventDefault(); // 기본 동작 방지
                $('.chip').removeClass('active'); // 모든 칩 선택 해제
            });

			setTimeout(function() {
				$("#UserResume_M_Resume_Title").focus(); // myInput은 포커스를 줄 input 요소의 ID
			}, 1); // 500ms (0.5초) 지연
			
			var area0 = ["시/도 선택","서울특별시","인천광역시","대전광역시","광주광역시","대구광역시","울산광역시","부산광역시","경기도","강원도","충청북도","충청남도","전라북도","전라남도","경상북도","경상남도","제주도"];
			var area1 = ["강남구","강동구","강북구","강서구","관악구","광진구","구로구","금천구","노원구","도봉구","동대문구","동작구","마포구","서대문구","서초구","성동구","성북구","송파구","양천구","영등포구","용산구","은평구","종로구","중구","중랑구"];
			var area2 = ["계양구","남구","남동구","동구","부평구","서구","연수구","중구","강화군","옹진군"];
			var area3 = ["대덕구","동구","서구","유성구","중구"];
			var area4 = ["광산구","남구","동구", "북구","서구"];
			var area5 = ["남구","달서구","동구","북구","서구","수성구","중구","달성군"];
			var area6 = ["남구","동구","북구","중구","울주군"];
			var area7 = ["강서구","금정구","남구","동구","동래구","부산진구","북구","사상구","사하구","서구","수영구","연제구","영도구","중구","해운대구","기장군"];
			var area8 = ["고양시","과천시","광명시","광주시","구리시","군포시","김포시","남양주시","동두천시","부천시","성남시","수원시","시흥시","안산시","안성시","안양시","양주시","오산시","용인시","의왕시","의정부시","이천시","파주시","평택시","포천시","하남시","화성시","가평군","양평군","여주군","연천군"];
			var area9 = ["강릉시","동해시","삼척시","속초시","원주시","춘천시","태백시","고성군","양구군","양양군","영월군","인제군","정선군","철원군","평창군","홍천군","화천군","횡성군"];
			var area10 = ["제천시","청주시","충주시","괴산군","단양군","보은군","영동군","옥천군","음성군","증평군","진천군","청원군"];
			var area11 = ["계룡시","공주시","논산시","보령시","서산시","아산시","천안시","금산군","당진군","부여군","서천군","연기군","예산군","청양군","태안군","홍성군"];
			var area12 = ["군산시","김제시","남원시","익산시","전주시","정읍시","고창군","무주군","부안군","순창군","완주군","임실군","장수군","진안군"];
			var area13 = ["광양시","나주시","목포시","순천시","여수시","강진군","고흥군","곡성군","구례군","담양군","무안군","보성군","신안군","영광군","영암군","완도군","장성군","장흥군","진도군","함평군","해남군","화순군"];
			var area14 = ["경산시","경주시","구미시","김천시","문경시","상주시","안동시","영주시","영천시","포항시","고령군","군위군","봉화군","성주군","영덕군","영양군","예천군","울릉군","울진군","의성군","청도군","청송군","칠곡군"];
			var area15 = ["거제시","김해시","마산시","밀양시","사천시","양산시","진주시","진해시","창원시","통영시","거창군","고성군","남해군","산청군","의령군","창녕군","하동군","함안군","함양군","합천군"];
			var area16 = ["서귀포시","제주시","남제주군","북제주군"];
			 
			// 시/도 선택 박스 초기화
			$("select[name^=sido]").each(function() {
				$selsido = $(this);
				$.each(eval(area0), function() {
					$selsido.append("<option style='font-size: 14px;' value='"+this+"'>"+this+"</option>");
				});
				$selsido.next().append("<option style='font-size: 14px;' value=''>구/군 선택</option>");
			});

			// 시/도 선택시 구/군 설정
			$("select[name^=sido]").change(function() {
				var area = "area"+$("option",$(this)).index($("option:selected",$(this))); // 선택지역의 구군 Array
				var $gugun = $(this).next(); // 선택영역 군구 객체
				$("option",$gugun).remove(); // 구군 초기화
	
				if(area == "area0")
					$gugun.append("<option style='font-size: 14px;' value=''>구/군 선택</option>");
				else {
					$.each(eval(area), function() {
					$gugun.append("<option style='font-size: 14px;' value='"+this+"'>"+this+"</option>");
					});
				}
			});
			
			var resumeNum = "${resumeNum}";
			
			if (resumeNum) {
				$.ajax({
		            url: "${pageContext.request.contextPath}/api/manage/resumes/detail.do?id=" + resumeNum,
		            method: 'GET',
		            dataType: 'JSON',
		            success: function(data) {
		            	console.log(data);
		            },
		            error: function(xhr, status, error) {
		                console.error("Error fetching data: " + error);
		                $("#recruit-list tbody").html('<tr><td colspan="4" style="font-size: 16px; font-weight: bold;">데이터를 불러오는 데 실패했습니다.</td></tr>');
		            }
		        });
		    }
			<!-- golgolz end -->
		});
		
		function updateTitle(titleData){
			
		}
		
		function udpateProfile(profileData){
			
		}
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
								<h2 style="font-size: 36px; color:#000; margin-bottom: 20px; font-weight: bold;">이력서 등록</h2>
								<div class="formWrap formWrapCareer" id="formCareer" style="">
									<div class="header">
										<h2 class="header">제목</h2>
									</div>
								</div>
								<div class="resumeTitle">
									<input id="UserResume_M_Resume_Title" maxlength="100" name="UserResume.M_Resume_Title" placeholder="기업에게 나에 대해 알려줍시다. 강점, 목표, 관심분야도 좋아요." type="text" value="" autofocus />
								</div>
 								<jsp:include page="./category/profile.jsp" />
 								<jsp:include page="./category/skill.jsp" />
 								<jsp:include page="./category/edu.jsp" />
 								<jsp:include page="./category/career.jsp" />
 								<jsp:include page="./category/certification.jsp" />
 								<jsp:include page="./category/language.jsp" />
 								<jsp:include page="./category/introduction.jsp" />
								<div id="resumeBtns">
									<input type="button" id="registerBtn" class="golgolBtn btn btn-outline-success btn-sm register-btn" value="등록" />
									<input type="button" id="registerBtn" class="golgolBtn btn btn-outline-warning btn-sm update-btn" value="수정" />
									<input type="button" id="registerBtn" class="golgolBtn btn btn-outline-danger btn-sm remove-btn" value="삭제" />
								</div>
							</div>
						</div>
					</form>
				</div>
				<div id="healthLayer" style="display: none"></div>
				<script src="http://localhost/recruit-app/assets/js/user/resume/countdown.js"></script>
				<script src="http://localhost/recruit-app/assets/js/user/resume/LoginWatcher.js"></script>
				<script type="text/javascript" src="http://localhost/recruit-app/assets/js/user/resume/page_leave.js"></script>
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
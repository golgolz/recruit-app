<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    info=""%>
<!DOCTYPE html>
<html>
<head>
	<jsp:include page="../assets/layout/user/lib.jsp" />  
	<!-- golgolz start -->
    <link href="http://localhost/recruit-app/assets/css/recruit/view-sv-202405201324.css" rel="stylesheet" type="text/css"/>
    <script src="https://code.jquery.com/jquery-3.7.1.min.js" integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous"></script>
	<!-- golgolz end -->
	<style text="text/css">
		<!-- golgolz start -->
		#container, .container{
		    width: 1200px;
		}
		p{
			font-size: 14px;
		}
		.artReadJobSum .tbList > dd, .artReadJobSum .tbList > dt {
			font-size: 15px;
		}
		<!-- golgolz end -->
	</style>
	<script text="text/javascript">
		var company = "";
		
		$(function(){
			<!-- golgolz start -->
			$.ajax({
	            url: "${pageContext.request.contextPath}/api/recruit.do?id=" + ${recruitNum},
	            method: 'GET',
	            dataType: 'JSON',
	            success: function(data) {
	            	console.log(data);
	            	renderRecruitData(data);
	            	company = data.companyCode;
	            },
	            error: function(xhr, status, error) {
	                console.error("Error fetching data: " + error);
	            }
	        });
			
			$("#devApplyBtn1").click(function(){
		        var url = 'http://localhost/recruit-app/resume/resumes.do?recruit=' + ${recruitNum};
		        
		        window.location.href = url;
			});
			
			$("#devApplyBtn2").click(function(){
		        var url = 'http://localhost/recruit-app/resume/resumes.do?recruit=' + ${recruitNum};
		        
		        window.location.href = url;
			});
			<!-- golgolz end -->
		});
		
		function renderRecruitData(Recruit) {
			$.ajax({
				url: "${pageContext.request.contextPath}/api/welfares.do?company=" + Recruit.companyCode,
				method: 'GET',
	            dataType: 'JSON',
	            success: function(data) {
	            	updateWelfare(data);
	            },
	            error: function(xhr, status, error) {
	                console.error("Error fetching data: " + error);
	            }
			});

			$('.coName').text(Recruit.companyName);
		    var h3Element = $('.hd_3');
		    var headerDiv = h3Element.find('.header');
		    h3Element.contents().filter(function() {
		        return this.nodeType === 3; // 텍스트 노드
		    }).remove();
		    h3Element.append(document.createTextNode(Recruit.title));
		    h3Element.prepend(headerDiv);

		    $('.tbList dt:contains("경력") + dd strong').text(Recruit.careerStandard);
		    switch (Recruit.eduStandard) {
		        case "1":
		            $('.tbList dt:contains("학력") + dd strong').text('고등학교 졸업 이상');
		            break;
		        case "2":
		            $('.tbList dt:contains("학력") + dd strong').text('대학교(2,3년제) 졸업 이상');
		            break;
		        case "3":
		            $('.tbList dt:contains("학력") + dd strong').text('대학교(4년제) 졸업 이상');
		            break;
		        case "4":
		            $('.tbList dt:contains("학력") + dd strong').text('대학원(석사) 졸업 이상');
		            break;
		        case "5":
		            $('.tbList dt:contains("학력") + dd strong').text('대학원(박사) 졸업 이상');
		            break;
		        default:
		            $('.tbList dt:contains("학력") + dd strong').text('학력무관');
		    }
		    
		    $('.tbList dt:contains("고용형태") + dd strong').text(Recruit.hireCategory);
		    $('.tbList dt:contains("급여") + dd').text(Recruit.salary + " 만원");
		    $('.tbList dt:contains("지역") + dd').text(Recruit.workPlace);
		    $('.tbList dt:contains("시간") + dd span.tahoma:first').text(Recruit.workDay);
		    $('.tbList dt:contains("시간") + dd span.tahoma:last').text(Recruit.workTime);
		    $('#recruitContent').html(Recruit.content);
		    
		    const today = new Date();
		    const endDate = new Date(Recruit.endDate);
		    updateDateInfo(Recruit.inputDate, Recruit.endDate);
		    
		    if (today > endDate) {
		        replaceApplyButton('.tbOline .btn');
		        replaceApplyButton('.sumBtn');
		    } else {
		        $('.devOnlineApplyBtn').on('click', function() {
		            console.log('지원하기 버튼이 클릭되었습니다.');
		        });
		        updateCountdown(endDate);
		        countdownTimer = setInterval(() => updateCountdown(endDate), 1000);
		    }
		}

		function updateCountdown(endDate) {
		    const today = new Date();
		    const distance = endDate - today;

		    const days = Math.floor(distance / (1000 * 60 * 60 * 24));
		    const hours = Math.floor((distance % (1000 * 60 * 60 * 24)) / (1000 * 60 * 60));
		    const minutes = Math.floor((distance % (1000 * 60 * 60)) / (1000 * 60));
		    const seconds = Math.floor((distance % (1000 * 60)) / 1000);

		    let countdownText = '';
		    if (days > 0) {
		        countdownText += days + "일 ";
		    }
		    countdownText += hours.toString().padStart(2, '0') + ':' + 
				            minutes.toString().padStart(2, '0') + ':' + 
				            seconds.toString().padStart(2, '0');
		    $('.devRemainCount .tahoma').text(countdownText);

		    if (distance < 0) {
		        clearInterval(countdownTimer);
		        $('.devRemainCount .tahoma').text('마감됨');
		        replaceApplyButton('.tbOline .btn');
		        replaceApplyButton('.sumBtn');
		    }
		}

		function updateDateInfo(inputDate, endDate) {
		    var startDate = new Date(inputDate);
		    var startDateStr = startDate.getFullYear() + '.' + 
		                       (startDate.getMonth() + 1).toString().padStart(2, '0') + '.' + 
		                       startDate.getDate().toString().padStart(2, '0');
		    var startDayOfWeek = ['일', '월', '화', '수', '목', '금', '토'][startDate.getDay()];
		    $('.date dt:contains("시작일") + dd .tahoma').text(startDateStr);
		    $('.date dt:contains("시작일") + dd').append('(' + startDayOfWeek + ')');

		    var endDateObj = new Date(endDate);
		    var endDateStr = endDateObj.getFullYear() + '.' + 
		                     (endDateObj.getMonth() + 1).toString().padStart(2, '0') + '.' + 
		                     endDateObj.getDate().toString().padStart(2, '0');
		    var endDayOfWeek = ['일', '월', '화', '수', '목', '금', '토'][endDateObj.getDay()];
		    $('.date dt:contains("마감일") + dd .tahoma').text(endDateStr);
		    $('.date dt:contains("마감일") + dd').append('(' + endDayOfWeek + ')');
		}

		let countdownTimer;
		$(window).on('unload', function() {
		    if (countdownTimer) {
		        clearInterval(countdownTimer);
		    }
		});
		
		function updateWelfare(welfareData) {
		    var $welfareContainer = $('.location .tbRow dl:first dd');
		    console.log("welfareData : ", welfareData);
		    $welfareContainer.find('dl').remove();

		    if (welfareData.length > 0) {
		        var firstItem = welfareData[0];
		        $welfareContainer.find('dl:first dt').text(firstItem.category);
		        $welfareContainer.find('dl:first dd').text(firstItem.content);
		    }

		    for (var i = 1; i < welfareData.length; i++) {
		        var item = welfareData[i];
		        var $newDl = $('<dl>');
		        $newDl.append('<dt>' + item.category + '</dt>');
		        $newDl.append('<dd>' + item.content + '</dd>');
		        $welfareContainer.append($newDl);
		    }

		}
	</script>
</head>
<body>
    <div id="__next" data-reactroot="">
		<jsp:include page="../assets/layout/user/header.jsp" />
		<main class="JobsFeed_Jobsfeed__DpeV9">  
			<section class="Section_Section__P1hhc">
			<!-- golgolz start -->
				<div id="wrap" style="margin-bottom: 30px; margin-top: 37px;">
					<section id="container" style="width:1100px;">
						<h2 class="tpl_hd_1" style="font-size: 36px; margin-top: 42px; font-weight: bold;">
							채용 공고 상세 보기
						</h2>
						<section class="secReadSummary">
							<h2 class="hd_2 blind">요약정보</h2>
							<div class="readSumWrap clear" style="width:1100px;">
								<article class="artReadJobSum" style="width:1100px;">
									<div class="sumTit">
										<h3 class="hd_3" style="width: 1060px;">
											<div class="header">
												<span class="coName"></span>
											</div>
										</h3>
									</div>
									<div class="tbRow clear">
										<div class="tbCol" style="font-size: 14px;">
											<h2 class="hd_2">지원자격</h2>
											<dl class="tbList">
												<dt>경력</dt>
												<dd>
													<strong class="col_1">신입·경력</strong>
												</dd>
												<dt>학력</dt>
												<dd>
													<strong class="col_1">학력무관</strong>
												</dd>
											</dl>
										</div>
										<div class="tbCol">
											<h2 class="hd_2">근무조건</h2>
											<dl class="tbList">
												<dt>고용형태</dt>
												<dd>
													<ul class="addList">
														<li>
															<strong class="col_1"></strong> 
														</li>
													</ul>
												</dd>
												<dt>급여</dt>
												<dd></dd>
												<dt>지역</dt>
												<dd></dd>
												<dt>시간</dt>
												<dd>
													<span class="tahoma"></span>
													<span class="tahoma"></span>
												</dd>
											</dl>
										</div>
										<div class="tbCol tbCoInfo">
											<h2 class="hd_2">기업정보</h2>
											<dl class="tbList">
												<dt>사원수</dt>
												<dd>
													<span class="tahoma">185</span>명
												</dd>
												<dt>설립년도</dt>
												<dd>
													<text> <span class="tahoma">1999</span>년 (<span
														class="tahoma">26</span>년차) </text>
												</dd>
												<dt>기업형태</dt>
												<dd>중견기업 (비상장)</dd>
											</dl>
											<div class="coBtn">
												<a
													href="https://www.jobkorea.co.kr/Recruit/Co_Read/C/487603?Oem_Code=C1"
													target="_blank" title="새창" class="girBtn girBtn_3"><span>기업정보</span></a>
												<a
													href="https://www.jobkorea.co.kr/Recruit/Co_Read/487603/CoRecruitLink"
													target="_blank" title="새창" class="girBtn girBtn_3"><span>진행중인
														채용보기</span></a>
											</div>
										</div>
									</div>
								</article>
							</div>
							<div class="sumBtn">
								<button type="button"
									class="girBtn tplBtn_1 tplBtnOrg girBtnOrg devOnlineApplyBtn"
									id="devApplyBtn1">
									<span>즉시지원</span>
								</button>
							</div>
						</section>
						<div id="detailArea" class="divDetailWrap">
							<!-- <div id="menuContainer" class="devTplTabBx">
								<div id="topMenu" class="tplTabBx readTabBx" style="width:1200px;">
									<ul class="tplTab clear">
										<li data-target="tab01" class="">
											<button type="button">
												<span>상세요강</span>
											</button>
										</li>
										<li data-target="tab02" class="">
											<button type="button">
												<span>접수기간/방법</span>
											</button>
										</li>
										<li data-target="tab04" class="">
											<button type="button">
												<span>기업정보</span>
											</button>
										</li>
									</ul>
								</div>
							</div> -->
							<section id="tab01" class="secReadDetail">
								<h2 class="hd_2">상세요강 정보</h2>
								<div class="divReadBx clear devMakeSameHeight">
									<article class="artReadDetail">
										<h3 class="hd_3 blind">상세요강 정보</h3>
										<!-- <iframe name="gib_frame" id="gib_frame" width="1200"
											scrolling="no" frameborder="0" marginheight="0"
											marginwidth="0" src="test.html" onload="ifrmNavi(this)"
											title="상세요강"></iframe> -->
										<div id="recruitContent" style="text-align: left; padding: 15px;"></div>
									</article>
								</div>
							</section>
							<section id="tab02" class="secReadApply">
								<h2 class="hd_2">접수기간/방법</h2>
								<div class="divReadBx clear devMakeSameHeight">
									<article class="artReadPeriod" style="height: 249px">
										<h3 class="hd_3 blind">접수기간</h3>
										<div>
											<dl class="time">
												<dt class="girIcn icnTime">남은시간</dt>
												<dd class="devRemainCount">
													<span class="tahoma"></span>
												</dd>
											</dl>
											<dl class="date">
												<dt>시작일</dt>
												<dd>
													<span class="tahoma"></span>
												</dd>
												<dt>마감일</dt>
												<dd>
													<span class="tahoma"></span>
												</dd>
											</dl>
										</div>
									</article>
									<article class="artReadHow" style="height: 249px">
										<h3 class="hd_3 blind">접수방법</h3>
										<div class="tbOline">
											<div class="btn">
												<button type="button"
													class="girBtn tplBtn_1 tplBtnOrg girBtnOrg devOnlineApplyBtn"
													id="devApplyBtn2">
													<span>즉시지원</span>
												</button>
											</div>
										</div>

										<!-- <div class="tbRow tbRsm tbCase">
											<dl>
												<dt>지원양식</dt>
												<dd class="devTplLyClick">
													<strong>구지직 이력서 양식</strong>
												</dd>
											</dl>
										</div>
										<div class="tbRow">
											<dl>
												<dt>모집분야</dt>
												<dd>
													<a href="https://www.jobkorea.co.kr/Recruit/GI_Read/44738554?rPageCode=AM&amp;logpath=21&amp;sn=6#Apply">CDU개발팀</a>
												</dd>
												<dt>모집인원</dt>
												<dd>
													<span class="tahoma">○</span>명
												</dd>
											</dl>
										</div> -->
									</article>
								</div>
								<p class="textEnd">마감일은 기업의 사정으로 인해 조기 마감 또는 변경될 수 있습니다.</p>
							</section>

							<!-- 통계 -->
							<!-- <section class="secReadStatistic">
								<h2 class="hd_2">지원자 현황 통계</h2>

								<article class="artReadStatistic divReadBx clear blur">
									<h3 class="hd_3 blind">지원자 현황 통계 정보</h3>

									<div class="metricsContainer">
										<div class="metrics metricsCount">
											<div class="header">지원자수</div>
											<div class="value">
												<em>47</em>명
											</div>
										</div>
										<div class="metrics metricsRate">
											<div class="header">모집인원</div>
											<div class="value">
												<em>0</em>명
											</div>
										</div>
									</div>
									<div class="chartContainer">
										<div class="chart chartCol_1 chartVertical">
											<h4 class="header">연령</h4>
											<ul>
												<li>
													<div class="label">
														<span class="tahoma">25</span>세이하
													</div>
													<div class="value">8</div>
													<div class="bar" aria-hidden="true">
														<div class="progress" style="width: 17%"></div>
													</div>
												</li>
												<li>
													<div class="label">
														<span class="tahoma">26</span>세~<span class="tahoma">30</span>세
													</div>
													<div class="value">19</div>
													<div class="bar" aria-hidden="true">
														<div class="progress" style="width: 40%"></div>
													</div>
												</li>
												<li>
													<div class="label">
														<span class="tahoma">31</span>세~<span class="tahoma">35</span>세
													</div>
													<div class="value">10</div>
													<div class="bar" aria-hidden="true">
														<div class="progress" style="width: 21%"></div>
													</div>
												</li>
												<li>
													<div class="label">
														<span class="tahoma">36</span>세~<span class="tahoma">40</span>세
													</div>
													<div class="value">4</div>
													<div class="bar" aria-hidden="true">
														<div class="progress" style="width: 9%"></div>
													</div>
												</li>
												<li>
													<div class="label">
														<span class="tahoma">41</span>세~<span class="tahoma">45</span>세
													</div>
													<div class="value">3</div>
													<div class="bar" aria-hidden="true">
														<div class="progress" style="width: 6%"></div>
													</div>
												</li>
												<li>
													<div class="label">
														<span class="tahoma">46</span>세이상
													</div>
													<div class="value">3</div>
													<div class="bar" aria-hidden="true">
														<div class="progress" style="width: 6%"></div>
													</div>
												</li>
											</ul>
										</div>
										<div class="chart chartCol_2 chartSex">
											<h4 class="header">성별</h4>
											<div class="content">
												<div class="item itemMan">
													<div class="label">남자</div>
													<div class="value">36</div>
													<div class="mask" aria-hidden="true"></div>
													<div class="progress" aria-hidden="true"
														style="height: 77%"></div>
												</div>
												<div class="item itemWoman">
													<div class="label">여자</div>
													<div class="value">11</div>
													<div class="mask" aria-hidden="true"></div>
													<div class="progress" aria-hidden="true"
														style="height: 23%"></div>
												</div>
											</div>
										</div>
										<div class="chart chartCol_3 chartVertical">
											<h4 class="header">학력</h4>
											<ul>
												<li>
													<div class="label">고졸미만</div>
													<div class="value">0</div>
													<div class="bar" aria-hidden="true">
														<div class="progress" style="width: 0%"></div>
													</div>
												</li>
												<li>
													<div class="label">고졸(예정)</div>
													<div class="value">11</div>
													<div class="bar" aria-hidden="true">
														<div class="progress" style="width: 23%"></div>
													</div>
												</li>
												<li>
													<div class="label">초대졸(예정)</div>
													<div class="value">12</div>
													<div class="bar" aria-hidden="true">
														<div class="progress" style="width: 26%"></div>
													</div>
												</li>
												<li>
													<div class="label">대졸(예정)</div>
													<div class="value">22</div>
													<div class="bar" aria-hidden="true">
														<div class="progress" style="width: 47%"></div>
													</div>
												</li>
												<li>
													<div class="label">석박사(예정)</div>
													<div class="value">2</div>
													<div class="bar" aria-hidden="true">
														<div class="progress" style="width: 4%"></div>
													</div>
												</li>
											</ul>
										</div>
									</div>
								</article>
								<p class="btnDetail blur">
									<a
										href="https://www.jobkorea.co.kr/Recruit/ApplyChart?giNo=47018175"
										class="girBtn girBtn_4" target="_blank"><span>지원현황
											상세보기</span></a>
								</p>
							</section>

							<section id="tab04" class="secReadCoInfo">
								<h2 class="hd_2">기업정보</h2>
								<article class="artReadCoInfo divReadBx">
									<h3 class="hd_3 blind">요약정보</h3>
									<div class="tbRow clear">
										<div class="tbCol coLogo">
											<p class="logo">
												<a
													href="https://www.jobkorea.co.kr/Recruit/Co_Read/C/487603?Oem_Code=C1"
													target="_blank" title="새창"><img
													src="./recruit_detail_files/2j9sp006Xo_jG6ql2m28o0cpVcRt_2po.jpg"
													id="cologo" name="cologo" alt="아르네코리아㈜"
													onload="go_logo_size(this, 180, 72);" width="180"
													height="72" /></a>
											</p>
										</div>
										<div class="tbCol coInfo">
											<h4 class="hd_4">아르네코리아㈜</h4>
											<p class="coBtn">
												<a
													href="https://www.jobkorea.co.kr/Recruit/Co_Read/C/487603?Oem_Code=C1"
													target="_blank" title="새창" class="girBtn girBtn_3"><span>기업정보</span></a>
											</p>
											<dl class="tbList">
												<dt>산업</dt>
												<dd>
													<text>산업용 냉장 및 냉동 장비 제조업</text>
												</dd>
												<dt>사원수</dt>
												<dd>
													<span class="tahoma">185</span>명
												</dd>
												<dt>설립</dt>
												<dd>
													<span class="tahoma">1999</span>년 (<span class="tahoma">26</span>년차)
												</dd>
												<dt>기업형태</dt>
												<dd>중견기업 (비상장)</dd>
												<dt>매출액</dt>
												<dd>1,380억 3,974만원</dd>
											</dl>
										</div>
									</div>
								</article>

								<article class="artReadStrategy"></article>
							</section> -->

							<section class="secReadWork" id="secReadWork">
								<h2 class="hd_2">근무환경</h2>
								<article class="artReadWork divReadBx">
									<div class="location">
										<div class="tbRow">
											<dl>
												<dt>복리후생</dt>
												<dd>
													<dl>
														<dt></dt>
														<dd></dd>
													</dl>
													<dl>
														<dt>편의·여가·건강</dt>
														<dd>사내 동호회, 출퇴근 셔틀버스, 건강검진, 점심 식사 지원, 저녁 식사 지원, 아침 식사
															지원, 휴양시설, 식사 지원</dd>
													</dl>
													<dl>
														<dt>기타</dt>
														<dd>단체보험, 차량유지비수당</dd>
													</dl>
												</dd>
											</dl>
										</div>
									</div>
								</article>
							</section>
						</div>
					</section>
				</div>
				<!-- golgolz end -->
			</section>
			<jsp:include page="../assets/layout/user/footer.jsp" />  
		</main>
	</div>
</body>
</html>
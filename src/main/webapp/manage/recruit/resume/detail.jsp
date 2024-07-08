<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" info=""%>
<!DOCTYPE html>
<html>
<head>
<jsp:include page="../../../assets/layout/admin/lib.jsp" />
<!-- golgolz start -->
<link href="https://doberman-ready-termite.ngrok-free.app/recruit-app/assets/css/manage/goods/general.css" rel="stylesheet" />
<link href="https://doberman-ready-termite.ngrok-free.app/recruit-app/assets/css/manage/goods/goods.css" rel="stylesheet" />
<link href="https://doberman-ready-termite.ngrok-free.app/recruit-app/assets/css/manage/goods/default.css" rel="stylesheet" />
<script type="text/javascript">
	$(function(){
    	$("#recruit_menu").addClass("bg-gradient-primary");
	});
</script>
<link href="https://doberman-ready-termite.ngrok-free.app/recruit-app/assets/css/manage/resume/detail.css" rel="stylesheet" />
<!-- golgolz end -->
</head>
<body>
	<jsp:include page="../../../assets/layout/admin/header.jsp" />
	<main
		class="main-content position-relative max-height-vh-100 h-100 border-radius-lg ps--active-y">
		<nav
			class="navbar navbar-main navbar-expand-lg px-0 mx-4 shadow-none border-radius-xl"
			id="navbarBlur" data-scroll="true" style="position:fixed; background-color: #FFFFFF; width:100%">
			<div class="container-fluid py-1 px-3">
				<div style="display:flex;">
					<nav aria-label="breadcrumb">
						<ol
							class="breadcrumb bg-transparent mb-0 pb-0 pt-1 px-0 me-sm-6 me-5">
							<li class="breadcrumb-item text-sm"><a
								class="opacity-5 text-dark" href="javascript:;">
								관리자 기능</a></li>
							<!-- 하단의 대시보드 텍스트를 본인 기능으로 변경 필요  -->
							<li class="breadcrumb-item text-sm text-dark active"
								aria-current="page">지원 현황 관리</li>
						</ol>
						<h6 class="font-weight-bolder mb-0">지원자 이력서 상세보기</h6>
						<div id="status">
							<div>공고명 : 24년 상반기 백엔드 엔지니어</div>
							<div>지원 현황 : 서류 진행중</div>
						</div>
					</nav>
					<div id="results">
						서류 합격 여부 : <span style="font-weight: bold;">불합격</span><br>
						면접 합격 여부 : <span style="font-weight: bold;">해당없음</span><br>
					</div>
					<div id="resumeBtnContainer">
						<input type="button" value="서류합격처리" class="btn btn-outline-success btn-sm goRegist resumeBtns" />
						<input type="button" value="불합격처리" class="btn btn-outline-danger btn-sm resumeBtns" />
					</div>
				</div>
			</div>
		</nav>
		<!-- golgolz start -->
		<div class="container-fluid py-4" id="container">
			<!-- golgolz start -->
			<div id="contentcolumn" class="">
				<div class="contents" style="margin-top: 125px;">
					<form id="dataForm" name="dataForm" action="https://doberman-ready-termite.ngrok-free.app/recruit-app/manage/common_process.jsp" method="post" enctype="multipart/form-data">
						<div class="subtitle">
							<img
								src="https://doberman-ready-termite.ngrok-free.app/recruit-app/assets/images/manage/common/bul_subtitle.gif" />
							인적사항
						</div>
						<table class="tbstyleB" width="100%">
							<colgroup>
								<col width="15%" />
								<col width="85%" />
							</colgroup>
							<tbody>
								<tr>
									<td></td>
								</tr>
								<tr>
									<td class="label">이름</td>
									<td class="box text">
										<!-- <input type="hidden" name="code" value="" />
										<input type="text" name="name" value="" size="50" class="inputbox naver_shopping_prodName" /> -->
										<span>우미연</span>
									</td>
									<td rowspan="4">
										<img src="https://doberman-ready-termite.ngrok-free.app/recruit-app/assets/images/default.png" />
									</td>
								</tr>
								<tr>
									<td class="label">생년월일</td>
									<td class="box text">
										<!-- <input type="hidden" name="code" value="" />
										<input type="text" name="name" value="" size="50" class="inputbox naver_shopping_prodName" /> -->
										<span>1996-08-21(만 27세)</span>
									</td>
								</tr>
								<tr>
									<td class="label">성별</td>
									<td class="box text">
										<label>
											<input type="radio" id="good_code_type1" name="maker" value="1" checked/> 여자
										</label>
										<label>
											<input type="radio" id="good_code_type0" name="maker" value="0" /> 남자
										</label> 
									</td>
								</tr>
								<tr>
									<td class="label">이메일</td>
									<td class="box text">
										<!-- <input type="hidden" name="code" value="" />
										<input type="text" name="name" value="" size="50" class="inputbox naver_shopping_prodName" /> -->
										yeon.dev.8@gmail.com
									</td>
								</tr>
								<tr>
									<td class="label">전화번호</td>
									<td class="box text" colspan="2">
										<!-- <input type="hidden" name="code" value="" />
										<input type="text" name="name" value="" size="50" class="inputbox naver_shopping_prodName" /> -->
										010-8282-8282
									</td>
								</tr>
								<tr>
									<td class="label">휴대폰번호</td>
									<td class="box text" colspan="2">
										<!-- <input type="hidden" name="code" value="" />
										<input type="text" name="name" value="" size="50" class="inputbox naver_shopping_prodName" /> -->
										010-8282-8282
									</td>
								</tr>
								<tr>
									<td class="label">주소</td>
									<td class="box text" colspan="2">
										<!-- <input type="hidden" name="code" value="" />
										<input type="text" name="name" value="" size="50" class="inputbox naver_shopping_prodName" /> -->
										서울시 노원구
									</td>
								</tr>
							</tbody>
						</table>
						<div class="subtitle">
							<img
								src="https://doberman-ready-termite.ngrok-free.app/recruit-app/assets/images/manage/common/bul_subtitle.gif" />
							스킬
						</div>
						<table cellpadding="0" cellspacing="1" border="0" class="tbstyleB"
							width="100%">
							<colgroup>
								<col width="15%" />
								<col width="85%" />
							</colgroup>
							<tbody>
								<tr>
									<span style="font-size:16px;">
										<strong>Java, JSP, Oracle DB</strong>
									</span>
								</tr>
							</tbody>
						</table>
						<div class="subtitle">
							<img
								src="https://doberman-ready-termite.ngrok-free.app/recruit-app/assets/images/manage/common/bul_subtitle.gif" />
							학력
						</div>
						<table id="school_table" class="table table-striped table-bordered horizontal_arrange" width="100%">
							<thead class="thead-dark">
								<tr>
									<th>학교구분</th>
									<th>학교명</th>
									<th>입학년월</th>
									<th>졸업년월</th>
									<th>졸업상태</th>
									<th>전공명</th>
									<th>학점</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td>대학교</td>
									<td>가나다대학교</td>
									<td>2020.03</td>
									<td>2024.02</td>
									<td>졸업</td>
									<td>컴퓨터공학</td>
									<td>4.2(4.5)</td>
								</tr>
								<tr>
									<td>대학교</td>
									<td>가나다대학교</td>
									<td>2020.03</td>
									<td>2024.02</td>
									<td>졸업</td>
									<td>컴퓨터공학</td>
									<td>4.2(4.5)</td>
								</tr>
							</tbody>
						</table>
						<div class="subtitle">
							<img
								src="https://doberman-ready-termite.ngrok-free.app/recruit-app/assets/images/manage/common/bul_subtitle.gif" />
							경력
						</div>
						<table id="school_table" class="table table-striped table-bordered horizontal_arrange" width="100%">
							<thead class="thead-dark">
								<tr>
									<th>기업명</th>
									<th>입사년월</th>
									<th>퇴사년월</th>
									<th>포지션</th>
									<th>연봉</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td>가나다 주식회사</td>
									<td>2022.03</td>
									<td>2024.02</td>
									<td>백엔드 엔지니어</td>
									<td>6,000만원</td>
								</tr>
								<tr>
									<td>라마바 주식회사</td>
									<td>2020.03</td>
									<td>2022.02</td>
									<td>백엔드 엔지니어</td>
									<td>3,000만원</td>
								</tr>
							</tbody>
						</table>
						<div class="subtitle">
							<img
								src="https://doberman-ready-termite.ngrok-free.app/recruit-app/assets/images/manage/common/bul_subtitle.gif" />
							자격증
						</div>
						<table id="certification_table" class="table table-striped table-bordered horizontal_arrange">
							<thead class="thead-dark">
								<tr>
									<th>자격증 명</th>
									<th>발행처</th>
									<th>취득일</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td>SQLD</td>
									<td>한국데이터산업진흥원</td>
									<td>2020.03</td>
								</tr>
							</tbody>
						</table>
						<div class="subtitle">
							<img
								src="https://doberman-ready-termite.ngrok-free.app/recruit-app/assets/images/manage/common/bul_subtitle.gif" />
							어학
						</div>
						<table id="certification_table" class="table table-striped table-bordered horizontal_arrange">
							<thead class="thead-dark">
								<tr>
									<th>어학 시험명</th>
									<th>발행처</th>
									<th>등급(점수)</th>
									<th>취득일</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td>토익</td>
									<td>YBM</td>
									<td>300</td>
									<td>2020.03</td>
								</tr>
								<tr>
									<td>Opic</td>
									<td>YBM</td>
									<td>NH</td>
									<td>2020.03</td>
								</tr>
							</tbody>
						</table>
						<div class="subtitle">
							<img
								src="https://doberman-ready-termite.ngrok-free.app/recruit-app/assets/images/manage/common/bul_subtitle.gif" />
							자기소개서
						</div>
						<p id="introduceContent">열정맨 우미연입니다.</p>
						<div class="alignCenter">
							<input type="button" id="btn-back" class="btn btn-outline-dark btn-sm detail-control" value="뒤로" onClick="javascript:history.back();"/>
						</div>
					</form>
				</div>
			</div>
			<!-- golgolz end -->
		</div>
		<!-- golgolz end -->
	</main>
</body>
</html>
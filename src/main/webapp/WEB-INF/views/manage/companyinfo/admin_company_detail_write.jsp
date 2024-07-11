<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" info=""%>
<!DOCTYPE html>
<html>
<head>
<jsp:include page="../../assets/layout/admin/lib.jsp" />
<!-- golgolz start -->
<link href="http://localhost/recruit-app/assets/css/manage/goods/general.css" rel="stylesheet" />
<link href="http://localhost/recruit-app/assets/css/manage/goods/goods.css" rel="stylesheet" />
<link href="http://localhost/recruit-app/assets/css/manage/goods/default.css" rel="stylesheet" />
<script type="text/javascript">
	$(function(){
		$("#company_menu").addClass("bg-gradient-primary");
	
	});
		function addInfo(){
	        $("#dataForm").submit();
	    	alert("기업이 등록되었습니다.")
		}
</script>
<style>
.subtitle{
	padding: 0px;
	margin-top: 20px;
}

#dataForm div:first-child{
	margin-top: 0px;
}

.container-fluid py-4 {
	padding-top: 0px;!important
}

.detail-control {
	font-size: 15px;
	margin-right: 2px;
}

#benefits li{
	font-size: 15px;
	height: 30px;
	list-style-type: decimal;
	list-style-position: inside;
	display: flex;
    align-items: center; /* 세로 중앙 정렬 */
}

#benefits li:hover{
	background-color: #DDD;
}
#companyIntro{
	border:1px solid #dedede;
}
input{
	background-color: white !important;
}
</style>
<!-- golgolz end -->
</head>
<body>
	<jsp:include page="../../assets/layout/admin/header.jsp" />
	<main
		class="main-content position-relative max-height-vh-100 h-100 border-radius-lg ps--active-y" style="height: 100%; overflow-y: scroll">
		<nav
			class="navbar navbar-main navbar-expand-lg px-0 mx-4 shadow-none border-radius-xl"
			id="navbarBlur" data-scroll="true">
			<div class="container-fluid py-1 px-3">
				<nav aria-label="breadcrumb">
					<ol
						class="breadcrumb bg-transparent mb-0 pb-0 pt-1 px-0 me-sm-6 me-5">
						<li class="breadcrumb-item text-sm"><a
							class="opacity-5 text-dark" href="javascript:;">
							관리자 기능</a></li>
						<!-- 하단의 대시보드 텍스트를 본인 기능으로 변경 필요  -->
						<li class="breadcrumb-item text-sm text-dark active"
							aria-current="page">기업 관리</li>
					</ol>
					<h6 class="font-weight-bolder mb-0">기업 상세 정보</h6>
				</nav>
			</div>
		</nav>
		<div class="container-fluid py-4">
			<!-- golgolz start -->
			<div id="contentcolumn" class="">
				<div class="contents">
					<form id="dataForm" name="dataForm" action="http://localhost/recruit-app/manage/companyinfo/addCompanyinfoWrite.do" method="post" enctype="multipart/form-data">
						<div class="subtitle">
							<img src="http://localhost/recruit-app/assets/images/manage/common/bul_subtitle.gif" />
							기업정보
						</div>
						<table class="tbstyleB" width="100%">
							<colgroup>
								<col width="15%" />
								<col width="85%" />
							</colgroup>
							<tbody>
								<tr>
									<td class="label">기업명</td>
									<td class="box text">
										<input type="text" name="companyName" value="" size="20" class="inputbox naver_shopping_prodName" />
									</td>
								</tr>
								<tr>
									<td class="label">사업자등록번호</td>
									<td class="box text">
										<input type="text" name="businessNumber" value="" size="20" class="inputbox naver_shopping_prodName" /> 입력 예시) 123-45-67890
									</td>
								</tr>
								<tr>
									<td class="label">사원수(명)</td>
									<td class="box text">
										<input type="text" name="headcount" value="" size="13" class="inputbox naver_shopping_prodName" /> 명
									</td>
								</tr>
								<tr>
									<td class="label">설립일</td>
									<td class="box text">
										<input type="text" name="establishmentDate" value="" size="13" class="inputbox naver_shopping_prodName" />
									</td>
								</tr>
								<tr>
									<td class="label">매출액(억)</td>
									<td class="box text">
										<input type="text" name="revenue" value="" size="13" class="inputbox naver_shopping_prodName" /> 억
									</td>
								</tr>
								<tr>
									<td class="label">평균연봉(만원)</td>
									<td class="box text">
										<input type="text" name="avgSal" value="" size="13" class="inputbox naver_shopping_prodName" /> 만원
									</td>
								</tr>
								<tr>
									<td class="label">주소</td>
									<td class="box text">
										<input type="text" name="addr" value="" size="20" class="inputbox naver_shopping_prodName" />
									</td>
								</tr>
								<tr>
									<td class="label">기업구분</td>
									<td class="box text">
										<input type="text" name="companyClassification" value="" size="20" class="inputbox naver_shopping_prodName" />
									</td>
								</tr>
								<tr>
									<td class="label">대표자</td>
									<td class="box text">
										<input type="text" name="ceoName" value="" size="20" class="inputbox naver_shopping_prodName" />
									</td>
								</tr>
								<tr>
									<td class="label">기업소개</td>
									<td class="box text">
										<textarea id="companyIntro" name="description" rows="7" cols="90"></textarea>
										<!-- <input type="text" name="name" value="" size="13" class="inputbox naver_shopping_prodName" /> -->
									</td>
								</tr>
							</tbody>
						</table>
						<!--이미지등록-->
						<div class="subtitle">
							<img src="http://localhost/recruit-app/assets/images/manage/common/bul_subtitle.gif" />
							기업 로고 이미지
						</div>
						<div id="area_file" style="display: block">
							<table id="good_file_input_area" cellpadding="0" cellspacing="1"
								border="0" class="tbstyleB" width="100%">
								<colgroup>
									<col width="15%" />
									<col width="85%" />
								</colgroup>
								<tbody>
									<tr>
										<td colspan="2" class="top2"></td>
									</tr>

									<tr>
										<td class="label">기본 이미지</td>
										<td class="box text">
											<div id="good_file_big_input_area">
												<input type="hidden" name="defaultImageOrigin" value="" />
												<input type="file" name="logo" style="width: 300px" />
											</div>
										</td>
									</tr>
								</tbody>
							</table>
						</div>
						<!--이미지등록-->
						<div class="subtitle">
							<img src="http://localhost/recruit-app/assets/images/manage/common/bul_subtitle.gif" />
							기업 프로필 대표 이미지
						</div>

						<div id="area_file" style="display: block">
							<table id="good_file_input_area" cellpadding="0" cellspacing="1"
								border="0" class="tbstyleB" width="100%">
								<colgroup>
									<col width="15%" />
									<col width="85%" />
								</colgroup>
								<tbody>
									<tr>
										<td colspan="2" class="top2"></td>
									</tr>
									<tr>
										<td class="label">기본 이미지</td>
										<td class="box text">
											<div id="good_file_big_input_area">
												<input type="hidden" name="defaultImageOrigin" value="" />
												<input type="file" name="companyImg" style="width: 300px" />
											</div>
										</td>
									</tr>
								</tbody>
							</table>
						</div>
						<!-- <div class="subtitle">
							<img src="http://localhost/recruit-app/assets/images/manage/common/bul_subtitle.gif" />
							연혁
						</div>
						<table class="tbstyleB" width="100%">
							<colgroup>
								<col width="15%" />
								<col width="10%" />
								<col width="70%" />
							</colgroup>
							<tbody>
								<tr>
									<td class="label" rowspan="3">연혁</td>
									<td class="box text">
										년월
									</td>
									<td class="box text">
										<input type="text" name="name" value="" size="30" class="inputbox naver_shopping_prodName" />
									</td>
								</tr>
								<tr>
									<td class="box text">
										내용
									</td>
									<td class="box text">
										<input type="text" name="name" value="" size="50" class="inputbox naver_shopping_prodName" />
										<input type="button" id="btn-register" class="btn btn-outline-success btn-sm" value="추가" />
										<input type="button" id="btn-register" class="btn btn-outline-danger btn-sm" value="삭제" />
									</td>
								</tr>
								<tr>
									<td class="box text" colspan="2">
										<ol id="benefits">
											<li><strong>2024.05 </strong> : 공기청정기 설치</li>
											<li><strong>2020.09 </strong> : k-디지털 트레이닝 사업 등록</li>
											<li><strong>2016.03 </strong> : 쌍용교육센터 설립</li>
										</ol>
									</td>
								</tr>
							</tbody>
						</table>
						<div class="subtitle">
							<img src="http://localhost/recruit-app/assets/images/manage/common/bul_subtitle.gif" />
							복리후생
						</div>
						<table class="tbstyleB" width="100%">
							<colgroup>
								<col width="15%" />
								<col width="10%" />
								<col width="70%" />
							</colgroup>
							<tbody>
								<tr>
									<td class="label" rowspan="3">복리후생</td>
									<td class="box text">
										카테고리
									</td>
									<td class="box text">
										<input type="text" name="name" value="" size="30" class="inputbox naver_shopping_prodName" />
									</td>
								</tr>
								<tr>
									<td class="box text">
										내용
									</td>
									<td class="box text">
										<input type="text" name="name" value="" size="50" class="inputbox naver_shopping_prodName" />
										<input type="button" id="btn-register" class="btn btn-outline-success btn-sm" value="추가" />
										<input type="button" id="btn-register" class="btn btn-outline-danger btn-sm" value="삭제" />
									</td>
								</tr>
								<tr>
									<td class="box text" colspan="2">
										<ol id="benefits">
											<li><strong>연금/보험 </strong> : 국민연금, 고용보함, 산재보험, 건강보험</li>
											<li><strong>휴무/휴가/행사</strong> : 연차제도, 월차제도, 경조휴가, 반차제도, 리프레시휴가</li>
											<li><strong>보상/수당/지원</strong> : 퇴직금, 인센티브, 야간근로수당, 연장근로수당</li>
											<li><strong>사내제도/성장</strong> : 님/닉네임 호칭, 수평적 문화, 유연근무제, 주40시간</li>
											<li><strong>사내시설</strong> : 휴식공간, 헬스시설</li>
											<li><strong>편의/여가/건강</strong> : 음료 및 간식제공</li>
										</ol>
									</td>
								</tr>
							</tbody>
						</table> -->
						<div class="alignCenter">
							<% if(request.getParameter("code") == null){ %>
								<input type="button" id="btn-register" class="btn btn-outline-success btn-sm detail-control" value="등록하기" onclick="addInfo()"/>
							<% } else { %>
								<input type="button" id="btn-update" class="btn btn-outline-warning btn-sm detail-control" value="수정하기" />
								<input type="button" id="btn-delete" class="btn btn-outline-danger btn-sm detail-control" value="삭제하기" />
							<% } %>
								<input type="button" id="btn-back" class="btn btn-outline-dark btn-sm detail-control" value="뒤로" onClick="javascript:history.back();"/>
						</div>
					</form>
				</div>
			</div>
			<!-- golgolz end -->
		</div>
	</main>
		<script type="text/javascript">
	$(function(){
	    
	});
	</script>
</body>
</html>
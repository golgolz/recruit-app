<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" info=""%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
	function updateInfo(){
    	alert("기업정보가 수정되었습니다.")
        $("#dataForm").submit();
    	
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
				<c:if test="${not empty requestScope.companyDetail}">
                    <c:set var="companyIntroDetail" value="${requestScope.companyDetail[0]}" />
                </c:if>
					<form id="dataForm" name="dataForm" action="http://localhost/recruit-app/companyinfo/updateCompanyinfo.do" method="post" enctype="multipart/form-data">
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
										<input type="text" name="companyName" value="<c:out value="${companyIntroDetail.companyName}" />" size="20" class="inputbox naver_shopping_prodName" />
									</td>
								</tr>
								<tr>
									<td class="label">사업자등록번호</td>
									<td class="box text">
										<input type="text" name="businessNumber" value="<c:out value="${companyIntroDetail.businessNumber}" />" size="20" class="inputbox naver_shopping_prodName" />
									</td>
								</tr>
								<tr>
									<td class="label">사원수(명)</td>
									<td class="box text">
										<input type="text" name="headcount" value="<c:out value="${companyIntroDetail.headcount}" />" size="13" class="inputbox naver_shopping_prodName" /> 명
									</td>
								</tr>
								<tr>
									<td class="label">설립일</td>
									<td class="box text">
										<input type="text" name="establishmentDate" value="<c:out value="${companyIntroDetail.establishmentDate}" />" size="13" class="inputbox naver_shopping_prodName" />
									</td>
								</tr>
								<tr>
									<td class="label">매출액(억)</td>
									<td class="box text">
										<input type="text" name="revenue" value="<c:out value="${companyIntroDetail.revenue}" />" size="13" class="inputbox naver_shopping_prodName" /> 억
									</td>
								</tr>
								<tr>
									<td class="label">평균연봉(만원)</td>
									<td class="box text">
										<input type="text" name="avgSal" value="<c:out value="${companyIntroDetail.avgSal}" />" size="13" class="inputbox naver_shopping_prodName" /> 만원
									</td>
								</tr>
								<tr>
									<td class="label">주소</td>
									<td class="box text">
										<input type="text" name="addr" value="<c:out value="${companyIntroDetail.addr}" />" size="20" class="inputbox naver_shopping_prodName" />
									</td>
								</tr>
								<tr>
									<td class="label">기업구분</td>
									<td class="box text">
										<input type="text" name="companyClassification" value="<c:out value="${companyIntroDetail.companyClassification}" />" size="20" class="inputbox naver_shopping_prodName" />
									</td>
								</tr>
								<tr>
									<td class="label">대표자</td>
									<td class="box text">
										<input type="text" name="ceoName" value="<c:out value="${companyIntroDetail.ceoName}" />" size="20" class="inputbox naver_shopping_prodName" />
									</td>
								</tr>
								<tr>
									<td class="label">기업소개</td>
									<td class="box text">
										<textarea id="companyIntro" name="description" rows="7" cols="90"><c:out value="${companyIntroDetail.description}" /></textarea>
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
												<input type="file" name="logo" style="width: 300px" />
												<input type="text" name="existLogo" value="<c:out value="${companyIntroDetail.logo}" />" />
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
												<input type="file" name="companyImg" style="width: 300px" />
												<input type="text" name="existImg" value="<c:out value="${companyIntroDetail.companyImg}" />" />
											</div>
										</td>
									</tr>
								</tbody>
							</table>
						</div>
						<div class="alignCenter">
							<% if(request.getParameter("code") == null){ %>
								<input type="button" id="btn-register" class="btn btn-outline-warning btn-sm detail-control" value="수정하기" onclick="updateInfo()"/>
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
</body>
</html>
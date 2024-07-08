<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" info=""%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<jsp:include page="../assets/layout/admin/lib.jsp" />
<!-- golgolz start -->
<link href="http://localhost/recruit-app/assets/css/manage/goods/general.css" rel="stylesheet" />
<link href="http://localhost/recruit-app/assets/css/manage/goods/goods.css" rel="stylesheet" />
<link href="http://localhost/recruit-app/assets/css/manage/goods/default.css" rel="stylesheet" />
<script type="text/javascript">
	$(function(){
		$("#company_menu").addClass("bg-gradient-primary");
	});
	
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
	<jsp:include page="../assets/layout/admin/header.jsp" />
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
					<h6 class="font-weight-bolder mb-0">연혁/복리후생</h6>
				</nav>
			</div>
		</nav>
		<div class="container-fluid py-4">
			<!-- golgolz start -->
			<div id="contentcolumn" class="">
				<form id="frmDeleteHistory" action="http://localhost/recruit-app/companyinfo/deleteHistory.do" method="post">
				<input type="hidden" id="history" value="history" name="hidHistory"/>
				<input type="hidden" id="companyCode" name="companyCode" value="${companyIntroDetail.companyCode}"/>
				</form>
				<form id="frmDeleteWelfare" action="http://localhost/recruit-app/companyinfo/deleteWelfare.do" method="post">
				<input type="hidden" id="welfare" value="" name="hidWelfare"/>
				</form>
				<div class="contents">
				<c:if test="${not empty requestScope.companyDetail}">
                    <c:set var="companyIntroDetail" value="${requestScope.companyDetail[0]}" />
                </c:if>
					<form id="dataForm" name="dataForm" action="" method="post" enctype="multipart/form-data">
						<div class="subtitle" style="font-size:20px; margin-bottom: 50px">
							<img src="http://localhost/recruit-app/assets/images/company/logo/<c:out value="${ companyIntroDetail.logo }"/>" style="height:50px; width:auto; margin-right:10px"/>
							<strong><c:out value="${companyIntroDetail.companyName}"/></strong>
						</div>
						<div class="subtitle">
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
										날짜
									</td>
									<td class="box text">
										<input type="text" id="historyDate" name="historyDate" value="" size="30" class="inputbox naver_shopping_prodName" />
									</td>
								</tr>
								<tr>
									<td class="box text">
										내용
									</td>
									<td class="box text">
										<input type="text" id="historyContent" name="historyContent" value="" size="50" class="inputbox naver_shopping_prodName" />
										<input type="button" id="btn-register" class="btn btn-outline-success btn-sm" value="추가" />
										<input type="button" id="historyDelete" class="btn btn-outline-danger btn-sm" value="삭제" />
									</td>
								</tr>
								<tr>
									<td class="box text" colspan="2">
										<ol id="benefits">
										<c:forEach var="history" items="${ requestScope.history }" varStatus="i">
											<li onclick="fillHistory('${history.baseDate}', '${history.historyContent}')">
											<strong><c:out value="${history.baseDate}" /> </strong> : <c:out value="${history.historyContent}" /></li>
										</c:forEach>
										</ol>
									</td>
								</tr>
							</tbody>
						</table>
						</form>
						<form id="" name="" action="" method="post">
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
										<input type="text" id="welfareCategory" name="welfareCategory" value="" size="30" class="inputbox naver_shopping_prodName" />
									</td>
								</tr>
								<tr>
									<td class="box text">
										내용
									</td>
									<td class="box text">
										<input type="text" id="welfareContent" name="welfareContent" value="" size="50" class="inputbox naver_shopping_prodName" />
										<input type="button" id="btn-register" class="btn btn-outline-success btn-sm" value="추가" />
										<input type="button" id="welfareDelete" class="btn btn-outline-danger btn-sm" value="삭제" />
									</td>
								</tr>
								<tr>
									<td class="box text" colspan="2">
										<ol id="benefits">
											<c:forEach var="welfare" items="${ requestScope.welfare }" varStatus="i">
											<li onclick="fillWelfare('${welfare.category}', '${welfare.welfareContent}')">
											<strong><c:out value="${welfare.category}" /> </strong> : <c:out value="${welfare.welfareContent}" /></li>
											</c:forEach>
										</ol>
									</td>
								</tr>
							</tbody>
						</table>
					</form>
						<div class="alignCenter">
							<% if(request.getParameter("code") == null){ %>
								<input type="button" id="btn-register" class="btn btn-outline-dark btn-sm detail-control" value="뒤로" onClick="javascript:history.back();"/>
							<% } else { %>
								<input type="button" id="btn-update" class="btn btn-outline-warning btn-sm detail-control" value="수정하기" />
								<input type="button" id="btn-delete" class="btn btn-outline-danger btn-sm detail-control" value="삭제하기" />
							<% } %>
								<!-- <input type="button" id="btn-back" class="btn btn-outline-dark btn-sm detail-control" value="뒤로" onClick="javascript:history.back();"/> -->
						</div>
				</div>
			</div>
			<!-- golgolz end -->
		</div>
	</main>
	<script type="text/javascript">
    $(function(){
        $("#btn-register").click(function(){
            $("#dataForm").submit();
        });
        $("#historyDelete").click(function(){
            $("#frmDeleteHistory").submit();
        });
        $("#welfareDelete").click(function(){
            $("#frmDeleteWelfare").submit();
        });
    });

    function fillHistory(baseDate, historyContent) {
        $('#historyDate').val(baseDate);
        $('#historyContent').val(historyContent);
        $('#history').val(baseDate);
    }
    function fillWelfare(category, welfareContent) {
        $('#welfareCategory').val(category);
        $('#welfareContent').val(welfareContent);
        $('#welfare').val(category);
    }
    
</script>
</body>
</html>
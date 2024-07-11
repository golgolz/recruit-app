<%@page import="kr.co.sist.admin.domain.user.UserQnaDomain"%>
<%@page import="kr.co.sist.admin.domain.user.UserApplyDomain"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" info=""%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<script src="https://code.jquery.com/jquery-3.7.1.js"></script>
<script src="https://code.jquery.com/ui/1.13.3/jquery-ui.js"></script>
<script type="text/javascript">
	$(function(){
		$("#user_menu").addClass("bg-gradient-primary");
		
	});
</script>
<!-- golgolz start -->
<link href="http://localhost//recruit-app/assets/css/pagenation.css" rel="stylesheet" />
<link href="http://localhost//recruit-app/assets/css/manage/order/admin.css" rel="stylesheet" />
<link href="http://localhost//recruit-app/assets/css/manage/order/reset.css" rel="stylesheet" />
<link href="http://localhost/recruit-app/assets/css/manage/goods/general.css" rel="stylesheet" />
<link href="http://localhost/recruit-app/assets/css/manage/goods/goods.css" rel="stylesheet" />
<link href="http://localhost/recruit-app/assets/css/manage/goods/default.css" rel="stylesheet" />
<jsp:include page="../../assets/layout/admin/lib.jsp" />
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
.masked-data .original-data { display: none; }
.masked-data:hover .original-data, .masked-data .reveal-button:active + .original-data { display: inline; }
.masked-data:hover .masked-data-display, .masked-data .reveal-button:active + .masked-data-display { display: none; }
</style>
<script type="text/javascript">
	$(function(){
		
		function applyMasking(elementId, dataType) {
		    const $dataElement = $('#' + elementId);
		    const originalData = $dataElement.text();
		    const maskedData = maskData(originalData, dataType);

		    $dataElement.empty().append(
		      $('<span>')
		        .addClass('masked-data')
		        .attr('data-original', originalData)
		        .attr('data-type', dataType)
		        .text(maskedData)
		    ).append(
		      $('<button>')
		        .addClass('masking-button')
		        .text('👁️‍🗨️')
		        .attr('type', 'button') 
		        .click(function() {
		          toggleMasking(this);
		        })
		    );
		  }

		  function toggleMasking(button) {
		    var $maskedData = $(button).siblings('.masked-data');
		    var originalData = $maskedData.attr('data-original');
		    var dataType = $maskedData.attr('data-type');
		    var currentData = $maskedData.text();

		    if (currentData === maskData(originalData, dataType)) {
		      $maskedData.text(originalData);
		    } else {
		      $maskedData.text(maskData(originalData, dataType));
		    }
		  }

		  applyMasking('nameData', 'name');
		  applyMasking('userIdData', 'email'); 
		  applyMasking('phoneData', 'phone');
		  applyMasking('telData', 'tel'); 
		
		function maskString(str, startLen = 2, endLen = 2) {
            if (!str) return '';
            const length = str.length;
            const maskLen = Math.max(0, length - startLen - endLen); 
            return str.substring(0, startLen) + '*'.repeat(maskLen) + str.substring(length - endLen);
          }//function
          
          function maskData(data, type) {
          	  if (!data) return '';

          	  switch (type) {
          	    case 'email':
          	      return maskString(data, 2, 2);
          	    case 'name':
          	      return maskString(data, 1, 1);
          	    case 'phone':
          	      const matchPhone = data.match(/^(\d{3})-(\d{4})-(\d{4})$/);
          	      if (matchPhone) {
          	        return maskString(data, 4, 5); 
          	      } else {
          	        return maskString(data, 4, 5); 
          	      }
          	    case 'tel':
          	      const matchTel = data.match(/^(\d{2})-(\d{3})-(\d{4})$/);
          	      if (matchTel) {
          	        return maskString(data, 3, 5); 
          	      } else {
          	        return maskString(data, 4, 5); 
          	      }
          	    default:
          	      return data; 
          	  }
          	}//function
		
	});//ready
</script>
<!-- golgolz end -->
</head>
<body>
	<jsp:include page="../../assets/layout/admin/header.jsp" />
	<main
		class="main-content position-relative max-height-vh-100 h-100 border-radius-lg ps--active-y">
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
							aria-current="page">사용자 관리</li>
					</ol>
					<h6 class="font-weight-bolder mb-0">회원정보 상세</h6>
				</nav>
				<p style="font-size: 15px; text-align: right;">
							<strong>최근 로그인 일시: 
								<c:if test="${ detailInfo.recentloginDate == null }">
									오래 전
								</c:if>
								<c:if test="${ detailInfo.recentloginDate != null }">
									${ detailInfo.recentloginDate }
								</c:if>
							</strong>
							</p>
			</div>
		</nav>
		<div class="container-fluid py-4">
			<!-- golgolz start -->
			<div id="contentcolumn" class="">
				<div class="contents">
					<form id="dataForm" name="dataForm" action="http://localhost/online-shop/manage/goods/register_process.jsp" method="post" enctype="multipart/form-data">
						<div class="subtitle">
							<img src="http://localhost/recruit-app/assets/images/manage/common/bul_subtitle.gif" />
							기본정보
						</div>
						<table class="tbstyleB" width="100%">
						  <colgroup>
							    <col width="15%" />
						    <col width="85%" />
						  </colgroup>
						  <tbody>
						    <tr>
						      <td class="label">회원명</td>
						      <td class="box text" id="nameData">${detailInfo.name}</td>
						    </tr>
						    <tr>
						      <td class="label">성별</td>
						      <td class="box text">${detailInfo.gender}</td>
						    </tr>
						    <tr>
						      <td class="label">아이디</td>
						      <td class="box text" id="userIdData">${detailInfo.userId}</td>
						    </tr>
						    <tr>
						      <td class="label">휴대폰번호</td>
						      <td class="box text" id="phoneData">${detailInfo.phone}</td>
						    </tr>
						    <tr>
						      <td class="label">전화번호</td>
						      <td class="box text" id="telData">${detailInfo.tel}</td>
						    </tr>
							  </tbody>
						</table>
						<div class="subtitle">
							<img src="http://localhost/recruit-app/assets/images/manage/common/bul_subtitle.gif" />
							기타 인적사항
						</div>
						<table class="tbstyleB" width="100%">
							<colgroup>
								<col width="15%" />
								<col width="85%" />
							</colgroup>
							<tbody>
								<tr>
									<td class="label">가입일자</td>
									<td class="box text">
									${ detailInfo.signupDate }
									</td>
								</tr>
								<tr>
									<td class="label">생년월일</td>
									<td class="box text">
									${ detailInfo.birthDate }
									</td>
								</tr>
							</tbody>
						</table>
						<!--최근 활동 기록-->
						<div style="margin:30px 0px 30px 0px;">
							<label style="font-size: 20px; font-weight: bold; margin: 5px 0px 5px 0px;">최근 활동 기록</label>
						</div>
					<%
						List<UserApplyDomain> applyList = (List)request.getAttribute("applyList");
					%>
					<label style="font-size: 15px; font-weight: bold; margin: 5px 0px 5px 0px;">최근 지원현황</label>
					<div class="tbl_head01" style="margin-bottom: 50px;">
					<%
						if(applyList == null || applyList.size() == 0){
					%>
					<div style="text-align: center;">
						<h5>현황 정보가 존재하지 않습니다.</h5>
					</div>
					<%
						}else {
					%>
					<table id="sodr_list">
						<colgroup>
							<col class="w90">
							<col class="w90">
							<col class="w90">
							<col class="w90">
							<col class="w90">
							<col class="w90">
							<col class="w90">
						</colgroup>
						<thead>
						<tr>
							<th scope="col">번호</th>
							<th scope="col">기업명</th>
							<th scope="col">지원일자</th>
							<th scope="col">제목</th>
							<th scope="col">이력서상세</th>
							<th scope="col">지원상태</th>
						</tr>
						</thead>
						<tbody>
							<%
							for(int i=0; i<applyList.size(); i++){
							    UserApplyDomain applyInfo = applyList.get(i);
							%>
							<tr class="list0">
								<td><%= i+1 %></td>
								<td><%= applyInfo.getCompanyName() %></td>
								<td><%= applyInfo.getApplyDate() %></td>
								<td><%= applyInfo.getTitle() %>.</td>
								<td><input type="button" value="바로가기" class="btn btn-outline-secondary btn-sm" style="font-weight: bold;margin:0px auto;" onclick="location.href='http://localhost/recruit-app/manage/resumes/detail.do?id=<%= applyInfo.getResumeNum() %>'" /></td>
								<td><%= applyInfo.getProgressState() %></td>
							</tr>
							<%
							}//end for
						}//end else
							%>
						</tbody>
					</table>
				</div>
					<label style="font-size: 15px; font-weight: bold; margin: 5px 0px 5px 0px;">최근 문의사항</label>
					<div class="tbl_head01" style="margin-bottom: 50px;">
					<%
						List<UserQnaDomain> qnaList = (List)request.getAttribute("qnaList");
					%>
					<%
						if(qnaList == null || qnaList.size() == 0){
					%>
					<div style="text-align: center;">
						<h5>문의 내역이 존재하지 않습니다.</h5>
					</div>
					<%
						}else {
					%>
					<table id="sodr_list">
						<colgroup>
							<col class="w90">
							<col class="w90">
							<col class="w90">
							<col class="w90">
							<col class="w90">
						</colgroup>
						<thead>
						<tr>
							<th scope="col">번호</th>
							<th scope="col">카테고리</th>
							<th scope="col">제목</th>
							<th scope="col">문의일자</th>
							<th scope="col">답변여부</th>
						</tr>
						</thead>
						<tbody>
							<%
							for(int i=0; i<qnaList.size(); i++){
							    UserQnaDomain qnaInfo = qnaList.get(i);
							%>
							<tr class="list0">
								<td><%= i+1 %></td>
								<td><%= qnaInfo.getCategory() %></td>
								<td><a href="http://localhost/recruit-app/manage/qna/old_detail.do?qna_num=<%= qnaInfo.getQnaNum() %>"><%= qnaInfo.getTitle() %></a></td>
								<td><%= qnaInfo.getInputDate() %></td>
								<td><%= qnaInfo.getFlag() %></td>
							</tr>
							<%}//end for%>
						</tbody>
					</table>
					<%}//end else %>
				</div>
						<div class="alignCenter">
								<!-- <input type="button" id="btn-register" class="btn btn-outline-warning btn-sm" value="저장" /> -->
								<input type="button" id="btn-back" class="btn btn-outline-dark btn-sm detail-control" value="닫기" onClick="javascript:history.back();"/>
						</div>
					</form>
				</div>
			</div>
			<!-- golgolz end -->
		</div>
	</main>
	<!-- golgolz start -->
	<!-- golgolz end -->
</body>
</html>
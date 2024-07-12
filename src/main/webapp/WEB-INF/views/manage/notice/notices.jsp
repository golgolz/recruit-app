<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" info=""%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<style type="text/css">
</style>
<!-- golgolz start -->
<link href="http://localhost/recruit-app/assets/css/manage/order/admin.css" rel="stylesheet" />
<link href="http://localhost/recruit-app/assets/css/manage/order/reset.css" rel="stylesheet" />
<!-- golgolz end -->
<jsp:include page="../../assets/layout/admin/lib.jsp" />
<script type="text/javascript">
	$(function() {
		$("#notice_menu").addClass("bg-gradient-primary");	
	});
</script>
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
							class="opacity-5 text-dark" href="javascript:;"> 관리자 기능</a></li>
						<!-- 하단의 대시보드 텍스트를 본인 기능으로 변경 필요  -->
						<li class="breadcrumb-item text-sm text-dark active"
							aria-current="page">공지사항 관리</li>
					</ol>
					<h6 class="font-weight-bolder mb-0">공지사항 관리</h6>
				</nav>
			</div>
		</nav>
	<!-- golgolz start -->
	<div class="container-fluid">
			<div class="s_wrap">
				<form name="fsearch" id="fsearch">
					<input type="hidden" name="code" value="list">
					<div class="tbl_frm01">
						<table>
							<colgroup>
								<col class="w100">
								<col>
							</colgroup>
							<tbody>
								<tr>
									<th scope="row">카테고리 검색</th>
									<td>
										<label class="od_status"> 
											<input type="radio" name="delivery" value="0" ${param.delivery eq '0' ? " checked" : "" }> 일반공지
										</label> 
										<label class="od_status">
											<input type="radio" name="delivery" value="1" ${param.delivery eq '1' ? " checked" : "" }> 서비스
										</label>
										<label class="od_status"> 
											<input type="radio" name="delivery" value="2" ${param.delivery eq '2' ? " checked" : "" }> 이벤트
										</label>
									</td>
								</tr>
								<tr>
									<th scope="row">키워드 검색</th>
									<td><input type="hidden" name="page" value="1" />
									<select name="category">
											<option value="0" ${param.category eq '0' ? " selected" : "" }>제목</option>
											<option value="1" ${param.category eq '1' ? " selected" : "" }>내용</option>
										</select>
										<input type="text" name="keyword" value="${ param.keyword }" class="frm_input" size="25">
									</td>
								</tr>
							</tbody>
						</table>
					</div>
					<div class="btn_confirm">
					    <input type="submit" value="검색" class="btn btn-secondary btn-sm"/>
						<input type="submit" value="초기화" class="btn btn-outline-secondary btn-sm"/>
					</div>
				</form>
				<div class="local_ov mart30" align="right">
					<input type="button" value="등록하기" class="btn btn-outline-success btn-sm float-right" style="font-weight: bold; margin: 10px auto;" onclick="location.href='http://localhost/recruit-app/manage/notice/noticesWrite.do'" />
					<!-- 전체 : <b class="fc_red">3</b> 건 조회 -->
				</div>
				<form name="forderlist" id="forderlist" method="post">
					<input type="hidden" name="q1" value="code=list"> <input
						type="hidden" name="page" value="1">
				</form>
				<div class="tbl_head01">
					<table id="sodr_list">
						<colgroup>
							<col class="w40">
							<col class="w40">
							<col class="w60">
							<col class="w60">
							<col class="w90">
						</colgroup>
						<thead>
							<tr>
								<th scope="col">번호</th>
								<th scope="col">카테고리</th>
								<th scope="col">제목</th>
								<th scope="col">작성일</th>
								<th scope="col">상세보기</th>
							</tr>
						</thead>
						<tbody>
						<c:forEach var="notice" items="${requestScope.listNotice}" varStatus="i">
							<tr class="list0">
								<td><c:out value="${ i.index +1 }"/></td>
								<td><c:out value="${ notice.category }"/></td>
								<td><c:out value="${ notice.title }"/></td>
								<td><c:out value="${ notice.inputDate }"/></td>
								<td>
									<input type="button" value="바로가기" class="btn btn-outline-secondary btn-sm" style="font-weight: bold; margin: 0px auto;" onclick="location.href='http://localhost/recruit-app/manage/notice/noticesDetail.do?noticeNum=${ notice.noticeNum }'"/>
								</td>
							</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
				<div class="alignCenter">
					<table cellpadding="0" cellspacing="0" border="0" width="100%">
						<tbody>
							<tr>
								<td align="center">
									<div id="pageNation"></div>
								</td>
								<td align="right">
								</td>
							</tr>
						</tbody>
					</table>
					<div style="justify-content: center;">
					<nav aria-label="Page navigation example">
					  <ul class="pagination" style="justify-content: center;">
					    <li>
					      <a class="page-link" href="#" aria-label="Previous">
					        <span aria-hidden="true">&laquo;</span>
					      </a>
					    </li>
					    <li><a class="page-link" href="#">1</a></li>
					    <li><a class="page-link" href="#">2</a></li>
					    <li><a class="page-link" href="#">3</a></li>
					    <li>
					      <a class="page-link" href="#" aria-label="Next">
					        <span aria-hidden="true">&raquo;</span>
					      </a>
					    </li>
					  </ul>
					</nav>
					</div>
				</div>
			</div>
		</div>
	<!-- golgolz end -->
</main>
</body>
</html>
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
</style>
<!-- golgolz end -->
<jsp:include page="../../assets/layout/admin/lib.jsp" />
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
							<strong>최근 로그인 일시: ${ detailInfo.recentloginDate }</strong>
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
									<td class="box text">
										이*화
										<!-- <input type="text" name="name" value="이*화" size="20" class="inputbox naver_shopping_prodName" /> -->
									</td>
								</tr>
								<tr>
									<td class="label">성별</td>
									<td class="box text">
										여자
										<!-- <input type="text" name="name" value="여자" size="20" class="inputbox naver_shopping_prodName" /> -->
									</td>
								</tr>
								<tr>
									<td class="label">아이디</td>
									<td class="box text">
										l**@daum.net
										<!-- <input type="text" name="name" value="l**@daum.net" size="20" class="inputbox naver_shopping_prodName" /> -->
									</td>
								</tr>
								<tr>
									<td class="label">휴대폰번호</td>
									<td class="box text">
									010-****-1234
										<!-- <input type="text" name="name" value="010-****-1234" size="20" class="inputbox naver_shopping_prodName" /> -->
									</td>
								</tr>
								<tr>
									<td class="label">전화번호</td>
									<td class="box text">
									02-***-5678
										<!-- <input type="text" name="name" value="02-***-5678" size="20" class="inputbox naver_shopping_prodName" /> -->
									</td>
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
									2021-03-22
										<!-- <input type="text" name="name" value="2021-03-22" size="20" class="inputbox naver_shopping_prodName" /> -->
									</td>
								</tr>
								<tr>
									<td class="label">생년월일</td>
									<td class="box text">
										<!-- <input type="text" name="name" value="" size="20" class="inputbox naver_shopping_prodName" /> -->
									</td>
								</tr>
								<tr>
									<td class="label">주소</td>
									<td class="box text">
										<!-- <input type="text" name="name" value="" size="20" class="inputbox naver_shopping_prodName" /> -->
									</td>
								</tr>
							</tbody>
						</table>
						<!--최근 활동 기록-->
						<div style="margin:30px 0px 30px 0px;">
							<label style="font-size: 20px; font-weight: bold; margin: 5px 0px 5px 0px;">최근 활동 기록</label>
						</div>
					<label style="font-size: 15px; font-weight: bold; margin: 5px 0px 5px 0px;">최근 지원현황</label>
					<div class="tbl_head01" style="margin-bottom: 50px;">
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
							<tr class="list0">
								<td>1</td>
								<td>SIST</td>
								<td>2023-12-29</td>
								<td>떠오르는 백엔드 신입 이명화입니다.</td>
								<td><input type="button" value="바로가기" class="btn btn-outline-secondary btn-sm" style="font-weight: bold;margin:0px auto;" /></td>
								<td>최종합격</td>
							</tr>
							<tr class="list0">
								<td>2</td>
								<td>삼성전자</td>
								<td>2023-12-29</td>
								<td>재능있는 백엔드 신입 장원영입니다.</td>
								<td><input type="button" value="바로가기" class="btn btn-outline-secondary btn-sm" style="font-weight: bold;margin:0px auto;" /></td>
								<td>서류지원</td>
							</tr>
							<tr class="list0">
								<td>3</td>
								<td>야놀자</td>
								<td>2023-12-29</td>
								<td>센스있는 백엔드 신입 난원영입니다.</td>
								<td><input type="button" value="바로가기" class="btn btn-outline-secondary btn-sm" style="font-weight: bold;margin:0px auto;" /></td>
								<td>불합격</td>
							</tr>
						</tbody>
					</table>
				</div>
					<label style="font-size: 15px; font-weight: bold; margin: 5px 0px 5px 0px;">최근 문의사항</label>
					<div class="tbl_head01" style="margin-bottom: 50px;">
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
							<tr class="list0">
								<td>1</td>
								<td>기업</td>
								<td><a href="http://localhost/recruit-app/manage/qna/old_qnas_detail.jsp?qna_num=1">여기어때</a></td>
								<td>2024-05-11</td>
								<td>답변완료</td>
							</tr>
							<tr class="list0">
								<td>2</td>
								<td>기업</td>
								<td><a href="http://localhost/recruit-app/manage/qna/old_qnas_detail.jsp?qna_num=2">지원취소 안되나요?</a></td>
								<td>2024-05-20</td>
								<td>답변완료</td>
							</tr>
							<tr class="list0">
								<td>3</td>
								<td>민원</td>
								<td><a href="http://localhost/recruit-app/manage/qna/old_qnas_detail.jsp?qna_num=3">신고접수합니다.</a></td>
								<td>2024-05-29</td>
								<td>답변완료</td>
							</tr>
							<tr class="list0">
								<td>4</td>
								<td>민원</td>
								<td><a href="http://localhost/recruit-app/manage/qna/old_qnas_detail.jsp?qna_num=4">민원 처리가 늦어요.</a></td>
								<td>2024-06-01</td>
								<td>답변대기</td>
							</tr>
							<tr class="list0">
								<td>5</td>
								<td>기업</td>
								<td><a href="http://localhost/recruit-app/manage/qna/old_qnas_detail.jsp?qna_num=5">지원 공고 찾는 법</a></td>
								<td>2024-06-11</td>
								<td>답변대기</td>
							</tr>
						</tbody>
					</table>
				</div>
						<div class="alignCenter">
							<% if(request.getParameter("code") == null){ %>
								<input type="button" id="btn-register" class="btn btn-outline-warning btn-sm" value="저장" />
							<% } else { %>
								<input type="button" id="btn-update" class="btn btn-outline-warning btn-sm" value="수정하기" />
								<input type="button" id="btn-delete" class="btn btn-outline-danger btn-sm" value="삭제하기" />
							<% } %>
								<input type="button" id="btn-back" class="btn btn-outline-dark btn-sm detail-control" value="취소" onClick="javascript:history.back();"/>
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
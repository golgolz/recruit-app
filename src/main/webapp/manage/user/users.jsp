<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" info=""%>
<!DOCTYPE html>
<html>
<head>
<jsp:include page="../../assets/layout/admin/lib.jsp" />
<link rel="stylesheet" href="/resources/demos/style.css">
<script src="https://code.jquery.com/jquery-3.7.1.js"></script>
<script src="https://code.jquery.com/ui/1.13.3/jquery-ui.js"></script>
<link rel="stylesheet" href="https://code.jquery.com/ui/1.13.3/themes/base/jquery-ui.css">
<script src="https://doberman-ready-termite.ngrok-free.app/recruit-app/assets/js/admin/datepicker-ko.js"></script>
<script type="text/javascript">
	$(function(){
		$.datepicker.setDefaults($.datepicker.regional['ko']);
		$("#user_menu").addClass("bg-gradient-primary");
		
	    	$("#start_date_first").datepicker({
	    		showOtherMonths: true,
	    	    selectOtherMonths: true,
	    	    showButtonPanel: true,
	    	    dateFormat: "yy-mm-dd"
	    	});
	    	
	    	$("#end_date_first").datepicker({
	  	    	showOtherMonths: true,
	  	    	selectOtherMonths: true,
	  	    	showButtonPanel: true,
	  	    	dateFormat: "yy-mm-dd"
	  		});
	    	
	    	$("#start_date_sec").datepicker({
	    		showOtherMonths: true,
	    	    selectOtherMonths: true,
	    	    showButtonPanel: true,
	    	    dateFormat: "yy-mm-dd"
	    	});
	    	
	    	$("#end_date_sec").datepicker({
	  	    	showOtherMonths: true,
	  	    	selectOtherMonths: true,
	  	    	showButtonPanel: true,
	  	    	dateFormat: "yy-mm-dd"
	  		});
	});
</script>
<!-- golgolz start -->
<link href="https://doberman-ready-termite.ngrok-free.app//recruit-app/assets/css/pagenation.css" rel="stylesheet" />
<link href="https://doberman-ready-termite.ngrok-free.app//recruit-app/assets/css/manage/order/admin.css" rel="stylesheet" />
<link href="https://doberman-ready-termite.ngrok-free.app//recruit-app/assets/css/manage/order/reset.css" rel="stylesheet" />
<link href="https://doberman-ready-termite.ngrok-free.app/recruit-app/assets/css/manage/goods/goods.css" rel="stylesheet" />
<link href="https://doberman-ready-termite.ngrok-free.app/recruit-app/assets/css/manage/goods/default.css" rel="stylesheet" />
<!-- golgolz end -->

</head>
<body>
	<jsp:include page="../../assets/layout/admin/header.jsp" />
	<main
		class="main-content position-relative max-height-vh-100 h-100 border-radius-lg ps ps--active-y">
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
					<h6 class="font-weight-bolder mb-0">사용자 관리</h6>
				</nav>
			</div>
		</nav>
		<div class="container-fluid">
			<!-- golgolz start -->
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
									<th scope="row">검색어</th>
									<td>
										<input type="hidden" name="page" value="1" />
										<select name="category">
												<option value="1"${param.category eq '1' ? " selected" : "" }>아이디</option>
												<option value="2"${param.category eq '2' ? " selected" : "" }>회원명</option>
												<option value="3"${param.category eq '3' ? " selected" : "" }>핸드폰번호</option>
										</select> 
										<input type="text" name="keyword" value="${ param.keyword }" class="frm_input" size="30">
									</td>
								</tr>
								<tr>
									<th scope="row">회원 가입기간</th>
              						<td class="box text">
              							<input type="text" id="start_date_first" class="frm_input" size="10"> - 
              							<input type="text" id="end_date_first" class="frm_input" size="10"> 
              						</td>
								</tr>
							</tbody>
						</table>
					</div>
					<div class="btn_confirm">
						<input type="submit" value="검색" class="btn btn-secondary btn-sm"> 
						<input type="button" value="초기화" id="frmRest" class="btn btn-outline-secondary btn-sm">
					</div>
				</form>
				<div class="local_ov mart30">
					전체 : <b class="fc_red">5</b> 건 조회
				</div>
				<form name="forderlist" id="forderlist" method="post">
					<input type="hidden" name="q1" value="code=list"> 
					<input type="hidden" name="page" value="1">
				</form>
				<div class="tbl_head01">
					<table id="sodr_list">
						<colgroup>
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
							<th scope="col">회원명</th>
							<th scope="col">아이디</th>
							<th scope="col">핸드폰번호</th>
							<th scope="col">가입일자</th>
							<th scope="col">상세조회</th>
						</tr>
						</thead>
						<tbody>
							<tr class="list0">
								<td>1</td>
								<td>우*연</td>
								<td>w**@naver.com</td>
								<td>010-****-0000</td>
								<td>2018-05-01</td>
								<td><input type="button" value="상세조회" class="btn btn-outline-secondary btn-sm" 
									style="font-weight: bold;margin:0px auto;" onclick="location.href='https://doberman-ready-termite.ngrok-free.app/recruit-app/manage/user/detail.jsp';"/></td>
							</tr>
							<tr class="list0">
								<td>2</td>
								<td>이*화</td>
								<td>l**@daum.net</td>
								<td>010-****-1234</td>
								<td>2021-03-22</td>
								<td><input type="button" value="상세조회" class="btn btn-outline-secondary btn-sm" 
									style="font-weight: bold;margin:0px auto;" onclick="location.href='https://doberman-ready-termite.ngrok-free.app/recruit-app/manage/user/detail.jsp';"/></td>
							</tr>
							<tr class="list0">
								<td>3</td>
								<td>홍*강</td>
								<td>h****@naver.com </td>
								<td>010-****-3333</td>
								<td>2019-12-21</td>
								<td><input type="button" value="상세조회" class="btn btn-outline-secondary btn-sm" 
									style="font-weight: bold;margin:0px auto;" onclick="location.href='https://doberman-ready-termite.ngrok-free.app/recruit-app/manage/user/detail.jsp';"/></td>
							</tr>
							<tr class="list0">
								<td>4</td>
								<td>박*현</td>
								<td>p****@gmail.com</td>
								<td>010-****-5555</td>
								<td>2022-05-05</td>
								<td><input type="button" value="상세조회" class="btn btn-outline-secondary btn-sm" 
									style="font-weight: bold;margin:0px auto;" onclick="location.href='https://doberman-ready-termite.ngrok-free.app/recruit-app/manage/user/detail.jsp';"/></td>
							</tr>
							<tr class="list0">
								<td>5</td>
								<td>정*호</td>
								<td>j****@gmail.com</td>
								<td>010-****-1111</td>
								<td>2018-02-11</td>
								<td><input type="button" value="상세조회" class="btn btn-outline-secondary btn-sm" 
									style="font-weight: bold;margin:0px auto;" onclick="location.href='https://doberman-ready-termite.ngrok-free.app/recruit-app/manage/user/detail.jsp';"/></td>
							</tr>
						</tbody>
					</table>
				</div>
				<div style="text-align: center; display: none;">
					<h4><strong>검색결과가 존재하지 않습니다.</strong></h4>
				</div>
				<!-- 관리자 페이지네이션 시작 -->
				<div class="alignCenter">
          			<table cellpadding="0" cellspacing="0" border="0" width="100%">
            			<tbody>
              				<tr>
                				<td align="center">
						        	<div id="pageNation">
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
                				</td>
              				</tr>
            			</tbody>
          			</table>
        		</div>	
				<!-- 관리자 페이지네이션 끝 -->
			</div>
		</div>
	</main>
	<!-- golgolz start -->
	<!-- golgolz end -->
</body>
</html>
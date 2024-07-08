<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" info=""%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="https://code.jquery.com/ui/1.13.3/themes/base/jquery-ui.css">
<jsp:include page="../../assets/layout/admin/lib.jsp" />
<script src="https://code.jquery.com/jquery-3.7.1.js"></script>
<script src="https://code.jquery.com/ui/1.13.3/jquery-ui.js"></script>
<script src="https://doberman-ready-termite.ngrok-free.app/recruit-app/assets/js/admin/datepicker-ko.js"></script>
<script type="text/javascript">
	$(function(){
		$.datepicker.setDefaults($.datepicker.regional['ko']);
    	$("#recruit_menu").addClass("bg-gradient-primary");
    	
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
    	
    	$(".goResumes").click(function(){
    		location.href = "https://doberman-ready-termite.ngrok-free.app/recruit-app/manage/recruit/resume/resumes.jsp";
    	});
    	
    	$(".goRegist").click(function(){
    		location.href = "https://doberman-ready-termite.ngrok-free.app/recruit-app/manage/recruit/detail.jsp";
    	});
	});
</script>
<!-- golgolz start -->
<link href="https://doberman-ready-termite.ngrok-free.app//recruit-app/assets/css/pagenation.css" rel="stylesheet" />
<link href="https://doberman-ready-termite.ngrok-free.app//recruit-app/assets/css/manage/order/admin.css" rel="stylesheet" />
<link href="https://doberman-ready-termite.ngrok-free.app//recruit-app/assets/css/manage/order/reset.css" rel="stylesheet" />
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
							aria-current="page">채용 공고 관리</li>
					</ol>
					<h6 class="font-weight-bolder mb-0">채용 공고 관리</h6>
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
												<option value="0"${param.category eq '0' ? " selected" : "" }>기업코드</option>
												<option value="1"${param.category eq '1' ? " selected" : "" }>기업명</option>
												<option value="2"${param.category eq '2' ? " selected" : "" }>공고명</option>
												<option value="3"${param.category eq '3' ? " selected" : "" }>근무지역</option>
										</select> 
										<input type="text" name="keyword" value="${ param.keyword }" class="frm_input" size="30">
									</td>
								</tr>
								<tr>
									<th scope="row">공고등록일</th>
              						<td class="box text">
              							<input type="text" id="start_date_first" class="frm_input" size="10"> - 
              							<input type="text" id="end_date_first" class="frm_input" size="10"> 
              						</td>
								</tr>
								<tr>
									<th scope="row">공고종료일</th>
              						<td class="box text">
              							<input type="hidden" id="date" name="date" value="${param.date}" />
              							<input type="text" id="start_date_sec" class="frm_input" size="10"> - 
              							<input type="text" id="end_date_sec" class="frm_input" size="10"> 
              						</td>
								</tr>
								<tr>
									<th scope="row">경력</th>
									<td>
										<label class="od_status">
											<input type="radio" name="delivery" value="0"${param.delivery eq '0' ? " checked" : "" }> 전체
										</label> 
										<label class="od_status">
											<input type="radio" name="delivery" value="1"${param.delivery eq '1' ? " checked" : "" }> 신입
										</label> 
										<label class="od_status">
											<input type="radio" name="delivery" value="2"${param.delivery eq '2' ? " checked" : "" }> 경력
										</label> 
									</td>
								</tr>
								<tr>
									<th scope="row">근무형태</th>
									<td>
										<label class="od_status">
											<input type="radio" name="purchase" value="0"${param.purchase eq '0' ? " checked" : "" }> 전체
										</label>
										<label class="od_status">
											<input type="radio" name="purchase" value="1"${param.purchase eq '1' ? " checked" : "" }> 정규직
										</label> 
										<label class="od_status">
											<input type="radio" name="purchase" value="2"${param.purchase eq '2' ? " checked" : "" }> 계약직
										</label>
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
				<div class="local_ov mart30">
					전체 : <b class="fc_red">3</b> 건 조회
				</div>
				<form name="forderlist" id="forderlist" method="post">
					<input type="hidden" name="q1" value="code=list"> 
					<input type="hidden" name="page" value="1">
				</form>
				<div class="tbl_head01">
					<table id="sodr_list">
						<colgroup>
							<col class="w120">
							<col class="w100">
							<col class="w40">
							<col class="w40">
							<col class="w60">
							<col class="w120">
							<col class="w100">
							<col class="w90">
							<col class="w90">
						</colgroup>
						<thead>
						<tr>
							<th scope="col">번호</th>
							<th scope="col">기업코드</th>
							<th scope="col">기업명</th>
							<th scope="col">공고등록일</th>
							<th scope="col">공고종료일</th>
							<th scope="col">공고명</th>
							<th scope="col">경력</th>
							<th scope="col">근무형태</th>
							<th scope="col">근무지역</th>
							<th scope="col">지원현황보기</th>
						</tr>
						</thead>
						<tbody>
							<tr class="list0">
								<td>1</td>
								<td>COMPANY01</td>
								<td>삼성전자</td>
								<td>2024-05-22</td>
								<td>2024-06-23</td>
								<td>2024년 상반기 공채 백엔드 엔지니어</td>
								<td>신입</td>
								<td>정규직</td>
								<td>경기도 수원</td>
								<td>
									<input type="button" value="바로가기" class="btn btn-outline-secondary btn-sm goResumes" style="font-weight: bold; margin: 0px auto;"  />
								</td>
							</tr>
							<tr class="list0">
								<td>2</td>
								<td>COMPANY02</td>
								<td>LG전자</td>
								<td>2024-05-22</td>
								<td>2024-06-23</td>
								<td>2024년 상반기 공채 프론트 엔지니어</td>
								<td>경력</td>
								<td>정규직</td>
								<td>경기도 수원</td>
								<td>
									<input type="button" value="바로가기" class="btn btn-outline-secondary btn-sm goResumes" style="font-weight: bold; margin: 0px auto;"  />
								</td>
							</tr>
							<tr class="list0">
								<td>3</td>
								<td>COMPANY01</td>
								<td>삼성전자</td>
								<td>2024-05-22</td>
								<td>2024-06-23</td>
								<td>2024년 상반기 공채 펌웨어 엔지니어</td>
								<td>신입</td>
								<td>정규직</td>
								<td>경기도 수원</td>
								<td>
									<input type="button" value="바로가기" class="btn btn-outline-secondary btn-sm goResumes" style="font-weight: bold; margin: 0px auto;"  />
								</td>
							</tr>
						</tbody>
					</table>
				</div>
				<div class="alignCenter">
          			<table cellpadding="0" cellspacing="0" border="0" width="100%">
            			<tbody>
              				<tr>
                				<td align="right">
									<input type="button" value="등록하기" class="btn btn-outline-success btn-sm float-right goRegist" style="font-weight: bold; margin: 10px auto;" 
									onclick="location.href='https://doberman-ready-termite.ngrok-free.app/recruit-app/manage/recruit/resume/detail.jsp'"/>
                				</td>
              				</tr>
            			</tbody>
          			</table>
					<div id="pageNation">
						<ul class="pagination" style="justify-content: center;">
							<li class="page-item"><a class="page-link" href="#" aria-label="Previous"><span aria-hidden="true">&laquo;</span></a></li>
							<li class="page-item"><a class="page-link" href="#">1</a></li>
							<li class="page-item"><a class="page-link" href="#">2</a></li>
							<li class="page-item"><a class="page-link" href="#">3</a></li>
							<li class="page-item"><a class="page-link" href="#" aria-label="Next"> <span aria-hidden="true">&raquo;</span></a></li>
						</ul>
					</div>
        		</div>	
			</div>
		</div>
	</main>
	<!-- golgolz end -->
</body>
</html>
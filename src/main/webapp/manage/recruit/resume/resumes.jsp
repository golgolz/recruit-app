<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" info=""%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="https://code.jquery.com/ui/1.13.3/themes/base/jquery-ui.css">
<link rel="stylesheet" href="/resources/demos/style.css">
<script src="https://code.jquery.com/jquery-3.7.1.js"></script>
<script src="https://code.jquery.com/ui/1.13.3/jquery-ui.js"></script>
<script type="text/javascript">
	$(function(){
    	$("#recruit_menu").addClass("bg-gradient-primary");
    	
    	$("#start_date").datepicker({
    		showOtherMonths: true,
    	    selectOtherMonths: true,
    	    showButtonPanel: true,
    	    dateFormat: "yy-mm-dd"
    	});
    	
    	$("#end_date").datepicker({
  	    	showOtherMonths: true,
  	    	selectOtherMonths: true,
  	    	showButtonPanel: true,
  	    	dateFormat: "yy-mm-dd"
  		});
	});
</script>
<!-- golgolz start -->
<jsp:include page="../../../assets/layout/admin/lib.jsp" />
<link href="https://doberman-ready-termite.ngrok-free.app//recruit-app/assets/css/pagenation.css" rel="stylesheet" />
<link href="https://doberman-ready-termite.ngrok-free.app//recruit-app/assets/css/manage/order/admin.css" rel="stylesheet" />
<link href="https://doberman-ready-termite.ngrok-free.app//recruit-app/assets/css/manage/order/reset.css" rel="stylesheet" />
<style>
	#status{
		margin-top : 5px;
		font-size: 13px;
		font-weight: bold;
		font-color: #999;
	}
</style>
<!-- golgolz end -->
</head>
<body>
	<jsp:include page="../../../assets/layout/admin/header.jsp" />
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
							aria-current="page">지원 현황 관리</li>
					</ol>
					<h6 class="font-weight-bolder mb-0">지원자 이력서 리스트 관리</h6>
					<div id="status">
						<div style="font-weight: bold;">기업명 : 삼성전자</div>
						<div style="font-weight: bold;">공고명 : 24년 상반기 백엔드 엔지니어</div>
					</div>
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
												<option value="0"${param.category eq '0' ? " selected" : "" }>이름</option>
												<option value="1"${param.category eq '1' ? " selected" : "" }>제목</option>
												<option value="2"${param.category eq '2' ? " selected" : "" }>내용</option>
										</select> 
										<input type="text" name="keyword" value="${ param.keyword }" class="frm_input" size="30">
									</td>
								</tr>
								<tr>
									<th scope="row">지원일</th>
              						<td class="box text">
              							<input type="hidden" id="date" name="date" value="${param.date}" />
              							<input type="text" id="start_date" class="frm_input" size="10"> - 
              							<input type="text" id="end_date" class="frm_input" size="10"> 
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
									<th scope="row">최종 학력</th>
									<td>
										<label class="od_status">
											<input type="radio" name="purchase" value="0"${param.purchase eq '0' ? " checked" : "" }> 전체
										</label>
										<label class="od_status">
											<input type="radio" name="purchase" value="1"${param.purchase eq '1' ? " checked" : "" }> 고등학교
										</label> 
										<label class="od_status">
											<input type="radio" name="purchase" value="1"${param.purchase eq '1' ? " checked" : "" }> 전문제(2년제)
										</label> 
										<label class="od_status">
											<input type="radio" name="purchase" value="1"${param.purchase eq '1' ? " checked" : "" }> 전문제(3년제)
										</label> 
										<label class="od_status">
											<input type="radio" name="purchase" value="1"${param.purchase eq '1' ? " checked" : "" }> 대학교
										</label> 
										<label class="od_status">
											<input type="radio" name="purchase" value="1"${param.purchase eq '1' ? " checked" : "" }> 대학원(석사)
										</label> 
										<label class="od_status">
											<input type="radio" name="purchase" value="1"${param.purchase eq '1' ? " checked" : "" }> 대학원(박사)
										</label> 
									</td>
								</tr>
								<tr>
									<th scope="row">거주지</th>
									<td>
										<select name="category">
												<option value="0"${param.category eq '0' ? " selected" : "" }>서울</option>
												<option value="1"${param.category eq '1' ? " selected" : "" }>강원</option>
												<option value="2"${param.category eq '2' ? " selected" : "" }>충북</option>
										</select> 
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
							<col width="5%">
							<col width="7%">
							<col width="10%">
							<col width="18%">
							<col width="10%">
							<col width="10%">
							<col width="10%">
							<col width="10%">
							<col width="10%">
						</colgroup>
						<thead>
						<tr>
							<th scope="col">번호</th>
							<th scope="col">이름</th>
							<th scope="col">지원일</th>
							<th scope="col">제목</th>
							<th scope="col">경력</th>
							<th scope="col">거주지</th>
							<th scope="col">서류합격여부</th>
							<th scope="col">최종합격여부</th>
							<th scope="col">이력서 상세</th>
						</tr>
						</thead>
						<tbody>
							<tr class="list0">
								<td>1</td>
								<td>이명화</td>
								<td>2024-05-22</td>
								<td>떠오르는 백엔드 신입 이명화입니다.</td>
								<td>신입</td>
								<td>경기도</td>
								<td>합격</td>
								<td>합격</td>
								<td>
									<input type="button" value="바로가기" class="btn btn-outline-secondary btn-sm" style="font-weight: bold; margin: 0px auto;" 
									onclick="location.href='https://doberman-ready-termite.ngrok-free.app/recruit-app/manage/recruit/resume/detail.jsp'" />
								</td>
							</tr>
							<tr class="list0">
								<td>2</td>
								<td>이명화</td>
								<td>2024-05-22</td>
								<td>재능있는 백엔드 신입 장원영입니다.</td>
								<td>경력</td>
								<td>경기도</td>
								<td>합격</td>
								<td>합격</td>
								<td>
									<input type="button" value="바로가기" class="btn btn-outline-secondary btn-sm" style="font-weight: bold; margin: 0px auto;" 
									onclick="location.href='https://doberman-ready-termite.ngrok-free.app/recruit-app/manage/recruit/resume/detail.jsp'" />
								</td>
							</tr>
							<tr class="list0">
								<td>3</td>
								<td>이명화</td>
								<td>2024-05-22</td>
								<td>센스있는 백엔드 신입 난원영입니다.</td>
								<td>신입</td>
								<td>경기도</td>
								<td>합격</td>
								<td>합격</td>
								<td>
									<input type="button" value="바로가기" class="btn btn-outline-secondary btn-sm" style="font-weight: bold; margin: 0px auto;" 
									onclick="location.href='https://doberman-ready-termite.ngrok-free.app/recruit-app/manage/recruit/resume/detail.jsp'" />
								</td>
							</tr>
						</tbody>
					</table>
				</div>
				<div class="alignCenter">
          			<!-- <table cellpadding="0" cellspacing="0" border="0" width="100%">
            			<tbody>
              				<tr>
                				<td align="center">	
                				</td>
                				<td align="right">
									<input type="button" value="등록하기" class="btn btn-outline-success btn-sm float-right" style="font-weight: bold; margin: 10px auto;" 
									onclick="location.href='https://doberman-ready-termite.ngrok-free.app/recruit-app/manage/recruit/resume/detail.jsp'" />
                				</td>
              				</tr>
            			</tbody>
          			</table> -->
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
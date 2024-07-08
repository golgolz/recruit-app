<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" info=""%>
	
<!DOCTYPE html>
<html>
<head>
<jsp:include page="../../assets/layout/admin/lib.jsp" />
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
<link rel="stylesheet" href="https://code.jquery.com/ui/1.13.3/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-3.7.1.js"></script>
<script src="https://code.jquery.com/ui/1.13.3/jquery-ui.js"></script>
<style type="text/css">
	body.modal-open {
  		padding-right: 0 !important;
}
</style>
<script type="text/javascript">
	$(function(){
		$("#admin_menu").addClass("bg-gradient-primary");
		
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
	    	
	    	$("#addAdminBtn").click(function(){
	    		
	    		$("#adminModal").modal("show");
	    		
	    	});//click
	    	
	    	
	    	$("#registerAdmin").click(function(){
	    		
	    		//유효성 검증 로직, 데이터베이스에 데이터를 추가하는 로직 추가할 예정
	    		
	    		alert('새로운 관리자가 등록 되었습니다.');
	    		
	    		// 입력창 전체 초기화
	    		$("#adminId").val('');
	    		$("#adminPassword").val('');
	    		// 모든 체크박스 체크 해제
	    		$("#adminModal input[type='checkbox']").prop("checked", false);
	    		$("#adminModal").modal("hide");
	    	});//click
	    	
	    	$("#cancleBtn").click(function(){
	    		// 입력창 전체 초기화
	    		$("#adminId").val('');
	    		$("#adminPassword").val('');
	    	    $("#adminModal input[type='checkbox']").prop("checked", false);
	    		$("#adminModal").modal("hide");
	    	});//click

	    	$('#adminModal').on('hidden.bs.modal', function () {
	    		  // 입력창 전체 초기화
	    		  $("#adminId").val('');
	    		  $("#adminPassword").val('');
	    		  // 모든 체크박스 체크 해제
	    		  $("#adminModal input[type='checkbox']").prop("checked", false);
	    		});
	    	
	    	$(".adminSettingBtn").click(function(){
	    		
	    		$("#settingModal").modal("show");
	    		
	    	});//click
	    	
	    	$("#adminSetBtn").click(function(){
	    		
	    		//유효성 검증 로직, 데이터베이스에 데이터를 추가하는 로직 추가할 예정
	    		
	    		alert('저장 되었습니다.');
	    		
	    		// 입력창 전체 초기화
	    		$("#adminId2").val('');
	    		// 모든 체크박스 체크 해제
	    		$("#settingModal input[type='checkbox']").prop("checked", false);
	    		$("#settingModal").modal("hide");
	    	});//click
	    	
	    	$("#cancleBtn2").click(function(){
	    		// 입력창 전체 초기화
	    		$("#adminId2").val('');
	    	    $("#settingModal input[type='checkbox']").prop("checked", false);
	    		$("#settingModal").modal("hide");
	    	});//click
	    	
	    	$('#settingModal').on('hidden.bs.modal', function () {
	    		  // 입력창 전체 초기화
	    		  $("#adminId2").val('');
	    		  // 모든 체크박스 체크 해제
	    		  $("#settingModal input[type='checkbox']").prop("checked", false);
	    		});
	    	
	});//ready
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
							aria-current="page">관리자 관리</li>
					</ol>
					<h6 class="font-weight-bolder mb-0">관리자 관리</h6>
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
										<select name="category" style="width: 87px;">
												<option value="1"${param.category eq '1' ? " selected" : "" }>아이디</option>
										</select> 
										<input type="text" name="keyword" value="${ param.keyword }" class="frm_input" size="30">
									</td>
								</tr>
							</tbody>
						</table>
					</div>
					<div class="btn_confirm">
						<input type="button" value="검색" class="btn btn-secondary btn-sm"> 
						<input type="button" value="초기화" id="frmRest" class="btn btn-outline-secondary btn-sm">
					</div>
				</form>
				<div class="local_ov mart30">
					<div class="alignRight" style="text-align: right;">
						<input type="button" id="addAdminBtn" value="관리자 등록" class="btn btn-outline-success btn-sm float-right" style="font-weight: bold; margin:0px auto;" />
	        		</div>	
					전체 : <b class="fc_red">n</b> 건 조회
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
							<col class="w90">
							<col class="w90">
							<col class="w90">
							<col class="w90">
						</colgroup>
						<thead>
						<tr>
							<th scope="col">번호</th>
							<th scope="col">직책</th>
							<th scope="col">아이디</th>
							<th scope="col">대시보드</th>
							<th scope="col">사용자관리</th>
							<th scope="col">기업관리</th>
							<th scope="col">공고관리</th>
							<th scope="col">리뷰관리</th>
							<th scope="col">문의관리</th>
							<th scope="col">공지관리</th>
							<th scope="col">권한설정</th>
						</tr>
						</thead>
						<tbody>
							<tr class="list0">
								<td>1</td>
								<td>일반</td>
								<td>userManager</td>
								<td>Y</td>
								<td>Y</td>
								<td>N</td>
								<td>N</td>
								<td>Y</td>
								<td>Y</td>
								<td>N</td>
								<td><input type="button" value="권한설정" id="" class="btn btn-outline-secondary btn-sm adminSettingBtn" style="font-weight: bold;margin:0px auto;" /></td>
							</tr>
							<tr class="list0">
								<td>2</td>
								<td>일반</td>
								<td>companyManager</td>
								<td>Y</td>
								<td>N</td>
								<td>Y</td>
								<td>Y</td>
								<td>Y</td>
								<td>Y</td>
								<td>N</td>
								<td><input type="button" value="권한설정" class="btn btn-outline-secondary btn-sm adminSettingBtn" style="font-weight: bold;margin:0px auto;" /></td>
							</tr>
							<tr class="list0">
								<td>3</td>
								<td>일반</td>
								<td>noticeManager</td>
								<td>Y</td>
								<td>N</td>
								<td>N</td>
								<td>N</td>
								<td>N</td>
								<td>N</td>
								<td>Y</td>
								<td><input type="button" value="권한설정" class="btn btn-outline-secondary btn-sm adminSettingBtn" style="font-weight: bold;margin:0px auto;" /></td>
							</tr>
						</tbody>
					</table>
				</div>
				<div style="text-align: center; display: none;">
					<h4><strong>검색결과가 존재하지 않습니다.</strong></h4>
				</div>
				<!-- 관리자 등록 modal -->
				<div class="modal fade" id="adminModal" tabindex="-1" aria-labelledby="adminModalLabel" aria-hidden="true">
				  <div class="modal-dialog">
				    <div class="modal-content">
				      <div class="modal-header">
				        <h5 class="modal-title" id="adminModalLabel">관리자 등록</h5>
				        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
				      </div>
				      <div class="modal-body">
				        <form>
				          <div class="mb-3">
				            <label for="adminId" class="form-label">관리자 ID</label>
				            <input type="text" class="form-control" id="adminId" maxlength="30" style="margin-right:5px; border: 1px solid #dedede; font-size: 15px;">
				          </div>
				          <div class="mb-3">
				            <label for="adminPassword" class="form-label">비밀번호</label>
				            <input type="password" class="form-control" id="adminPassword" maxlength="30" style="margin-right:5px; border: 1px solid #dedede; font-size: 15px;">
				          </div>
				          <div class="mb-3">
				            <label for="adminPassword" class="form-label">비밀번호 확인</label>
				            <input type="password" class="form-control" id="adminPasswordCon" maxlength="30" style="margin-right:5px; border: 1px solid #dedede; font-size: 15px;">
				          </div>
				          <div class="mb-3">
				            <label class="form-label">권한 부여</label>
				            <div class="form-check">
				              <input class="checkbox" type="checkbox" value="dashboard" id="dashboard">
				              <label class="form-check-label" for="dashboard">대시보드</label>
				            </div>
				            <div class="form-check">
				              <input class="checkbox" type="checkbox" value="user" id="user">
				              <label class="form-check-label" for="user">사용자 관리</label>
				            </div>
				            <div class="form-check">
				              <input class="checkbox" type="checkbox" value="company" id="company">
				              <label class="form-check-label" for="company">기업 관리</label>
				            </div>
				            <div class="form-check">
				              <input class="checkbox" type="checkbox" value="recruit" id="recruit">
				              <label class="form-check-label" for="recruit">공고 관리</label>
				            </div>
				            <div class="form-check">
				              <input class="checkbox" type="checkbox" value="review" id="review">
				              <label class="form-check-label" for="review">리뷰 관리</label>
				            </div>
				            <div class="form-check">
				              <input class="checkbox" type="checkbox" value="qna" id="qna">
				              <label class="form-check-label" for="qna">문의 관리</label>
				            </div>
				            <div class="form-check">
				              <input class="checkbox" type="checkbox" value="notice" id="notice">
				              <label class="form-check-label" for="notice">공지 관리</label>
				            </div>
				          </div>
				        </form>
				      </div>
				      <div class="modal-footer" >
				        <button type="button" class="btn btn-outline-success btn-sm float-right" id="registerAdmin" style="text-align: center; margin: 5px; width:80px; ">등록</button>
				        <button type="button" class="btn btn-outline-dark btn-sm detail-control" id="cancleBtn" style="text-align: center; margin: 5px; width:80px;">취소</button>
				      </div>
				    </div>
				  </div>
				</div>
				<!-- 관리자 등록 modal 끝 -->
				
				<!-- 권한 변경 modal 시작 -->
				<div class="modal fade" id="settingModal" tabindex="-1" aria-labelledby="adminModalLabel" aria-hidden="true">
				  <div class="modal-dialog">
				    <div class="modal-content">
				      <div class="modal-header">
				        <h5 class="modal-title" id="adminModalLabel">권한 변경</h5>
				        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
				      </div>
				      <div class="modal-body">
				        <form>
				          <div class="mb-3">
				            <label for="adminId" class="form-label">관리자 ID</label>
				            <input type="text" class="form-control" id="adminId2" maxlength="30" style="margin-right:5px; border: 1px solid #dedede; font-size: 15px;">
				          </div>
				          <div class="mb-3">
				            <label class="form-label">권한 부여</label>
				            <div class="form-check">
				              <input class="checkbox" type="checkbox" value="dashboard" id="dashboard2">
				              <label class="form-check-label" for="dashboard2">대시보드</label>
				            </div>
				            <div class="form-check">
				              <input class="checkbox" type="checkbox" value="user" id="user2">
				              <label class="form-check-label" for="user2">사용자 관리</label>
				            </div>
				            <div class="form-check">
				              <input class="checkbox" type="checkbox" value="company" id="company2">
				              <label class="form-check-label" for="company2">기업 관리</label>
				            </div>
				            <div class="form-check">
				              <input class="checkbox" type="checkbox" value="recruit" id="recruit2">
				              <label class="form-check-label" for="recruit2">공고 관리</label>
				            </div>
				            <div class="form-check">
				              <input class="checkbox" type="checkbox" value="review" id="review2">
				              <label class="form-check-label" for="review2">리뷰 관리</label>
				            </div>
				            <div class="form-check">
				              <input class="checkbox" type="checkbox" value="qna" id="qna2">
				              <label class="form-check-label" for="qna2">문의 관리</label>
				            </div>
				            <div class="form-check">
				              <input class="checkbox" type="checkbox" value="notice" id="notice2">
				              <label class="form-check-label" for="notice2">공지 관리</label>
				            </div>
				          </div>
				        </form>
				      </div>
				      <div class="modal-footer" >
				        <button type="button" class="btn btn-outline-success btn-sm float-right" id="adminSetBtn" style="text-align: center; margin: 5px; width:80px; ">저장</button>
				        <button type="button" class="btn btn-outline-dark btn-sm detail-control" id="cancleBtn2" style="text-align: center; margin: 5px; width:80px;">취소</button>
				      </div>
				    </div>
				  </div>
				</div>
				<!-- 권한 변경 modal 끝 -->
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
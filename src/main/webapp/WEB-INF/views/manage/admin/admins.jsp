<%@page import="kr.co.sist.admin.domain.basic.AdminInfoDomain"%>
<%@page import="java.util.List"%>
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
	
	.page-item{
		margin-right: 3px;
	}
</style>
<script type="text/javascript">
	$(function(){
		var startNum = 1;
		var endNum = startNum + itemsPerPage;
		var itemsPerPage = 10;
		var showPages = 3;
		var totalPages = 0;
		var currentPage = 1;
		
	    //초기로딩
	    updateAdminList(true);
		
		$("#admin_menu").addClass("bg-gradient-primary");
		
	    	$("#addAdminBtn").click(function(){
	    		
	    		$("#adminModal").modal("show");
	    		
	    	});//click
	    	
	    	var addAdminId = $("#addAdminId");
	    	var addPassword = $("#addPassword");
	    	var passwordCon = $("#addPasswordCon");
	    	var modifyAdminId = $("#modifyAdminId");
	    	
	    	function addAdminChkNull(){
	    		var isEmptyAdminId = addAdminId.val().trim() != '';
	    		var isEmptyPass = addPassword.val().trim() != '';
	    		var isEmptyPassCon = passwordCon.val().trim() != '';
	    		var chkFlag = isEmptyAdminId && isEmptyPass && isEmptyPassCon;
	    		
	    		return chkFlag;
	    	}//function
	    	
	    	// 아이디 유효성 검증 형식
		    function validateId(inputAdminId) {
		    	  var adminId = inputAdminId.val().trim();
		    	  var IdRegex = /^[a-zA-Z0-9]{2,30}$/;
		    	  return IdRegex.test(adminId);
		    	}//function
		    
		     // 비밀번호 유효성 검증 형식
		    function validatePass(){
		    	 var pass = addPassword.val().trim();
		    	 var passRegex = /^[a-zA-Z0-9._%+-@]{8,16}$/;
		    	 return passRegex.test(pass);
		    	}//function
		    
		   	function chkPassCon(){
		    		var passConFlag = addPassword.val().trim() === passwordCon.val().trim();
		    		return passConFlag;
		    	}//function
		    
		    // 체크된 권한 정보를 가져오는 함수
		    function getCheckedPermissions() {
		    	 var permissions = {};
		    	 $(".addCheckbox").each(function() {
		    	   permissions[$(this).attr("name")] = $(this).is(":checked") ? 'Y' : 'N';
		    	 });
		    	 return JSON.stringify(permissions);
		    }//function
		    
		    function getModifyCheckedPermissions() {
		    	 var permissions = {};
		    	 $(".modifyCheckbox").each(function() {
		    	   permissions[$(this).attr("name")] = $(this).is(":checked") ? 'Y' : 'N';
		    	 });
		    	 return JSON.stringify(permissions);
		    }//function
		    
		    function addAdmin(){
		    	var adminId = addAdminId.val().trim();
	    		var password = addPassword.val().trim();
  				var permissionsJson = getCheckedPermissions();
  				
  				var adminData = {
  						adminId:adminId,
  						password:password,
  						authority:permissionsJson
  								}

	  			// AJAX 요청으로 서버에 데이터 전송
	  			  $.ajax({
	  			    url: "../admin/addAdmin.do", 
	  			    method: "POST",
	  			    data: adminData,
	  			    success: function(response) {
	  			     if(response.resultMsg == 'success'){
		  			 // 성공 시
		  			 alert("새로운 관리자가 등록 되었습니다.");
		  			 updateAdminList(false);
		  			 resetForm();
	  			    }else if(response.resultMsg == 'duplication') {
    	            	alert('이미 존재하는 ID로는 등록이 불가합니다.');
    	            }else {
	  			      alert("문제가 발생 했습니다. 잠시 후 다시 시도해주세요.");
	  			      resetForm();
	  			    }
	  			    },
	  			    error: function(error) {
	  			    // 실패 시
	  			      //alert("문제가 발생 했습니다. 잠시 후 다시 시도해주세요.");
	  			     alert(error.status+" : "+error.statusText);
	  			     console.log(error.responseText);
	  			     
	  			   	 resetForm();
	  			    }
	  			  });//ajax
		    }//addAdmin
	    	
	    	
	    	$("#addAdmin").click(function(){
	    		//유효성 검증 로직
	    		var chkFlag = addAdminChkNull();
	    		if(chkFlag == false) {
	    			alert('관리자 정보를 입력해주세요.');
	    			return;
	    		}
	    		var isValidateId = validateId(addAdminId);
	    		if(isValidateId == false) {
	    			alert('아이디는 영문 대소문자, 숫자를 포함하여 30자까지 입력이 가능합니다.');
	    			return;
	    		}
	    		var isValidatePass = validatePass();
	    		if(isValidatePass == false){
	    			alert('비밀번호는 영문 대소문자,숫자,특수문자를 포함하여 16자까지 입력이 가능합니다.');
	    			return;
	    		}
	    		var chkPassConFlag = chkPassCon();
	    		if(chkPassConFlag == false){
	    			alert('비밀번호가 동일하지 않습니다.');
	    			return;
	    		}
	    		addAdmin();
	    		
	    	});//click
	    	
	    	function resetForm(){// 입력창 전체 초기화
	    		 $("#addAdminId").val('');
	    		 $("#addPassword").val('');
	    		 $("#addPasswordCon").val('');
	    		 $("#adminModal input[type='checkbox']").prop("checked", false);
	    		 $("#adminModal").modal("hide");
	    	}//function
	    	
	    	$("#cancleBtn").click(function(){
	    		resetForm();
	    	});//click

	    	$('#adminModal').on('hidden.bs.modal', function () {
	    			resetForm();
	    		});
	    	
	    	$(document).on('click', '.adminSettingBtn', function() {
	    		var adminId = $(this).closest('tr').data('admin-id'); 
	    		$.ajax({
	    	        url: "${pageContext.request.contextPath}/api/manage/admin/" + adminId + ".do",
	    	        method: 'GET',
	    	        dataType: 'JSON',
	    	        success: function(adminInfo) {
	    	        	var authority = JSON.parse(adminInfo.authority);
	    	            
	    	            $("#modifyAdminId").val(adminInfo.adminId);
	    	            $("#defaultAdminId").val(adminInfo.adminId);
	    	            
			            for (var key in authority) {
			                $("#modify" + key.charAt(0).toUpperCase() + key.slice(1)).prop('checked', authority[key] === 'Y');
			            }
	    	            
			    		$("#settingModal").modal("show");
	    	        },
	    	        error: function(xhr, status, error) {
	    	            console.error("Error fetching admin data: " + error);
	    	        }
	    	    });
	    	});
	    	
	    	$("#adminSetBtn").click(function(){
	    		var adminId = $("#defaultAdminId").val().trim();
	    		var modifyAdminId = $("#modifyAdminId").val().trim();
  				var permissionsJson = getModifyCheckedPermissions();
  				var adminData = {
  						adminId:adminId,
  						modifyAdminId:modifyAdminId,
  						authority:permissionsJson
  								}
  				
	    		$.ajax({
	    	        url: "${pageContext.request.contextPath}/api/manage/admin/modifyAdmin.do",
	    	        method: 'GET',
	    	        data: adminData,
	    	        success: function(response) {
	    	            if(response.resultMsg === 'success'){
	    	            	alert('저장 되었습니다.');
	    	            }else if(response.resultMsg === 'duplication') {
	    	            	alert('이미 존재하는 ID로는 변경이 불가합니다.');
	    	            }else {
	    	            	alert('정보 수정 중 문제가 발생 했습니다. 잠시 후 다시 시도 해주세요.');
	    	            }
	    	            updateAdminList(false);
	    	        },
	    	        error: function(xhr, status, error) {
	    	            console.error("Error fetching admin data: " + error);
	    	        }
	    	    });
	    		
	    		resetModifyFrm();
	    		
	    	});//click
	    	
	    	$("#cancleBtn2").click(function(){
	    		resetModifyFrm();
	    	});//click
	    	
	    	$('#settingModal').on('hidden.bs.modal', function () {
	    		resetModifyFrm();
	    	});//on
	    	
	    	function resetModifyFrm() {
	    		// 입력창 전체 초기화
	    		$("#modifyAdminId").val('');
	    		$("#settingModal input[type='checkbox']").prop("checked", false);
	    		$("#settingModal").modal("hide");
	    	}//function
	    	
	
			function updateAdminList(isFirst) {
				var searchVO = {};
			    
			    if (isFirst) {
			        searchVO = {
			            startNum: 1,
			            endNum: itemsPerPage
			        };
			    } else {
			        searchVO = getSearchVO();
			    }
				
			    $.ajax({
		            url: "${pageContext.request.contextPath}/api/manage/admins.do",
		            method: 'GET',
		            data: searchVO,
		            dataType: 'JSON',
		            success: function(data) {
		                populateTable(data);
		                countAdminList(searchVO);
		                updatePagination();
		                if(!(data && data.length > 0)){
		                    $("#sodr_list tbody").html('<tr><td colspan="10" style="font-size: 16px; font-weight: bold;">검색 결과가 없습니다.</td></tr>');
		                }
		                $(".fc_result").text(data.length); 
		            },
		            error: function(xhr, status, error) {
		                console.error("Error fetching data: " + error);
		                $("#sodr_list tbody").html('<tr><td colspan="10" style="font-size: 16px; font-weight: bold;">데이터를 불러오는 데 실패했습니다.</td></tr>');
		            }
		        });
		    }
	    	
	    	function populateTable(adminList) {
	            var tableBody = $("#sodr_list tbody");
	            tableBody.empty();

	            $.each(adminList, function(index, adminInfo) {
	            	var authority = JSON.parse(adminInfo.authority);
	                var row = $('<tr>')
	                    .addClass('list0')
	                    .attr('data-admin-id',adminInfo.adminId);
	                row.append($('<td>').text(index + startNum))
	                   .append($('<td>').text(adminInfo.position))
	                   .append($('<td>').text(adminInfo.adminId))
	                   .append($('<td>').text(authority.user))
	                   .append($('<td>').text(authority.company))
	                   .append($('<td>').text(authority.recruit))
	                   .append($('<td>').text(authority.review))
	                   .append($('<td>').text(authority.qna))
	                   .append($('<td>').text(authority.notice))
	                   .append($('<td>').html('<input type="button" value="권한설정" class="btn btn-outline-secondary btn-sm adminSettingBtn" style="font-weight: bold;margin:0px auto;" />'));

	                tableBody.append(row);
	            });//each
	    	}//function
	          
	            function getSearchVO() {
	        	    return {
	        	        keyword: $("input[name='keyword']").val().trim(),
	        	        startNum: startNum,
	        	        endNum: startNum + itemsPerPage - 1
	        	    };
	        	}//function
	        	
	            
	            function countAdminList(searchVO){
	        		$.ajax({
	                    url: "${pageContext.request.contextPath}/api/manage/admin/counts.do",
	                    method: 'GET',
	                    data: searchVO,
	                    dataType: 'JSON',
	                    async: false,
	                    success: function(data) {
	                    	totalPages = data;
	                    	console.log(totalPages);
	                    	$(".fc_all").text(JSON.stringify(data)); 
	                    },
	                    error: function(xhr, status, error) {
	                        console.error("Error fetching data: " + error);
	                    }
	                });//ajax
	        	}//function
	        	
	        	$("#btn-reset").click(function(e){
	        		e.preventDefault();
	        		$("#keyword").val('');
	        	});//click
	        	
	        	$("#btn-search").click(function(e){
	        		e.preventDefault();
	        		updateAdminList(false);
	        	});//click
	            
	            $('.pagination').on('click', '.page-link', function(e) {
	                
	                e.preventDefault();
	                var clickedPage = $(this).data('page');
	                if (clickedPage) {
	                    currentPage = clickedPage;
	                    startNum = itemsPerPage * (currentPage - 1) + 1;
	                    updateAdminList(false);
	                } else if ($(this).attr('id') === 'prev-page') {
	                    if (currentPage > 1) {
	                        currentPage--;
	                        startNum = itemsPerPage * (currentPage - 1) + 1;
	                        updateAdminList(false);
	                    }
	                } else if ($(this).attr('id') === 'next-page') {
	                    if (currentPage < Math.ceil(totalPages / itemsPerPage)) {
	                        currentPage++;
	                        startNum = itemsPerPage * (currentPage - 1) + 1;
	                        updateAdminList(false);
	                    }
	                }
	        	
	        	//resetForm();
	    	});//function
	            
	         // 페이지네이션 업데이트
	            function updatePagination() {
	         		var currentGroup = Math.ceil(currentPage / showPages);
	            	var startPage = (currentGroup - 1) * showPages + 1;
	                var paginationHtml = '';
	                var endPage = Math.min(Math.ceil(totalPages / itemsPerPage) , startPage + showPages - 1);
	                paginationHtml += '<li class="page-items' + (currentPage === 1 ? ' disabled' : '') + '">';
	                paginationHtml += '<a class="page-link" href="#" aria-label="Previous" id="prev-page">';
	                paginationHtml += '<span aria-hidden="true">&laquo;</span></a></li>';

	                for (var i = startPage; i <= endPage; i++) {
	                    paginationHtml += '<li class="page-items' + (i === currentPage ? ' active' : '') + '">';
	                    paginationHtml += '<a class="page-link" href="#" data-page="' + i + '">' + i + '</a></li>';
	                }

	                paginationHtml += '<li class="page-items' + (currentPage === Math.ceil(totalPages / itemsPerPage) ? ' disabled' : '') + '">';
	                paginationHtml += '<a class="page-link" href="#" aria-label="Next" id="next-page">';
	                paginationHtml += '<span aria-hidden="true">&raquo;</span></a></li>';

	                $('.pagination').html(paginationHtml);
	            }//function
	    	
	});//ready
</script>
<!-- golgolz start -->
<link href="http://localhost//recruit-app/assets/css/pagenation.css" rel="stylesheet" />
<link href="http://localhost//recruit-app/assets/css/manage/order/admin.css" rel="stylesheet" />
<link href="http://localhost//recruit-app/assets/css/manage/order/reset.css" rel="stylesheet" />
<link href="http://localhost/recruit-app/assets/css/manage/goods/goods.css" rel="stylesheet" />
<link href="http://localhost/recruit-app/assets/css/manage/goods/default.css" rel="stylesheet" />
<!-- golgolz end -->
</head>
<body>
	<jsp:include page="../../assets/layout/admin/header.jsp" />
	<main
		class="main-content position-relative max-height-vh-100 h-100 border-radius-lg ps--active-y ps--active-x">
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
										<input type="text" id="keyword" name="keyword" value="${ param.keyword }" class="frm_input" size="30">
									</td>
								</tr>
							</tbody>
						</table>
					</div>
					<div class="btn_confirm">
						<input type="button" value="검색" id="btn-search" class="btn btn-secondary btn-sm"> 
						<input type="button" value="초기화" id="btn-reset" class="btn btn-outline-secondary btn-sm">
					</div>
				</form>
				<div class="local_ov mart30">
					<div class="alignRight" style="text-align: right;">
						<input type="button" id="addAdminBtn" value="관리자 등록" class="btn btn-outline-success btn-sm float-right" style="font-weight: bold; margin:0px auto;" />
	        		</div>	
					전체 : <b class="fc_all"></b>건 중 <b class="fc_result fc_red"></b>건 조회
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
						</colgroup>
						<thead>
						<tr>
							<th scope="col">번호</th>
							<th scope="col">직책</th>
							<th scope="col">아이디</th>
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
						</tbody>
					</table>
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
				          <div class="mb-3">
				            <label for="addAdminId" class="form-label">관리자 ID</label>
				            <input type="email" class="form-control" id="addAdminId" name="adminId" maxlength="30" style="margin-right:5px; border: 1px solid #dedede; font-size: 15px; padding-left: 5px;">
				          </div>
				          <div class="mb-3">
				            <label for="addPassword" class="form-label">비밀번호</label>
				            <input type="password" class="form-control" id="addPassword" name="password" maxlength="16" style="margin-right:5px; border: 1px solid #dedede; font-size: 15px; padding-left: 5px;">
				          </div>
				          <div class="mb-3">
				            <label for="addPasswordCon" class="form-label">비밀번호 확인</label>
				            <input type="password" class="form-control" id="addPasswordCon" maxlength="16" style="margin-right:5px; border: 1px solid #dedede; font-size: 15px; padding-left: 5px;">
				          </div>
				          <div class="mb-3">
				            <label class="form-label">권한 부여</label>
				            <div class="form-check">
				              <input class="addCheckbox" name="user" type="checkbox" value="user" id="user">
				              <label class="form-check-label" for="user">사용자 관리</label>
				            </div>
				            <div class="form-check">
				              <input class="addCheckbox" name="company" type="checkbox" value="company" id="company">
				              <label class="form-check-label" for="company">기업 관리</label>
				            </div>
				            <div class="form-check">
				              <input class="addCheckbox" name="recruit" type="checkbox" value="recruit" id="recruit">
				              <label class="form-check-label" for="recruit">공고 관리</label>
				            </div>
				            <div class="form-check">
				              <input class="addCheckbox" name="review" type="checkbox" value="review" id="review">
				              <label class="form-check-label" for="review">리뷰 관리</label>
				            </div>
				            <div class="form-check">
				              <input class="addCheckbox" name="qna" type="checkbox" value="qna" id="qna">
				              <label class="form-check-label" for="qna">문의 관리</label>
				            </div>
				            <div class="form-check">
				              <input class="addCheckbox" name="notice" type="checkbox" value="notice" id="notice">
				              <label class="form-check-label" for="notice">공지 관리</label>
				            </div>
				          </div>
				      </div>
				      <div class="modal-footer" >
				        <button type="button" class="btn btn-outline-success btn-sm float-right" id="addAdmin" style="text-align: center; margin: 5px; width:80px; ">등록</button>
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
				        <form id="modifyAdminFrm" action="modifyAdmin.do" method="post">
				          <div class="mb-3">
				            <label for="modifyAdminId" class="form-label">관리자 ID</label>
				            <input type="email" class="form-control" id="modifyAdminId" name="adminId" maxlength="30" style="margin-right:5px; border: 1px solid #dedede; font-size: 15px; padding-left: 5px;">
				            <input type="hidden" class="form-control" id="defaultAdminId" name="adminId" maxlength="30" style="margin-right:5px; border: 1px solid #dedede; font-size: 15px; padding-left: 5px;">
				          </div>
				          <div class="mb-3">
				            <label class="form-label">권한 부여</label>
				            <div class="form-check">
				              <input class="modifyCheckbox" name="user" type="checkbox" value="user" id="modifyUser">
				              <label class="form-check-label" for="modifyUser">사용자 관리</label>
				            </div>
				            <div class="form-check">
				              <input class="modifyCheckbox" name="company" type="checkbox" value="company" id="modifyCompany">
				              <label class="form-check-label" for="modifyCompany">기업 관리</label>
				            </div>
				            <div class="form-check">
				              <input class="modifyCheckbox" name="recruit" type="checkbox" value="recruit" id="modifyRecruit">
				              <label class="form-check-label" for="modifyRecruit">공고 관리</label>
				            </div>
				            <div class="form-check">
				              <input class="modifyCheckbox" name="review" type="checkbox" value="review" id="modifyReview">
				              <label class="form-check-label" for="modifyReview">리뷰 관리</label>
				            </div>
				            <div class="form-check">
				              <input class="modifyCheckbox" name="qna" type="checkbox" value="qna" id="modifyQna">
				              <label class="form-check-label" for="modifyQna">문의 관리</label>
				            </div>
				            <div class="form-check">
				              <input class="modifyCheckbox" name="notice" type="checkbox" value="notice" id="modifyNotice">
				              <label class="form-check-label" for="modifyNotice">공지 관리</label>
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
													<li class="page-items">
														<a class="page-link" href="#" aria-label="Previous" id="prev-page">
												            <span aria-hidden="true">&laquo;</span>
												        </a>
													</li>
													<li class="page-items"><a class="page-link" href="#" data-page="1">1</a></li>
													<li class="page-items"><a class="page-link" href="#" data-page="2">2</a></li>
													<li class="page-items"><a class="page-link" href="#" data-page="3">3</a></li>
													<li class="page-items">
														<a class="page-link" href="#" aria-label="Next" id="next-page">
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
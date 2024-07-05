<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" info=""%>
<!DOCTYPE html>
<html>
<head>
<jsp:include page="../../assets/layout/admin/lib.jsp" />
<script src="https://code.jquery.com/jquery-3.7.1.js"></script>
<script src="https://code.jquery.com/ui/1.13.3/jquery-ui.js"></script>
<link rel="stylesheet" href="https://code.jquery.com/ui/1.13.3/themes/base/jquery-ui.css">
<script src="http://localhost/recruit-app/assets/js/admin/datepicker-ko.js"></script>
<script type="text/javascript">
	$(function(){
		var startNum = 1;
		var endNum = startNum + itemsPerPage;
		var itemsPerPage = 10;
		var showPages = 3;
		var totalPages = 0;
		var currentPage = 1;
		
		//초기로딩
	    updateUserList(true);
		
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
	    	
	    	function updateUserList(isFirst) {
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
		            url: "${pageContext.request.contextPath}/api/manage/users.do",
		            method: 'GET',
		            data: searchVO,
		            dataType: 'JSON',
		            success: function(data) {
		                populateTable(data);
		                countUserList(isFirst);
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
	    	
	    	function populateTable(userList) {
	            var tableBody = $("#sodr_list tbody");
	            tableBody.empty();

	            $.each(userList, function(index, userInfo) {
	                var row = $('<tr>')
	                    .addClass('list0')
	                    .attr('data-user-id',userInfo.userId);
	                
	                row.append($('<td>').text(index + startNum))
	                   .append($('<td>').text(userInfo.name))
	                   .append($('<td>').text(userInfo.userId))
	                   .append($('<td>').text(userInfo.phone))
	                   .append($('<td>').text(userInfo.signupDate))
	                   .append($('<td>').html('<input type="button" value="상세조회" class="btn btn-outline-secondary btn-sm" style="font-weight: bold; margin:0px auto;"/>'));

	                tableBody.append(row);
	            });//each
	    	}//function
	          
	            function getSearchVO() {
	        	    return {
	        	    	category: $("select[name='category']").val(),
	        	        keyword: $("input[name='keyword']").val(),
	        	        signupDateStart: $("#start_date_first").val() || undefined,
	        	        signupDateEnd: $("#end_date_first").val() || undefined,
	        	        startNum: startNum,
	        	        endNum: startNum + itemsPerPage - 1
	        	    };
	        	}//function
	        	
	            
	            function countUserList(searchVO){
	        		$.ajax({
	                    url: "${pageContext.request.contextPath}/api/manage/user/counts.do",
	                    method: 'GET',
	                    data: searchVO,
	                    dataType: 'JSON',
	                    async: false,
	                    success: function(data) {
	                    	totalPages = data;
	                    	$(".fc_all").text(JSON.stringify(data)); 
	                    },
	                    error: function(xhr, status, error) {
	                        console.error("Error fetching data: " + error);
	                    }
	                });//ajax
	        	}//function
	        	
	        	$("#btn-reset").click(function(e){
	        		e.preventDefault();
	        		$(".frm_input").val('');
	        	});//click
	        	
	        	$("#btn-search").click(function(e){
	        		e.preventDefault();
	        		updateUserList(false);
	        	});//click
	            
	            $('.pagination').on('click', '.page-link', function(e) {
	                
	                e.preventDefault();
	                var clickedPage = $(this).data('page');
	                if (clickedPage) {
	                    currentPage = clickedPage;
	                    startNum = itemsPerPage * (currentPage - 1) + 1;
	                    updateUserList(false);
	                } else if ($(this).attr('id') === 'prev-page') {
	                    if (currentPage > 1) {
	                        currentPage--;
	                        startNum = itemsPerPage * (currentPage - 1) + 1;
	                        updateUserList(false);
	                    }
	                } else if ($(this).attr('id') === 'next-page') {
	                    if (currentPage < Math.ceil(totalPages / itemsPerPage)) {
	                        currentPage++;
	                        startNum = itemsPerPage * (currentPage - 1) + 1;
	                        updateUserList(false);
	                    }
	                }
	        	
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
						<input type="button" value="검색" id="btn-search" class="btn btn-secondary btn-sm"> 
						<input type="button" value="초기화" id="btn-reset" class="btn btn-outline-secondary btn-sm">
					</div>
				</form>
				<div class="local_ov mart30">
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
						</tbody>
					</table>
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
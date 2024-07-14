<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" info=""%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="https://code.jquery.com/ui/1.13.3/themes/base/jquery-ui.css">
<jsp:include page="../../../assets/layout/admin/lib.jsp" />
<link rel="stylesheet" href="/resources/demos/style.css">
<script src="https://code.jquery.com/jquery-3.7.1.js"></script>
<script src="https://code.jquery.com/ui/1.13.3/jquery-ui.js"></script>
<script src="http://localhost/recruit-app/assets/js/admin/datepicker-ko.js"></script>
<script type="text/javascript">
	var startNum = 1;
	var endNum = startNum + itemsPerPage;
	var itemsPerPage = 5;
	var showPages = 3;
	var totalPages = 0;
	var currentPage = 1;
	
	$(function(){
		$.datepicker.setDefaults($.datepicker.regional['ko']);
    	$("#recruit_menu").addClass("bg-gradient-primary");
    	
    	$("#start_date").datepicker({
    		showOtherMonths: true,
    	    selectOtherMonths: true,
    	    showButtonPanel: true,
    	    dateFormat: "yy-mm-dd",
            onSelect: function(selectedDate) {
                $("#end_date").datepicker("option", "minDate", selectedDate);
            }
    	});
    	
    	$("#end_date").datepicker({
  	    	showOtherMonths: true,
  	    	selectOtherMonths: true,
  	    	showButtonPanel: true,
  	    	dateFormat: "yy-mm-dd"
  		});
    	
    	$("#btn-search").click(function(e){
    		e.preventDefault();
    		updateResumeList(false);
    	});
    	
    	$("#btn-reset").click(function(e){
    		e.preventDefault();
    		resetForm();
    	});
    	
    	var summary = createSummaryVO();
    	
    	$.ajax({
    		url: "${pageContext.request.contextPath}/api/manage/recruit/summary.do",
    		method: 'POST',
            data: JSON.stringify(summary),
            contentType: "application/json; charset=utf-8",
            dataType: 'json',
            success: function(data) {
            	//console.log(data);
            	updateStatus(data);
            },
            error: function(xhr, status, error) {
                console.error("Error fetching data: " + error);
            }
    	});
		
    	$('.pagination').on('click', '.page-link', function(e) {
            e.preventDefault();
            var clickedPage = $(this).data('page');
            if (clickedPage) {
                currentPage = clickedPage;
                startNum = itemsPerPage * (currentPage - 1) + 1;
                updateResumeList();
            	updateResumeCount();
                updatePagination();
            } else if ($(this).attr('id') === 'prev-page') {
                if (currentPage > 1) {
                    currentPage--;
                    startNum = itemsPerPage * (currentPage - 1) + 1;
                    updateResumeList();
                	updateResumeCount();
                    updatePagination();
                }
            } else if ($(this).attr('id') === 'next-page') {
                if (currentPage < Math.ceil(totalPages / itemsPerPage)) {
                    currentPage++;
                    startNum = itemsPerPage * (currentPage - 1) + 1;
                    updateResumeList();
                	updateResumeCount();
                    updatePagination();
                }
            }
        });
    	
    	updateResumeList();
        updatePagination();
	});
	
	function updateResumeList(){
    	var searchVO = createSearchVO();
    	//console.log(searchVO);
		$.ajax({
    		url: "${pageContext.request.contextPath}/api/manage/resumes.do",
            method: 'GET',
            data: searchVO,
            dataType: 'JSON',
            success: function(data) {
            	//console.log(data);
            	populateTable(data);
                if(!(data && data.length > 0)){
                    $("#sodr_list tbody").html('<tr><td colspan="10" style="font-size: 16px; font-weight: bold;">검색 결과가 없습니다.</td></tr>');
                }
            },
            error: function(xhr, status, error) {
                console.error("Error fetching data: " + error);
                $("#sodr_list tbody").html('<tr><td colspan="10" style="font-size: 16px; font-weight: bold;">데이터를 불러오는 데 실패했습니다.</td></tr>');
            }
    	});
		
		$.ajax({
    		url: "${pageContext.request.contextPath}/api/manage/resume/counts.do",
            method: 'GET',
            data: searchVO,
            dataType: 'JSON',
            success: function(data) {
            	totalPages = data;
            },
            error: function(xhr, status, error) {
                console.error("Error fetching data: " + error);
                $("#sodr_list tbody").html('<tr><td colspan="10" style="font-size: 16px; font-weight: bold;">데이터를 불러오는 데 실패했습니다.</td></tr>');
            }
    	});
	}
	
	function populateTable(data) {
	    var tableBody = document.querySelector("#sodr_list tbody");
	    
	    tableBody.innerHTML = "";
	    for (var i = 0; i < data.length; i++) {
	        var item = data[i];
	        var row = document.createElement("tr");
	        row.className = "list0";
	        
	        row.innerHTML = 
	            "<td>" + (i + 1) + "</td>" +
	            "<td>" + item.userName + "</td>" +
	            "<td>" + item.applyDate + "</td>" +
	            "<td>" + item.resumeTitle + "</td>" +
	            "<td>" + item.career + "</td>" +
	            "<td>" + item.addr + "</td>" +
	            "<td>" + item.docPass + "</td>" +
	            "<td>" + item.finalPass + "</td>" +
	            "<td>" +
	                "<input type='button' value='바로가기' class='btn btn-outline-secondary btn-sm' " +
	                "style='font-weight: bold; margin: 0px auto;' " +
	                "onclick='location.href=\"http://localhost/recruit-app/manage/resumes/detail.do?id=" + item.resumeId + "&recruitNum=${recruitNum}\"' />" +
	            "</td>";
	        
	        tableBody.appendChild(row);
	    }
	}
	
	function createSearchVO() {
	    var searchVO = {};
    	searchVO.recruitId = ${recruitNum};
    	searchVO.startNum = startNum;
    	searchVO.endNum = startNum + itemsPerPage - 1;
	    searchVO.category = document.querySelector('select[name="category"]').value;
	    searchVO.keyword = document.querySelector('input[name="keyword"]').value;
	    searchVO.startDate = document.getElementById('start_date').value;
	    searchVO.endDate = document.getElementById('end_date').value;
	    var deliveryRadios = document.querySelectorAll('input[name="delivery"]');
	    for (var i = 0; i < deliveryRadios.length; i++) {
	        if (deliveryRadios[i].checked) {
	            searchVO.career = deliveryRadios[i].value;
	            break;
	        }
	    }

	    var purchaseRadios = document.querySelectorAll('input[name="purchase"]');
	    for (var i = 0; i < purchaseRadios.length; i++) {
	        if (purchaseRadios[i].checked) {
	            searchVO.endSchool = purchaseRadios[i].value;
	            break;
	        }
	    }

	    return searchVO;
	}
	
	function createSummaryVO(){
		return{
			recruitNum: parseInt("${recruitNum}"),
			companyCode: "${companyCode}"
		};
	}
	
	function resetForm() {
        $('select[name="category"]').prop('selectedIndex', 0);
        $('input[name="keyword"]').val('');
        $('#start_date, #end_date, #date').val('');
        $('input[name="delivery"][value="0"]').prop('checked', true);
        $('input[name="purchase"][value=""]').prop('checked', true);
    }
	
	function updatePagination() { 
 		var currentGroup = Math.ceil(currentPage / showPages);
    	var startPage = (currentGroup - 1) * showPages + 1;
        var paginationHtml = '';
        var endPage = Math.min(Math.ceil(totalPages / itemsPerPage) , startPage + showPages - 1);
        //console.log("end : ", endPage);
        if(endPage == 0){
        	return;
        }
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
    }
	
	function updateStatus(data) {
	    var statusDiv = document.getElementById('status');
	    var companyName = escapeHtml(data.companyName || '');
	    var recruitTitle = escapeHtml(data.recruitTitle || '');
	    
	    statusDiv.innerHTML = 
	        '<div style="font-weight: bold;">기업명 : ' + companyName + '</div>' +
	        '<div style="font-weight: bold;">공고명 : ' + recruitTitle + '</div>';
	}

	function escapeHtml(unsafe) {
	    return unsafe
	         .replace(/&/g, "&amp;")
	         .replace(/</g, "&lt;")
	         .replace(/>/g, "&gt;")
	         .replace(/"/g, "&quot;")
	         .replace(/'/g, "&#039;");
	}
</script>
<!-- golgolz start -->
<link href="http://localhost//recruit-app/assets/css/pagenation.css" rel="stylesheet" />
<link href="http://localhost//recruit-app/assets/css/manage/order/admin.css" rel="stylesheet" />
<link href="http://localhost//recruit-app/assets/css/manage/order/reset.css" rel="stylesheet" />
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
												<option value="0">이름</option>
												<option value="1">제목</option>
												<option value="2">내용</option>
												<option value="3">거주지</option>
										</select> 
										<input type="text" name="keyword" value="" class="frm_input" size="30">
									</td>
								</tr>
								<tr>
									<th scope="row">지원일</th>
              						<td class="box text">
              							<input type="hidden" id="date" name="date" value="" />
              							<input type="text" id="start_date" class="frm_input" size="10"> - 
              							<input type="text" id="end_date" class="frm_input" size="10"> 
              						</td>
								</tr>
								<tr>
									<th scope="row">경력</th>
									<td>
										<label class="od_status">
											<input type="radio" name="delivery" value="0" checked> 전체
										</label> 
										<label class="od_status">
											<input type="radio" name="delivery" value="1"> 신입
										</label> 
										<label class="od_status">
											<input type="radio" name="delivery" value="2"> 경력
										</label> 
									</td>
								</tr>
								<tr>
									<th scope="row">최종 학력</th>
									<td>
										<label class="od_status">
											<input type="radio" name="purchase" value="" checked> 전체
										</label>
										<label class="od_status">
											<input type="radio" name="purchase" value="1"> 고등학교
										</label> 
										<label class="od_status">
											<input type="radio" name="purchase" value="2"> 대학교(2,3년제)
										</label> 
										<label class="od_status">
											<input type="radio" name="purchase" value="3"> 대학교(4년제)
										</label> 
										<label class="od_status">
											<input type="radio" name="purchase" value="4"> 대학원(석사)
										</label> 
										<label class="od_status">
											<input type="radio" name="purchase" value="5"> 대학원(박사)
										</label> 
									</td>
								</tr>
							</tbody>
						</table>
					</div>
					<div class="btn_confirm">
					    <input type="submit" id="btn-search" value="검색" class="btn btn-secondary btn-sm"/>
						<input type="submit" id="btn-reset" value="초기화" class="btn btn-outline-secondary btn-sm"/>
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
						</tbody>
					</table>
				</div>
				<div class="alignCenter" style="margin-top:54px;">
					<ul class="pagination" style="justify-content: center;">
						<!-- <li class="page-items">
							<a class="page-link" href="#" aria-label="Previous" id="prev-page">
					            <span aria-hidden="true">&laquo;</span>
					        </a>
						</li>
						<li class="page-items"><a class="page-link" href="#" data-page="1">1</a></li></li>
						<li class="page-items"><a class="page-link" href="#" data-page="2">2</a></li></li>
						<li class="page-items"><a class="page-link" href="#" data-page="3">3</a></li></li>
						<li class="page-items">
							<a class="page-link" href="#" aria-label="Next" id="next-page">
					            <span aria-hidden="true">&raquo;</span>
					        </a>
						</li> -->
					</ul>
				</div>	
			</div>
		</div>
	</main>
	<!-- golgolz end -->
</body>
</html>
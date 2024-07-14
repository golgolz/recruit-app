<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" info=""%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="https://code.jquery.com/ui/1.13.3/themes/base/jquery-ui.css">
<jsp:include page="../../assets/layout/admin/lib.jsp" />
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
    	
    	$("#start_date_first").datepicker({
    		showOtherMonths: true,
    	    selectOtherMonths: true,
    	    showButtonPanel: true,
    	    dateFormat: "yy-mm-dd",
            onSelect: function(selectedDate) {
                $("#end_date_first").datepicker("option", "minDate", selectedDate);
                $("#start_date_sec").datepicker("option", "minDate", selectedDate);
            }
    	});
    	
    	$("#end_date_first").datepicker({
  	    	showOtherMonths: true,
  	    	selectOtherMonths: true,
  	    	showButtonPanel: true,
  	    	dateFormat: "yy-mm-dd",
  	        onSelect: function(selectedDate) {
  	            var startDate = $("#start_date_first").datepicker("getDate");
  	            var endDate = $(this).datepicker("getDate");
  	            
  	            if (startDate && endDate && startDate > endDate) {
  	                alert("종료 날짜는 시작 날짜 이후여야 합니다.");
  	                $(this).val("");
  	                return false;
  	            }
                $("#start_date_sec").datepicker("option", "minDate", selectedDate);
  	        }
  		});
    	
    	$("#start_date_sec").datepicker({
    		showOtherMonths: true,
    	    selectOtherMonths: true,
    	    showButtonPanel: true,
    	    dateFormat: "yy-mm-dd",
            onSelect: function(selectedDate) {
                $("#end_date_sec").datepicker("option", "minDate", selectedDate);
            }
    	});
    	
    	$("#end_date_sec").datepicker({
  	    	showOtherMonths: true,
  	    	selectOtherMonths: true,
  	    	showButtonPanel: true,
  	    	dateFormat: "yy-mm-dd"
  		});
    	
    	$("#btn-reset").click(function(e){
    		e.preventDefault();
    		resetForm();
    	});
    	
    	$("#btn-search").click(function(e){
    		e.preventDefault();
        	updateRecruitList(false);
    	});
    	
    	$('.pagination').on('click', '.page-link', function(e) {
            e.preventDefault();
            var clickedPage = $(this).data('page');
            if (clickedPage) {
                currentPage = clickedPage;
                startNum = itemsPerPage * (currentPage - 1) + 1;
                updateRecruitList(false);
            } else if ($(this).attr('id') === 'prev-page') {
                if (currentPage > 1) {
                    currentPage--;
                    startNum = itemsPerPage * (currentPage - 1) + 1;
                    updateRecruitList(false);
                }
            } else if ($(this).attr('id') === 'next-page') {
                if (currentPage < Math.ceil(totalPages / itemsPerPage)) {
                    currentPage++;
                    startNum = itemsPerPage * (currentPage - 1) + 1;
                    updateRecruitList(false);
                }
            }
        }); 
    	
    	updateRecruitList(true);
    	resetForm();
	});

	function updateRecruitList(isFirst) {
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
            url: "${pageContext.request.contextPath}/api/manage/recruits.do",
            method: 'GET',
            data: searchVO,
            dataType: 'JSON',
            success: function(data) {
                populateTable(data);
                countRecruits(searchVO);
                updatePagination();
                if(!(data && data.length > 0)){
                    $("#sodr_list tbody").html('<tr><td colspan="10" style="font-size: 16px; font-weight: bold;">검색 결과가 없습니다.</td></tr>');
                }
            },
            error: function(xhr, status, error) {
                console.error("Error fetching data: " + error);
                $("#sodr_list tbody").html('<tr><td colspan="10" style="font-size: 16px; font-weight: bold;">데이터를 불러오는 데 실패했습니다.</td></tr>');
            }
        });
    }

    function populateTable(recruits) {
        var tableBody = $("#sodr_list tbody");
        tableBody.empty();

        $.each(recruits, function(index, recruit) {
            var row = $('<tr>')
                .addClass('list0')
                .attr('data-href', 'http://localhost/recruit-app/manage/recruit/detail.do?id=' + recruit.id);
            
            row.append($('<td>').text(index + startNum))
               .append($('<td>').text(recruit.companyCode))
               .append($('<td>').text(recruit.companyName))
               .append($('<td>').text(recruit.inputDate))
               .append($('<td>').text(recruit.endDate))
               .append($('<td>').text(recruit.title))
               .append($('<td>').text(recruit.careerStandard))
               .append($('<td>').text(recruit.hireCategory))
               .append($('<td>').text(recruit.workPlace))
               .append($('<td>').html('<input type="button" value="바로가기" class="btn btn-outline-secondary btn-sm goResumes" style="font-weight: bold; margin: 0px auto;" data-recruit-id="' + recruit.id + '" data-company-code="' + recruit.companyCode +'" />'));

            tableBody.append(row);
        });

        $('.list0').on('click', function(e) {
            if (!$(e.target).is('td:last-child, td:last-child *')) {
                window.location.href = $(this).data('href');
            }
        });

        $('.goResumes').on('click', function(e) {
            e.stopPropagation();
            var recruitId = $(this).data('recruit-id');
            var companyCode = $(this).data('company-code');
            location.href = "http://localhost/recruit-app/manage/resumes.do?recruitNum=" + recruitId + "&companyCode=" + companyCode;
        });

        var totalCount = tableBody.children().length;
        var $totalCountElement = $(".local_ov .fc_red");
        $totalCountElement.text(totalCount);
    }
    
    function resetForm() {
        $("input[name='page']").val("1");
        $("select[name='category']").val("0");
        $("input[name='keyword']").val("");
        $(".frm_input[id^='start_date'], .frm_input[id^='end_date']").val("");
        $("#date").val("");
        $("input[name='career'][value='0']").prop("checked", true);
        $("input[name='work-type'][value='0']").prop("checked", true);
    }
	
	function getSearchVO() {
		var careerType = "";
		var employmentType = "";
		
		switch($("input[name='career']:checked").val()) {
	        case "1":
	        	careerType = "신입";
	            break;
	        case "2":
	        	careerType = "경력";
	            break;
	        default:
	        	careerType = undefined;
	        	break;
		}

		switch($("input[name='work-type']:checked").val()) {
	        case "1":
	        	employmentType = "정규직";
	            break;
	        case "2":
	        	employmentType = "계약직";
	            break;
	        default:
	        	employmentType = undefined;
	        	break;
		}
		
	    return {
	        category: $("select[name='category']").val(),
	        keyword: $("input[name='keyword']").val(),
	        inputDateStart: $("#start_date_first").val() || undefined,
	        inputDateEnd: $("#end_date_first").val() || undefined,
	        endDateStart: $("#start_date_sec").val() || undefined,
	        endDateEnd: $("#end_date_sec").val() || undefined,
	        career: careerType,
	        employmentType: employmentType,
	        startNum: startNum,
	        endNum: startNum + itemsPerPage - 1
	    };
	}
	
	function countRecruits(searchVO){
		$.ajax({
            url: "${pageContext.request.contextPath}/api/manage/recruit/counts.do",
            method: 'GET',
            data: searchVO,
            dataType: 'JSON',
            async: false,
            success: function(data) {
            	totalPages = data;
            },
            error: function(xhr, status, error) {
                console.error("Error fetching data: " + error);
            }
        });
	}

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
    }
</script>
<!-- golgolz start -->
<link href="http://localhost//recruit-app/assets/css/pagenation.css" rel="stylesheet" />
<link href="http://localhost//recruit-app/assets/css/manage/order/admin.css" rel="stylesheet" />
<link href="http://localhost//recruit-app/assets/css/manage/order/reset.css" rel="stylesheet" />
<style>
.list0 {
	cursor: pointer;
	transition: background-color 0.3s ease;
}

.list0:hover {
	background-color: #ededed;
}

/* 마지막 열(바로가기 버튼)에는 호버 효과를 제외 */
.list0:hover td:last-child {
	background-color: transparent;
}

.page-item{
	margin-right: 3px;
}
</style>
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
              							<input type="text" id="start_date_first" class="frm_input" size="10" readonly> - 
              							<input type="text" id="end_date_first" class="frm_input" size="10" readonly> 
              						</td>
								</tr>
								<tr>
									<th scope="row">공고종료일</th>
              						<td class="box text">
              							<input type="text" id="start_date_sec" class="frm_input" size="10" readonly> - 
              							<input type="text" id="end_date_sec" class="frm_input" size="10" readonly> 
              						</td>
								</tr>
								<tr>
									<th scope="row">경력</th>
									<td>
										<label class="od_status">
											<input type="radio" name="career" value="0"${param.career eq '0' ? " checked" : "" }> 전체
										</label> 
										<label class="od_status">
											<input type="radio" name="career" value="1"${param.career eq '1' ? " checked" : "" }> 신입
										</label> 
										<label class="od_status">
											<input type="radio" name="career" value="2"${param.career eq '2' ? " checked" : "" }> 경력
										</label> 
									</td>
								</tr>
								<tr>
									<th scope="row">근무형태</th>
									<td>
										<label class="od_status">
											<input type="radio" name="work-type" value="0" ${param.work-type eq '0' ? " checked" : "" }> 전체
										</label>
										<label class="od_status">
											<input type="radio" name="work-type" value="1"${param.work-type eq '1' ? " checked" : "" }> 정규직
										</label> 
										<label class="od_status">
											<input type="radio" name="work-type" value="2"${param.work-type eq '2' ? " checked" : "" }> 계약직
										</label>
									</td>
								</tr>
							</tbody>
						</table>
					</div>
					<div class="btn_confirm">
					    <input type="button" value="검색" class="btn btn-secondary btn-sm" id="btn-search"/>
						<input type="button" value="초기화" class="btn btn-outline-secondary btn-sm" id="btn-reset"/>
					</div>
				</form>
				<div class="local_ov mart30">
					전체 : <b class="fc_red">3</b> 건 조회
				</div>
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
						</tbody>
					</table>
				</div>
				<div class="alignCenter">
          			<table cellpadding="0" cellspacing="0" border="0" width="100%">
            			<tbody>
              				<tr>
                				<td align="right">
									<input type="button" value="등록하기" class="btn btn-outline-success btn-sm float-right goRegist" style="font-weight: bold; margin: 10px auto;" 
									onclick="location.href='${pageContext.request.contextPath}/manage/recruit/detail.do'"/>
                				</td>
              				</tr>
            			</tbody>
          			</table>
					<ul class="pagination" style="justify-content: center;">
						<li class="page-items">
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
						</li>
					</ul>
				</div>	
			</div>
		</div>
	</main>
	<!-- golgolz end -->
</body>
</html>
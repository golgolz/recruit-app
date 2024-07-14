<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" info=""%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="https://code.jquery.com/ui/1.13.3/themes/base/jquery-ui.css">
<jsp:include page="../../assets/layout/admin/lib.jsp" />
<script src="https://code.jquery.com/ui/1.13.3/jquery-ui.js"></script>
<script src="http://localhost/recruit-app/assets/js/admin/datepicker-ko.js"></script>
<!-- golgolz start -->
<link href="http://localhost/recruit-app/assets/css/manage/goods/general.css" rel="stylesheet" />
<link href="http://localhost/recruit-app/assets/css/manage/goods/goods.css" rel="stylesheet" />
<link href="http://localhost/recruit-app/assets/css/manage/goods/default.css" rel="stylesheet" />
<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.js"></script>
<link rel="stylesheet" href="//cdnjs.cloudflare.com/ajax/libs/timepicker/1.3.5/jquery.timepicker.min.css">
<link rel="stylesheet" href="http://localhost/recruit-app/assets/css/manage/recruit/recruit.css">
<style>
input[type="number"]::-webkit-outer-spin-button,
input[type="number"]::-webkit-inner-spin-button {
    -webkit-appearance: none;
    margin: 0;
}
</style>
<script type="text/javascript">
	var selectedPositions = [];
	var selectedWorkDay = "주5일(월-금)";
	$(function() {
		$("#recruit_menu").addClass("bg-gradient-primary");

		$('#summernote').summernote({
			tabsize : 2,
			height : 300
		});

    	$("#end_date").datepicker({
    		showOtherMonths: true,
    	    selectOtherMonths: true,
    	    showButtonPanel: true,
    	    dateFormat: "yy-mm-dd"
    	});

		$(".position-chip").click(function() {
	        var value = $(this).data("value");
			var index = selectedPositions.indexOf(value);

	        if (index === -1) {
	            selectedPositions.push(value);
	            $(this).addClass("active");
	        } else {
	            selectedPositions.splice(index, 1);
	            $(this).removeClass("active");
	        }
		});

		$(".work-day-chip").click(function() {
			$('.work-day-chip').removeClass('active');
			$(this).toggleClass("active");

			selectedWorkDay = $(this).data("value");
		});

		$('#startTime').timepicker({
			timeFormat : 'H:mm',
			interval : 30,
			minTime : '00:00',
			maxTime : '23:30',
			defaultTime : '8',
			startTime : '8:00',
			dynamic : false,
			dropdown : true,
			scrollbar : true
		});

		$('#endTime').timepicker({
			timeFormat : 'H:mm',
			interval : 30,
			minTime : '00:00',
			maxTime : '23:30',
			defaultTime : '17',
			startTime : '17:00',
			dynamic : false,
			dropdown : true,
			scrollbar : true
		});
		
		$("#btn-register").click(function(){
		    var recruitVO = createRecruitVO();
			
			if (selectedPositions.length === 0) {
	            alert("최소 하나 이상의 포지션을 선택해주세요.");
	            return false;
	        }
			
			$.ajax({
		        url: "${pageContext.request.contextPath}/api/manage/recruit.do",
		        type: "POST",
		        contentType: "application/json; charset=utf-8",
		        data: JSON.stringify(recruitVO),
		        error: function(xhr) {
		            alert("등록에 실패했습니다.");
		        },
		        success: function(response) {
		        	if(response === "success"){
			            alert("등록에 성공했습니다.");
			            location.href="${pageContext.request.contextPath}/manage/recruit/recruits.do";
		        	}
		        }
		    });
		});
		
		$("#btn-update").click(function(){
		    if (confirm("공고를 수정하시겠습니까?")) {
			    var recruitVO = createRecruitVO();
			    recruitVO.id = $("#recruit_num").val();
			    
			    if (selectedPositions.length === 0) {
			        alert("최소 하나 이상의 포지션을 선택해주세요.");
			        return false;
			    }
			    
			    $.ajax({
			        url: "${pageContext.request.contextPath}/api/manage/recruit.do",
			        type: "PUT",
			        contentType: "application/json; charset=utf-8",
			        data: JSON.stringify(recruitVO),
			        error: function(xhr) {
			            alert("수정에 실패했습니다.");
			        },
			        success: function(response) {
			            if(response === "success"){
			                alert("수정에 성공했습니다.");
			                location.href="${pageContext.request.contextPath}/manage/recruit/recruits.do";
			            }
			        }
			    });
		    }
		});
		
		$("#btn-delete").click(function(){
		    if (confirm("정말로 이 채용공고를 삭제하시겠습니까?")) {
		        var recruitNum = $("#recruit_num").val();
			    $.ajax({
			        url: "${pageContext.request.contextPath}/api/manage/recruit.do?id=" + recruitNum,
			        type: "DELETE",
			        error: function(xhr) {
			            alert("삭제에 실패했습니다.");
			        },
			        success: function(response) {
			            if(response === "success"){
			                alert("삭제에 성공했습니다.");
			                location.href="${pageContext.request.contextPath}/manage/recruit/recruits.do";
			            }
			        }
			    });
		    }
		});
		
		$('#btn-search-company').click(function() {
	        var keyword = $('#company_keyword').val();
	        
	        $.ajax({
	            url: "${pageContext.request.contextPath}/api/manage/recruit/companies.do",  // 실제 엔드포인트 URL로 변경해주세요
	            type: "GET",
	            data: { keyword: keyword },
	            dataType: "JSON",
	            success: function(response) {
	            	alert("기업 검색 결과가 조회되었습니다. 기업을 선택해주세요.");
	    	        $('#company_name').text("");
	                var select = $("#company-select");
	                select.empty();
	                select.append('<option value="">검색 결과 조회하기</option>');

	                $.each(response, function(index, company) {
	                    select.append($('<option></option>')
	                        .attr('value', company.code)
	                        .text(company.name));
	                });
	                
	                if(response.length > 0) {
	                    select.show();
	                } else {
	                    select.hide();
	                }
	            },
	            error: function(xhr, status, error) {
	                console.error("Ajax request failed: " + status + ", " + error);
	            }
	        });
	    });

	    // select 값이 변경될 때 company_name과 company_code 업데이트
	    $('#company-select').change(function() {
	        var selectedOption = $(this).find('option:selected');
	        $('#company_name').text(selectedOption.text());
	        $('#company_code').val(selectedOption.val());
	    });
		
	    var recruitNum = <c:out value="${recruitNum}" default="null"/>;
	    if (recruitNum !== null) {
	        $.ajax({
	            url: "${pageContext.request.contextPath}/api/manage/recruit.do?id=" + recruitNum,
	            method: 'GET',
	            success: function(data) {
	                populateForm(data);
	                console.log(data);
	            },
	            error: function(xhr, status, error) {
	                console.error("Error fetching recruit data:", error);
	                alert("채용공고 데이터를 불러오는데 실패했습니다.");
	            }
	        });
	    }
	});
	
	function createRecruitVO(){
		var summernoteContent = $('#summernote').summernote('code');
	    return {
	        companyCode: $("#company_code").val(),
	        companyName: $("#company_name").val(),
	        position: selectedPositions.join(","),
	        title: $("#title").val(),
	        content: summernoteContent,
	        headcount: $("#headcount").val(),
	        endDate: $("#end_date").val(),
	        workType: $("input[name='work_type']:checked").val() || "",
	        workDay: selectedWorkDay,
	        workStartTime: $("#startTime").val(),
	        workEndTime: $("#endTime").val(),
	        workPlace: $("#work_place").val(),
	        salaryType: $("input[name='sal_type']:checked").val() || "",
	        salary: $("#sal").val(),
	        careerStandard: $("input[name='career_type']:checked").val() || "",
	        careerYears: parseInt($("#career_years").val(), 10),
	        eduStandard: $("input[name='edu_standard']:checked").val() || ""
	    };
	}
	
	function populateForm(data) {
	    // 기본 텍스트 필드
	    $('#recruit_num').val(data.id);
	    $('#company_name').text(data.companyName);
	    $('#company_code').val(data.companyCode);
	    $('#title').val(data.title);
	    $('#end_date').val(data.endDate);
	    $('#headcount').val(data.companyPeopleNum);
	    $('#work_place').val(data.workPlace);
	    $('#sal').val(data.salary);
	    $('#career_years').val(data.careerYears);

	    // 라디오 버튼
	    $(`input[name="sal_type"][value="${data.salaryType}"]`).prop('checked', true);
	    $(`input[name="career_type"][value="${data.careerType}"]`).prop('checked', true);
	    $(`input[name="edu_standard"][value="${data.eduStandard}"]`).prop('checked', true);
	    
	    var $exactMatch = $(`input[name="work_type"][value="${data.hireCategory}"]`);
	    var lowercaseHireCategory = data.hireCategory.toLowerCase();
	    var matchFound = false;
	    $('input[name="work_type"]').each(function() {
	        if ($(this).val().toLowerCase() === lowercaseHireCategory) {
	            $(this).prop('checked', true);
	            matchFound = true;
	            console.log("Case-insensitive match found and checked:", $(this).val());
	            return false; // 루프 중단
	        }
	    });

	    selectedPositions = [];
	    if (data.position) {
	        data.position.split(',').forEach(pos => {
	            selectedPositions.push(pos); 
	        });

		    $(".position-chip").each(function(){
		    	var chipValue = $(this).data("value");
	            if (selectedPositions.includes(chipValue)) {
	                $(this).addClass("active");
	            }
		    });
	    }
	    
	    // 근무 요일 (Chip)
	    $(".work-day-chip").removeClass("active");
	    $(".work-day-chip").each(function(){
	    	var chipValue = $(this).data("value");
            if (chipValue === data.workDay) {
                $(this).addClass("active");
            }
	    });

	    // 근무 시간
	    var workTime = data.workTime.split("~");
	    $('#startTime').val(workTime[0]);
	    $('#endTime').val(workTime[1]);

	    // Summernote 에디터
	    $('#summernote').summernote('code', data.content);

	    // 경력 관련 필드 처리
	    if (data.careerType === '경력') {
	        $('#career_years').prop('disabled', false);
	    } else {
	        $('#career_years').prop('disabled', true);
	    }
	}
</script>
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
					<h6 class="font-weight-bolder mb-0">채용 공고 상세</h6>
				</nav>
			</div>
		</nav>
		<div class="container-fluid">
			<!-- golgolz start -->
			<div id="contentcolumn" class="">
				<div class="contents">
					<form id="dataForm" name="dataForm" action="http://localhost/recruit-app/manage/common_process.jsp" method="post" enctype="multipart/form-data">
						<div class="subtitle">
							<img src="http://localhost/recruit-app/assets/images/manage/common/bul_subtitle.gif" />
							공고 정보
						</div>
						<input type="hidden" id="recruit_num" value="lee@daum_1" />
						<table class="tbstyleB" width="100%">
							<colgroup>
								<col width="15%" />
								<col width="85%" />
							</colgroup>
							<tbody>
								<tr>
									<td class="label">기업명</td>
									<td class="box text">
										<input type="text" id="company_keyword" name="company_keyword" placeholder="검색할 기업명을 입력해주세요." size="20" class="inputbox naver_shopping_prodName" />
										<input type="button" id="btn-search-company" class="btn btn-outline-success btn-sm" value="검색" />
								        <span style="font-weight:bold; margin-left: 20px;">검색 결과 : </span>
								        <select id="company-select" style="height: 28px;">
								            <option value="">기업을 선택하세요</option>
								        </select>
								        <span style="font-weight:bold; margin-left: 20px;">선택된 기업 : </span>
								        <span id="company_name"></span>
										<input type="hidden" id="company_code" name="company_code" value=""/>
										<!-- <input type="button" id="btn-register" class="btn btn-success btn-sm" value="조회" /> -->
									</td>
								</tr>
								<tr>
									<td class="label">공고 제목</td>
									<td class="box text">
										<input type="text" id="title" name="title" value="공고 제목을 입력해주세요." size="100" class="inputbox naver_shopping_prodName" />
									</td>
								</tr>
								<tr>
									<td class="label">모집 종료일</td>
									<td class="box text">
										<input type="text" id="end_date" name="end_date" value="2024-06-30" size="10" class="inputbox naver_shopping_prodName" />
									</td>
								</tr>
								<tr>
									<td class="label">모집 포지션</td>
									<td class="box text">
										<div class="chip-group">
											<div class="chip position-chip" data-value="BACKDEV">백엔드</div>
											<div class="chip position-chip" data-value="FRTDEV">프론트엔드</div>
											<div class="chip position-chip" data-value="EMBDEV">임베디드</div>
											<div class="chip position-chip" data-value="QAENG">QA</div>
											<div class="chip position-chip" data-value="INFENG">인프라</div>
											<div class="chip position-chip" data-value="DEVOPENG">DevOps</div>
											<!-- <button id="resetButton">초기화</button> -->
										</div>
									</td>
								</tr>
								<tr>
									<td class="label">모집 인원</td>
									<td class="box text">
										<input type="number" id="headcount" name="headcount" value="0" size="10" class="inputbox naver_shopping_prodName" /> 명
									</td>
								</tr>
							</tbody>
						</table>
						<div class="subtitle">
							<img src="http://localhost/recruit-app/assets/images/manage/common/bul_subtitle.gif" />
							근무 조건
						</div>
						<table class="tbstyleB" width="100%">
							<colgroup>
								<col width="15%" />
								<col width="85%" />
							</colgroup>
							<tbody>
								<tr>
									<td class="label">고용형태</td>
									<td class="box text">
										<input type="radio" name="work_type" value="정규직"/><label>정규직</label>
										<input type="radio" name="work_type" value="계약직"/><label>계약직</label>
									</td>
								</tr>
								<tr>
									<td class="label">근무 요일</td>
									<td class="box text">
										<div class="chip-group">
											<div class="chip work-day-chip" data-value="주5일(월-금)">주5일(월-금)</div>
											<div class="chip work-day-chip" data-value="주5일(스케줄)">주5일(스케줄)</div>
											<div class="chip work-day-chip" data-value="주4일">주4일</div>
											<!-- <button id="resetButton">초기화</button> -->
										</div>
									</td>
								</tr>
								<tr>
									<td class="label">근무 시간(시간 선택)</td>
									<td class="box text">
										<!-- <input type="text" name="name" value="" size="50" class="inputbox naver_shopping_prodName" /> -->
										<input type="text" id="startTime" size="9" class="inputbox"/> -
										<input type="text" id="endTime" size="9" class="inputbox"/>
									</td>
								</tr>
								<tr>
									<td class="label">근무지</td>
									<td class="box text">
										<input type="text" id="work_place" name="work_place" value="서울시 강남구" size="50" class="inputbox naver_shopping_prodName" />
									</td>
								</tr>
								<tr>
									<td class="label">급여</td>
									<td class="box text">
										<input type="radio" name="sal_type" value="일급" /><label>일급</label>
										<input type="radio" name="sal_type" value="주급" /><label>주급</label>
										<input type="radio" name="sal_type" value="월급" /><label>월급</label>
										<input type="radio" name="sal_type" value="연봉" checked/><label>연봉</label>
										<input type="number" id="sal" name="sal" value="3000" size="10" class="inputbox naver_shopping_prodName" /> 만원
									</td>
								</tr>
							</tbody>
						</table>
						<div class="subtitle">
							<img src="http://localhost/recruit-app/assets/images/manage/common/bul_subtitle.gif" />
							지원 조건
						</div>
						<table class="tbstyleB" width="100%">
							<colgroup>
								<col width="15%" />
								<col width="85%" />
							</colgroup>
							<tbody>
								<tr>
									<td class="label">경력</td>
									<td class="box text">
										<input type="radio" name="career_type" value="경력무관" checked/><label>경력무관</label>
										<input type="radio" name="career_type" value="신입" /><label>신입</label>
										<input type="radio" name="career_type" value="경력" /><label>경력 (</label>
										<input type="number" id="career_years" name="career_years" value="" size="5" class="inputbox naver_shopping_prodName" /> 년)
									</td>
								</tr>
								<tr>
									<td class="label">학력</td>
									<td class="box text">
										<input type="radio" name="edu_standard" value="1" checked/><label>고등학교 졸업 </label>
										<input type="radio" name="edu_standard" value="2" /><label>전문대 졸업 </label>
										<input type="radio" name="edu_standard" value="3" /><label>대학교 졸업 </label>
										<input type="radio" name="edu_standard" value="4" /><label>대학원(석사) </label>
										<input type="radio" name="edu_standard" value="5" /><label>대학원(박사) </label>
									</td>
								</tr>
							</tbody>
						</table>
						<div class="subtitle">
							<img src="http://localhost/recruit-app/assets/images/manage/common/bul_subtitle.gif" />
							공고상세
						</div>
						<div id="summernote">
							<p style="font-size: 25px;">
								<b>포지션상세</b>
							</p>
							<p> 
								포지션 상세에 대한 내용을 자유롭게 작성해주세요.</p><p>
								<br></p><p></p>
							</p>
							<p style="font-size: 25px;">
								<b>주요업무</b>
							</p>
							<p>
								주요업무에 대한 내용을 자유롭게 작성해주세요.</p><p>
								<br></p><p></p>
							</p>
							<p style="font-size: 25px;">
								<b>자격요건</b>
							</p>
							<p>
								자격요건에 대한 내용을 자유롭게 작성해주세요.</p><p>
								<br></p><p></p>
							</p>
							<p style="font-size: 25px;">
								<b>우대사항</b>
							</p>
								우대사항에 대한 내용을 자유롭게 작성해주세요.<br>
						</div>
						<div class="alignCenter">
					        <c:choose>
					            <c:when test="${empty recruitNum}">
									<input type="button" id="btn-register" class="btn btn-outline-success btn-sm detail-control" value="등록하기" />
								</c:when>
	            				<c:otherwise>
									<input type="button" id="btn-update" class="btn btn-outline-warning btn-sm detail-control" value="수정하기" />
									<input type="button" id="btn-delete" class="btn btn-outline-danger btn-sm detail-control" value="삭제하기" />
								</c:otherwise>
        					</c:choose>
							<input type="button" id="btn-back" class="btn btn-outline-dark btn-sm detail-control" value="뒤로" onClick="javascript:history.back();"/>
						</div>
					</form>
				</div>
			</div>
			<!-- golgolz end -->
		</div>
	</main>
	<script src="//cdnjs.cloudflare.com/ajax/libs/timepicker/1.3.5/jquery.timepicker.min.js"></script>
</body>
</html>
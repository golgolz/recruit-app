<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" info=""%>
<!DOCTYPE html>
<html>
<head>
<jsp:include page="../../../assets/layout/admin/lib.jsp" />
<!-- golgolz start -->
<link href="http://localhost/recruit-app/assets/css/manage/goods/general.css" rel="stylesheet" />
<link href="http://localhost/recruit-app/assets/css/manage/goods/goods.css" rel="stylesheet" />
<link href="http://localhost/recruit-app/assets/css/manage/goods/default.css" rel="stylesheet" />
<style>
	table{
		margin-top: 10px;
	}
</style>
<script type="text/javascript">
	$(function(){
    	$("#recruit_menu").addClass("bg-gradient-primary");
    	
    	$.ajax({
    		url: "${pageContext.request.contextPath}/api/manage/resume/recruit.do?recruitNum=${recruitNum}",
    		method: "GET",
    		dataType: "text",
    		success: function(data){
    			var statusDiv = document.getElementById('status');
    		    var recruitTitleDiv = statusDiv.querySelector('div:first-child');
    		    
    		    if (recruitTitleDiv) {
    		        recruitTitleDiv.textContent = '공고명 : ' + data;
    		    } else {
    		        console.error("Recruit title div not found");
    		    }
    		},
            error: function(xhr, status, error) {
                console.error("Error fetching data: " + error);
            }
    	});
    	$.ajax({
            url: "${pageContext.request.contextPath}/api/manage/resumes/detail.do?id=${resumeNum}",
            method: 'GET',
            dataType: 'JSON',
            success: function(data) {
            	updateProfileTable(data);
            	updateSkillsInfo(data.subData.skills);
            	updateEducationInfo(data.subData.education);
            	updateCareerInfo(data.subData.career);
            	updateCertificationInfo(data.subData.certifications);
            	updateIntroduce(data.introduce);
            	updateLanguageInfo(data.subData.languages);
            },
            error: function(xhr, status, error) {
                console.error("Error fetching data: " + error);
                $("#sodr_list tbody").html('<tr><td colspan="10" style="font-size: 16px; font-weight: bold;">데이터를 불러오는 데 실패했습니다.</td></tr>');
            }
        });
	});
	
	function updateProfileTable(data) {
	    $('#name').text(data.owner);
	    const birthDate = new Date(data.birth);
	    const today = new Date();
	    const age = today.getFullYear() - birthDate.getFullYear();
	    $('#birth').text(data.birth + ' (만 ' + age + '세)');
	    $('#gender').text(data.gender);
	    $('#email').text(data.email);
	    $('#tel').text(data.tel);
	    $('#phone').text(data.phone);
	    $('#addr').text(data.addr);
	    //$('#profileTable img').attr('src', `http://localhost/recruit-app/assets/images/${data.profile}`);
	}
	
	function updateSkillsInfo(skillsData) {
	    var $skillTable = $('#skill_table tbody');
	    $skillTable.empty();

	    if (!skillsData || skillsData.length === 0) {
	        $skillTable.append('<tr><td colspan="2">보유 기술 없음</td></tr>');
	        return;
	    }

	    var skillNames = skillsData.map(function(skill) {
	        return skill.skill_name;
	    }).join(', ');

	    var newRow = '<tr><td colspan="2"><span style="font-size:16px;"><strong>' + 
	                 skillNames + 
	                 '</strong></span></td></tr>';

	    $skillTable.append(newRow);
	}
	
	function updateEducationInfo(educationData) {
	    var $tbody = $('#school_table tbody');
	    $tbody.empty(); 

	    if (!educationData || educationData.length === 0) {
	        $tbody.append('<tr><td colspan="7" style="text-align: center;">해당사항 없음</td></tr>');
	        return;
	    }

	    educationData.forEach(function(education) {
	        var row = '<tr>' +
	            '<td>' + getSchoolClassification(education.school_classification) + '</td>' +
	            '<td>' + education.school_name + '</td>' +
	            '<td>' + education.admission_date + '</td>' +
	            '<td>' + education.graduation_date + '</td>' +
	            '<td>' + education.graduation_state + '</td>' +
	            '<td>' + education.major + '</td>' +
	            '<td>' + education.grades + ' (' + education.total_score + ')</td>' +
	            '</tr>';
	        $tbody.append(row);
	    });
	}
	
	function getSchoolClassification(code) {
	    var classifications = {
	        '1': '고등학교',
	        '2': '대학교(2,3년제)',
	        '3': '대학교(4년제)',
	        '4': '대학원(석사)',
	        '5': '대학원(박사)'
	    };
	    
	    return classifications[code] || '기타';
	}
	
	function updateCareerInfo(careerData) {
	    var $tbody = $('#career_table tbody');
	    $tbody.empty();

	    if (!careerData || careerData.length === 0) {
	        $tbody.append('<tr><td colspan="5" style="text-align: center;">해당사항 없음</td></tr>');
	        return;
	    }

	    careerData.forEach(function(career) {
	        var row = '<tr>' +
	            '<td>' + career.company_name + '</td>' +
	            '<td>' + career.join_date + '</td>' +
	            '<td>' + (career.resignation_date ? career.resignation_date : '재직중') + '</td>' +
	            '<td>' + career.job_description + '</td>' +
	            '<td>' + formatSalary(career.sal) + ' 만원</td>' +
	            '</tr>';
	        $tbody.append(row);
	    });
	}
	
	function formatSalary(salary) {
	    return salary.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
	}
	
	function updateCertificationInfo(certificationData) {
	    var $tbody = $('#certification_table tbody');
	    $tbody.empty(); 

	    if (!certificationData || certificationData.length === 0) {
	        $tbody.append('<tr><td colspan="3" style="text-align: center;">해당사항 없음</td></tr>');
	        return;
	    }

	    certificationData.forEach(function(certification) {
	        var row = '<tr>' +
	            '<td>' + certification.certificate_name + '</td>' +
	            '<td>' + certification.publisher + '</td>' +
	            '<td>' + certification.acquisition_date + '</td>' +
	            '</tr>';
	        $tbody.append(row);
	    });
	}
	
	function updateIntroduce(introduce) {
	    var $introduceContent = $('#introduceContent');
	    
	    if (!introduce) {
	        $introduceContent.html('<p>내용 없음</p>');
	        return;
	    }
	    $introduceContent.html(introduce);
	}
	
	function updateLanguageInfo(languageData) {
	    var $tbody = $('#language_table tbody');
	    $tbody.empty(); 

	    if (!languageData || languageData.length === 0) {
	        $tbody.append('<tr><td colspan="4" style="text-align: center;">해당사항 없음</td></tr>');
	        return;
	    }

	    languageData.forEach(function(language) {
	        var row = '<tr>' +
	            '<td>' + language.category + '</td>' +
	            '<td>' + language.language + '</td>' +
	            '<td>' + (language.test_name ? language.test_name : '해당사항 없음') + '</td>' +
	            '<td>' + language.lang_level + '</td>' +
	            '</tr>';
	        $tbody.append(row);
	    });
	}
</script>
<link href="http://localhost/recruit-app/assets/css/manage/resume/detail.css" rel="stylesheet" />
<!-- golgolz end -->
</head>
<body>
	<jsp:include page="../../../assets/layout/admin/header.jsp" />
	<main
		class="main-content position-relative max-height-vh-100 h-100 border-radius-lg ps--active-y">
		<nav
			class="navbar navbar-main navbar-expand-lg px-0 mx-4 shadow-none border-radius-xl"
			id="navbarBlur" data-scroll="true" style="position:fixed; background-color: #FFFFFF; width:100%">
			<div class="container-fluid py-1 px-3">
				<div style="display:flex;">
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
						<h6 class="font-weight-bolder mb-0">지원자 이력서 상세보기</h6>
						<div id="status">
							<div>공고명 : 24년 상반기 백엔드 엔지니어</div>
							<div>지원 현황 : 서류 진행중</div>
						</div>
					</nav>
					<div id="results">
						서류 합격 여부 : <span style="font-weight: bold;">불합격</span><br>
						면접 합격 여부 : <span style="font-weight: bold;">해당없음</span><br>
					</div>
					<div id="resumeBtnContainer">
						<input type="button" value="서류합격처리" class="btn btn-outline-success btn-sm goRegist resumeBtns" />
						<input type="button" value="불합격처리" class="btn btn-outline-danger btn-sm resumeBtns" />
					</div>
				</div>
			</div>
		</nav>
		<!-- golgolz start -->
		<div class="container-fluid py-4" id="container">
			<!-- golgolz start -->
			<div id="contentcolumn" class="">
				<div class="contents" style="margin-top: 125px;">
					<form id="dataForm" name="dataForm" action="http://localhost/recruit-app/manage/common_process.jsp" method="post" enctype="multipart/form-data">
						<div class="subtitle">
							<img
								src="http://localhost/recruit-app/assets/images/manage/common/bul_subtitle.gif" />
							인적사항
						</div>
						<table class="tbstyleB" id="profileTable" width="100%">
							<colgroup>
								<col width="15%" />
								<col width="85%" />
							</colgroup>
							<tbody>
								<tr>
									<td></td>
								</tr>
								<tr>
									<td class="label">이름</td>
									<td class="box text">
										<span id="name"></span>
									</td>
									<td rowspan="4">
										<img src="http://localhost/recruit-app/assets/images/default.png" />
									</td>
								</tr>
								<tr>
									<td class="label">생년월일</td>
									<td class="box text">
										<span id="birth"></span>
									</td>
								</tr>
								<tr>
									<td class="label">성별</td>
									<td class="box text">
										<span id="gender"></span>
									</td>
								</tr>
								<tr>
									<td class="label">이메일</td>
									<td class="box text">
										<span id="email"></span>
									</td>
								</tr>
								<tr>
									<td class="label">전화번호</td>
									<td class="box text" colspan="2">
										<span id="tel"></span>
									</td>
								</tr>
								<tr>
									<td class="label">휴대폰번호</td>
									<td class="box text" colspan="2">
										<span id="phone"></span>
									</td>
								</tr>
								<tr>
									<td class="label">주소</td>
									<td class="box text" colspan="2">
										<span id="addr"></span>
									</td>
								</tr>
							</tbody>
						</table>
						<div class="subtitle">
							<img src="http://localhost/recruit-app/assets/images/manage/common/bul_subtitle.gif" />
							스킬
						</div>
						<table id="skill_table" cellpadding="0" cellspacing="1" border="0" class="tbstyleB" width="100%">
							<colgroup>
								<col width="15%" />
								<col width="85%" />
							</colgroup>
							<tbody></tbody>
						</table>
						<div class="subtitle">
							<img
								src="http://localhost/recruit-app/assets/images/manage/common/bul_subtitle.gif" />
							학력
						</div>
						<table id="school_table" class="table table-striped table-bordered horizontal_arrange" width="100%">
							<thead class="thead-dark">
								<tr>
									<th>학교구분</th>
									<th>학교명</th>
									<th>입학일자</th>
									<th>졸업일자</th>
									<th>졸업상태</th>
									<th>전공명</th>
									<th>학점</th>
								</tr>
							</thead>
							<tbody></tbody>
						</table>
						<div class="subtitle">
							<img
								src="http://localhost/recruit-app/assets/images/manage/common/bul_subtitle.gif" />
							경력
						</div>
						<table id="career_table" class="table table-striped table-bordered horizontal_arrange" width="100%">
							<thead class="thead-dark">
								<tr>
									<th>기업명</th>
									<th>입사년월</th>
									<th>퇴사년월</th>
									<th>수행업무</th>
									<th>연봉</th>
								</tr>
							</thead>
							<tbody></tbody>
						</table>
						<div class="subtitle">
							<img
								src="http://localhost/recruit-app/assets/images/manage/common/bul_subtitle.gif" />
							자격증
						</div>
						<table id="certification_table" class="table table-striped table-bordered horizontal_arrange">
							<thead class="thead-dark">
								<tr>
									<th>자격증 명</th>
									<th>발행처</th>
									<th>취득일</th>
								</tr>
							</thead>
							<tbody></tbody>
						</table>
						<div class="subtitle">
							<img
								src="http://localhost/recruit-app/assets/images/manage/common/bul_subtitle.gif" />
							어학
						</div>
						<table id="language_table" class="table table-striped table-bordered horizontal_arrange">
							<thead class="thead-dark">
								<tr>
									<th>분류</th>
									<th>언어</th>
									<th>시험명</th>
									<th>수준</th>
								</tr>
							</thead>
							<tbody>
							</tbody>
						</table>
						<div class="subtitle">
							<img
								src="http://localhost/recruit-app/assets/images/manage/common/bul_subtitle.gif" />
							자기소개서
						</div>
						<p id="introduceContent">열정맨 우미연입니다.</p>
						<div class="alignCenter">
							<input type="button" id="btn-back" class="btn btn-outline-dark btn-sm detail-control" value="뒤로" onClick="javascript:history.back();"/>
						</div>
					</form>
				</div>
			</div>
			<!-- golgolz end -->
		</div>
		<!-- golgolz end -->
	</main>
</body>
</html>
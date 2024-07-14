<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    info=""%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head> 
	<!-- golgolz start -->
    <link href="http://localhost/recruit-app/assets/css/resume/write-sv-202405231305.css" rel="stylesheet" type="text/css"/>
    <link href="http://localhost/recruit-app/assets/css/resume/flow.css" />
    <link href="http://localhost/recruit-app/assets/css/resume/layout-sv-202401301659.css" rel="stylesheet" type="text/css"/>
    <link rel="stylesheet" href="http://localhost/recruit-app/assets/css/layout/user/btn-bootstrap.css" />
    <style>
      .autocomplete .list .hover {
        background-color: #f5f5f5;
      }
      .popupSearchDuty .list .hover {
        background-color: #f5f5f5;
      }
      .async-hide {
        opacity: 0 !important;
      }
    </style>
    <!-- End Google Tag Manager -->
    <!-- 상단 선언 스크립트 : 모든페이지 공통 상단 필수 -->
    <!-- PlayD TERA Log Definition Script Start -->
    <script>
      window.onload = function () {
        (function (win, name) {
          win["LogAnalyticsObject"] = name;
          win[name] =
            win[name] ||
            function () {
              (win[name].q = win[name].q || []).push(arguments);
            };
        })(window, "_LA");
      };
    </script>
	<jsp:include page="../assets/layout/user/lib.jsp" /> 
    <script src="http://localhost/recruit-app/assets/js/user/resume/json2.js"></script>
    <script src="http://localhost/recruit-app/assets/js/user/resume/jquery"></script>
    <script src="http://localhost/recruit-app/assets/js/user/resume/itemtemplate.js"></script>
    <script src="http://localhost/recruit-app/assets/js/user/resume/JK_Cookie.js"></script>
    <script src="http://localhost/recruit-app/assets/js/user/resume/JK5cript.js"></script>
    <script src="http://localhost/recruit-app/assets/js/user/resume/ResumeReg"></script>
	<!-- golgolz end -->
	<script type="text/javascript" src="http://localhost/recruit-app/assets/js/user/resume/edu.js"></script>
    <link rel="stylesheet" href="http://localhost/recruit-app/assets/css/resume/detail.css" />
	<style text="text/css">
		<!-- golgolz start -->
		<!-- golgolz end -->
	</style>
	<script text="text/javascript">
	var filteredLanguageExamData = [
		  {
		    Lang_Code: "16",
		    Lang_Name: "영어",
		    Exams: [
		      { Exam_Code: 1, Exam_Name: "TOEIC" },
		      { Exam_Code: 28, Exam_Name: "TOEIC(Speaking)" },
		      { Exam_Code: 77, Exam_Name: "TOEIC(Writing)" },
		      { Exam_Code: 29, Exam_Name: "TOEIC Speaking and Writing Tests" },
		      { Exam_Code: 2, Exam_Name: "TOEFL(PBT)" },
		      { Exam_Code: 21, Exam_Name: "TOEFL(CBT)" },
		      { Exam_Code: 24, Exam_Name: "TOEFL(iBT)" },
		      { Exam_Code: 3, Exam_Name: "TEPS" },
		      { Exam_Code: 14, Exam_Name: "IELTS" },
		      { Exam_Code: 15, Exam_Name: "G-TELP(GLT)" },
		      { Exam_Code: 16, Exam_Name: "G-TELP(GST)" },
		      { Exam_Code: 75, Exam_Name: "G-TELP(GWT)" },
		      { Exam_Code: 76, Exam_Name: "G-TELP(GBST)" },
		      { Exam_Code: 17, Exam_Name: "SLEP" },
		      { Exam_Code: 18, Exam_Name: "GRE" },
		      { Exam_Code: 19, Exam_Name: "GMAT" },
		      { Exam_Code: 23, Exam_Name: "PELT" },
		      { Exam_Code: 30, Exam_Name: "OPIc" },
		      { Exam_Code: 79, Exam_Name: "OPIc Listening&Reading" },
		      { Exam_Code: 63, Exam_Name: "OPIc Writing" },
		      { Exam_Code: 80, Exam_Name: "OPI" },
		      { Exam_Code: 64, Exam_Name: "FLEX 영어" }
		    ]
		  },
		  {
		    Lang_Code: "20",
		    Lang_Name: "일본어",
		    Exams: [
		      { Exam_Code: 4, Exam_Name: "JPT" },
		      { Exam_Code: 13, Exam_Name: "JLPT" },
		      { Exam_Code: 34, Exam_Name: "新JLPT" },
		      { Exam_Code: 20, Exam_Name: "JTRA" },
		      { Exam_Code: 27, Exam_Name: "NPT" },
		      { Exam_Code: 37, Exam_Name: "SJPT" },
		      { Exam_Code: 48, Exam_Name: "OPIc" },
		      { Exam_Code: 67, Exam_Name: "FLEX 일본어" }
		    ]
		  },
		  {
		    Lang_Code: "21",
		    Lang_Name: "중국어",
		    Exams: [
		      { Exam_Code: 8, Exam_Name: "HSK" },
		      { Exam_Code: 32, Exam_Name: "新HSK" },
		      { Exam_Code: 33, Exam_Name: "HSK회화" },
		      { Exam_Code: 35, Exam_Name: "新HSK회화" },
		      { Exam_Code: 36, Exam_Name: "TSC" },
		      { Exam_Code: 38, Exam_Name: "OPIc" },
		      { Exam_Code: 42, Exam_Name: "BCT" },
		      { Exam_Code: 43, Exam_Name: "CPT" },
		      { Exam_Code: 78, Exam_Name: "HSKK" },
		      { Exam_Code: 81, Exam_Name: "OPI" },
		      { Exam_Code: 49, Exam_Name: "新BCT(A)" },
		      { Exam_Code: 50, Exam_Name: "新BCT(B)" },
		      { Exam_Code: 51, Exam_Name: "新BCT(Speaking)" },
		      { Exam_Code: 68, Exam_Name: "FLEX 중국어" }
		    ]
		  },
		  {
		    Lang_Code: "4",
		    Lang_Name: "독일어",
		    Exams: [
		      { Exam_Code: 11, Exam_Name: "ZDAF" },
		      { Exam_Code: 12, Exam_Name: "ZMP" },
		      { Exam_Code: 7, Exam_Name: "GDS" },
		      { Exam_Code: 9, Exam_Name: "KDS" },
		      { Exam_Code: 52, Exam_Name: "DSH" },
		      { Exam_Code: 53, Exam_Name: "FLEX 독일어" },
		      { Exam_Code: 54, Exam_Name: "PWD" },
		      { Exam_Code: 55, Exam_Name: "SD1" },
		      { Exam_Code: 56, Exam_Name: "SD2" },
		      { Exam_Code: 57, Exam_Name: "SNULT 독일어" },
		      { Exam_Code: 58, Exam_Name: "TCT 번역능력인정시험 독일어" },
		      { Exam_Code: 59, Exam_Name: "TestDaF" },
		      { Exam_Code: 60, Exam_Name: "ZD" },
		      { Exam_Code: 61, Exam_Name: "ZOP" },
		      { Exam_Code: 62, Exam_Name: "관광통역안내사 독일어" },
		      { Exam_Code: 83, Exam_Name: "OPI" }
		    ]
		  },
		  {
		    Lang_Code: "27",
		    Lang_Name: "프랑스어",
		    Exams: [
		      { Exam_Code: 6, Exam_Name: "DELF" },
		      { Exam_Code: 5, Exam_Name: "DALF" },
		      { Exam_Code: 82, Exam_Name: "OPI" },
		      { Exam_Code: 69, Exam_Name: "FLEX 프랑스어" }
		    ]
		  }
		];
	
		$(function(){
			<!-- golgolz start -->
			//$('.chip[data-value="Vue.js"]').addClass("active"); // select before rendering
	        $(".chip").click(function () {
	          $(this).toggleClass("active");

	          var selectedValues = $(".chip.active")
	            .map(function () {
	              return $(this).data("value");
	            })
	            .get();
	        });
			
	        $("#resetButton").click(function(event) {
                event.preventDefault(); // 기본 동작 방지
                $('.chip').removeClass('active'); // 모든 칩 선택 해제
            });

			setTimeout(function() {
				$("#UserResume_M_Resume_Title").focus(); // myInput은 포커스를 줄 input 요소의 ID
			}, 1); // 500ms (0.5초) 지연
			
			var area0 = ["시/도 선택","서울특별시","인천광역시","대전광역시","광주광역시","대구광역시","울산광역시","부산광역시","경기도","강원도","충청북도","충청남도","전라북도","전라남도","경상북도","경상남도","제주도"];
			var area1 = ["강남구","강동구","강북구","강서구","관악구","광진구","구로구","금천구","노원구","도봉구","동대문구","동작구","마포구","서대문구","서초구","성동구","성북구","송파구","양천구","영등포구","용산구","은평구","종로구","중구","중랑구"];
			var area2 = ["계양구","남구","남동구","동구","부평구","서구","연수구","중구","강화군","옹진군"];
			var area3 = ["대덕구","동구","서구","유성구","중구"];
			var area4 = ["광산구","남구","동구", "북구","서구"];
			var area5 = ["남구","달서구","동구","북구","서구","수성구","중구","달성군"];
			var area6 = ["남구","동구","북구","중구","울주군"];
			var area7 = ["강서구","금정구","남구","동구","동래구","부산진구","북구","사상구","사하구","서구","수영구","연제구","영도구","중구","해운대구","기장군"];
			var area8 = ["고양시","과천시","광명시","광주시","구리시","군포시","김포시","남양주시","동두천시","부천시","성남시","수원시","시흥시","안산시","안성시","안양시","양주시","오산시","용인시","의왕시","의정부시","이천시","파주시","평택시","포천시","하남시","화성시","가평군","양평군","여주군","연천군"];
			var area9 = ["강릉시","동해시","삼척시","속초시","원주시","춘천시","태백시","고성군","양구군","양양군","영월군","인제군","정선군","철원군","평창군","홍천군","화천군","횡성군"];
			var area10 = ["제천시","청주시","충주시","괴산군","단양군","보은군","영동군","옥천군","음성군","증평군","진천군","청원군"];
			var area11 = ["계룡시","공주시","논산시","보령시","서산시","아산시","천안시","금산군","당진군","부여군","서천군","연기군","예산군","청양군","태안군","홍성군"];
			var area12 = ["군산시","김제시","남원시","익산시","전주시","정읍시","고창군","무주군","부안군","순창군","완주군","임실군","장수군","진안군"];
			var area13 = ["광양시","나주시","목포시","순천시","여수시","강진군","고흥군","곡성군","구례군","담양군","무안군","보성군","신안군","영광군","영암군","완도군","장성군","장흥군","진도군","함평군","해남군","화순군"];
			var area14 = ["경산시","경주시","구미시","김천시","문경시","상주시","안동시","영주시","영천시","포항시","고령군","군위군","봉화군","성주군","영덕군","영양군","예천군","울릉군","울진군","의성군","청도군","청송군","칠곡군"];
			var area15 = ["거제시","김해시","마산시","밀양시","사천시","양산시","진주시","진해시","창원시","통영시","거창군","고성군","남해군","산청군","의령군","창녕군","하동군","함안군","함양군","합천군"];
			var area16 = ["서귀포시","제주시","남제주군","북제주군"];
			 
			// 시/도 선택 박스 초기화
			$("select[name^=sido]").each(function() {
				$selsido = $(this);
				$.each(eval(area0), function() {
					$selsido.append("<option style='font-size: 14px;' value='"+this+"'>"+this+"</option>");
				});
				$selsido.next().append("<option style='font-size: 14px;' value=''>구/군 선택</option>");
			});

			// 시/도 선택시 구/군 설정
			$("select[name^=sido]").change(function() {
				var area = "area"+$("option",$(this)).index($("option:selected",$(this))); // 선택지역의 구군 Array
				var $gugun = $(this).next(); // 선택영역 군구 객체
				$("option",$gugun).remove(); // 구군 초기화
	
				if(area == "area0")
					$gugun.append("<option style='font-size: 14px;' value=''>구/군 선택</option>");
				else {
					$.each(eval(area), function() {
					$gugun.append("<option style='font-size: 14px;' value='"+this+"'>"+this+"</option>");
					});
				}
			});
			
			var resumeNum = "${resumeNum}";
	    	var id = "<%= session.getAttribute("userId") %>";
	    	
			if (resumeNum) {
				$.ajax({
		            url: "${pageContext.request.contextPath}/api/manage/resumes/detail.do?id=" + resumeNum,
		            method: 'GET',
		            dataType: 'JSON',
		            success: function(data) {
		            	console.log(data);
		            	updateTitle(data.title);
		            	updateProfileForm(data);
		            	updateSkills(data.subData.skills); 
		            	updateCareer(data.subData.career);
		            	updateLanguages(data.subData.languages);
		            	updateCertifications(data.subData.certifications);
		            	updateIntroduction(data.introduce);
		                updateEducation(data.subData.education);
		            },
		            error: function(xhr, status, error) {
		                console.error("Error fetching data: " + error);
		                $("#recruit-list tbody").html('<tr><td colspan="4" style="font-size: 16px; font-weight: bold;">데이터를 불러오는 데 실패했습니다.</td></tr>');
		            }
		        });
		    } else {
		    	$.ajax({
		    		url: "${pageContext.request.contextPath}/api/resume/profile.do?id=" + id,
		    		method: "GET",
		    		dataType: "JSON",
		    		success: function(data){
		    			console.log(data);
		    			updateProfileForm(data);
		    		},
		    		error: function(xhr, status, error){
		                console.error("Error fetching data: " + error);
		    		}
		    	});
		    }
			
			$("#registerBtn").click(function(){
				if(confirm("등록하시겠습니까?")){
					let resumeData = createResumeData();
					console.log(resumeData);
					$.ajax({
						url: "${pageContext.request.contextPath}/api/resume.do",
						method: "POST",
				        contentType: "application/json; charset=utf-8",
				        data: JSON.stringify(resumeData),
						success: function(data){
							console.log("success");
							alert("등록이 완료되었습니다.");
						},
						error: function(xhr, status, error){
							console.log("fail");
						}
					});
				}
			});
			
			$("#updateBtn").click(function(){
				if(confirm("수정하시겠습니까?")){
					let resumeData = createResumeData();
					console.log(resumeData);
					console.log(JSON.stringify(resumeData));
					$.ajax({
						url: "${pageContext.request.contextPath}/api/resume.do",
						type: "PUT",
				        contentType: "application/json; charset=utf-8",
				        data: JSON.stringify(resumeData),
						success: function(data){
							alert("수정이 완료되었습니다.");
						},
						error: function(xhr, status, error){
							console.log("fail");
						}
					});
				}
			});
			
			$("#removeBtn").click(function(){
				if(confirm("삭제하시겠습니까?")){
					$.ajax({
						url: "${pageContext.request.contextPath}/api/resume.do?id=" + resumeNum,
						type: "DELETE",
						success: function(data){
							alert("삭제가 완료되었습니다.");
						},
						error: function(xhr, status, error){
							console.log("fail");
						}
					});
				}
			});
			<!-- golgolz end -->
		});
		
		/* 수정 삭제를 위한 js functions start */
		function updateTitle(titleData){
		    $('#UserResume_M_Resume_Title').val(titleData);
		}
		
		function updateProfileForm(data) {
		    $('#UserInfo_M_Name').val(data.owner);
		    $('#UserInfo_M_Born').val(data.birth);
		    $('#genderSelect').val(data.gender);
		    $('#UserInfo_M_Email').val(data.email);
		    $('input[name="UserInfo.M_Hand_Phone"]').eq(0).val(data.tel);
		    $('input[name="UserInfo.M_Hand_Phone"]').eq(1).val(data.phone);

		    if (data.addr) {
		        var addrParts = data.addr.split(' ');
		        if (addrParts.length >= 2) {
		            var sido = addrParts[0];
		            var gugun = addrParts.slice(1).join(' ');
		
		            $('#sido1').val(sido);
		            $('#sido1').trigger('change');

		            setTimeout(function() {
		                $('#gugun1').val(gugun);
		            }, 100);
		        }
		    }

		    if (data.profile) {
		        $('.picture').css('background-image', `url(${data.profile})`).addClass('dropped');
		    }
		}
		
		function updateSkills(skills) {
			if(skills == null){
				return;
			}
			
		    $('.chip').removeClass('active');
		    skills.forEach(function(skill) {
		        $('.chip[data-value="' + skill.skill_name + '"]').addClass('active');
		    });
		}
		
		function addSchoolItem() {
		    var containerCount = $('#school_containers .container').length;
		    var newSchoolHtml = $('#tplSchool').html().replace(/\{no\}/g, containerCount + 1);
		    $('#school_containers').append(newSchoolHtml);

		    // 새로 추가된 학교 항목에 대한 이벤트 리스너 추가
		    var $newSchool = $('#school_containers .container').last();
		    initSchoolItemEvents($newSchool);
		}

		function initSchoolItemEvents($school) {
		    $school.find('.dropdown-education-category .button').click(function() {
		        $(this).closest('.dropdown').find('.list').toggleClass('hidden');
		    });

		    $school.find('.dropdown-education-category .eduItem').click(function() {
		        var schoolType = $(this).data('schltypecode');
		        updateSchoolType($school, schoolType);
		    });

		    $school.find('.buttonDeleteField').click(function() {
		        $school.remove();
		    });
		}
		
		function updateSchoolType($school, schoolType) {
		    var templateId = schoolType === "0" ? '#tplHighSchool' : '#tplUnivSchool';
		    var newSchoolHtml = $(templateId).html().replace(/\{no\}/g, $school.index() + 1);
		    $school.replaceWith(newSchoolHtml);
		    
		    var $newSchool = $('#school_containers .container').eq($school.index());
		    initSchoolItemEvents($newSchool);

		    if (schoolType !== "0") {
		        initUnivSchoolEvents($newSchool);
		    }
		}
		
		function updateEducation(educationData) {
			if(educationData == null){
				return;
			}
			
			$('#school_containers').empty();
		    
		    var gradStateMap = {
		        "졸업": "10",
		        "졸업예정": "5",
		        "재학중": "4",
		        "중퇴": "2",
		        "수료": "9",
		        "휴학": "3"
		    };
		    
		    var degreeMap = {
		        "1": "(2,3년제)학사",
		        "2": "(4년제)학사",
		        "3": "석사",
		        "4": "박사"
		    };
		    
		    educationData.forEach(function(edu, index) {
		        var templateId;
		        if (edu.school_classification === "1") {
		            templateId = '#tplHighSchool';
		        } else {
		            templateId = '#tplUnivSchool';
		        }
		        
		        var newSchoolHtml = $(templateId).html().replace(/\{no\}/g, index + 1);
		        var $newSchool = $(newSchoolHtml);
		        var $schoolNameInput = $newSchool.find('[data-type="School_Name"][data-comp_type="jkAcInput"]');
		        $schoolNameInput.val(edu.school_name);
		        
		        if (edu.school_classification === "1") {
		            $newSchool.find('[name="HighSchool.Schl_Name"]').val(edu.school_name);
		            $newSchool.find('#HighSchool_Schl_Name_Search').val(edu.school_name);
		            $newSchool.find('#HighSchool_Grad_Year').val(edu.graduation_date.substring(0, 4));
		            
		            var $gradStateDropdown = $newSchool.find('.dropdown-edcation-state');
		            var $gradStateButton = $gradStateDropdown.find('.buttonChoose');
		            var $gradStateInput = $newSchool.find('#HighSchool_Grad_Type_Code');
		            
		            if (edu.graduation_state && gradStateMap[edu.graduation_state]) {
		                $gradStateDropdown.addClass('selected');
		                $gradStateDropdown.find('.label').removeClass('hidden').attr('aria-hidden', 'false');
		                $gradStateButton.html('<span>' + edu.graduation_state + '</span>');
		                $gradStateInput.val(gradStateMap[edu.graduation_state]);
		            }
		        } else {
		            $newSchool.find('[name$="Schl_Name"]').val(edu.school_name);
		            $newSchool.find('[name$="Entc_YM"]').val(edu.admission_date);
		            $newSchool.find('[name$="Grad_YM"]').val(edu.graduation_date);
		            
		            var $gradStateDropdown = $newSchool.find('.dropdown-edcation-state');
		            var $gradStateButton = $gradStateDropdown.find('.buttonChoose');
		            var $gradStateLabel = $gradStateDropdown.find('.label');
		            var $gradStateInput = $newSchool.find('[name$="Grad_Type_Code"]');
		            
		            if (edu.graduation_state && gradStateMap[edu.graduation_state]) {
		                $gradStateDropdown.addClass('selected');
		                $gradStateLabel.removeClass('hidden').attr('aria-hidden', 'false');
		                $gradStateButton.html('<span>' + edu.graduation_state + '</span>');
		                $gradStateInput.val(gradStateMap[edu.graduation_state]);
		            }
		            
		            var $degreeDropdown = $newSchool.find('.dropdown-edcation-degree');
		            var $degreeButton = $degreeDropdown.find('.buttonChoose');
		            var $degreeInput = $newSchool.find('[name$="Mstr_Dctr_Type_Code"]');
		            
		            var degreeIndex = Math.min(parseInt(edu.school_classification) - 1, 3);
		            var degreeValue = Object.keys(degreeMap)[degreeIndex];
		            var degreeText = degreeMap[degreeValue];

		            $degreeDropdown.addClass('selected');
		            $degreeDropdown.find('.label').removeClass('hidden').attr('aria-hidden', 'false');
		            $degreeButton.html('<span>' + degreeText + '</span>');
		            $degreeInput.val(degreeValue);
		            
		            var $totalScoreDropdown = $newSchool.find('.dropdown-education-total');
		            var $totalScoreButton = $totalScoreDropdown.find('.buttonChoose span');
		            var $totalScoreInput = $newSchool.find('[name$="Grade_Prft_Scr"]');
		            
		            if (edu.total_score) {
		                $totalScoreDropdown.addClass('selected');
		                $totalScoreDropdown.find('.label').removeClass('hidden').attr('aria-hidden', 'false');
		                $totalScoreButton.text(edu.total_score);
		                $totalScoreInput.val(edu.total_score);
		                
		                $totalScoreDropdown.find('.list ul li button').each(function() {
		                    $(this).toggleClass('selected', $(this).data('value') == edu.total_score);
		                });
		            }
		            
		            $newSchool.find('[data-type="Major_Name"]').val(edu.major);
		            $newSchool.find('[name$="Grade"]').val(edu.grades);
		            $newSchool.find('[name$="Grade_Prft_Scr"]').val(edu.total_score);
		        }
		        
		        $newSchool.find('.list').removeClass('visible').addClass('hidden');
		        
		        $('#school_containers').append($newSchool);
		        initSchoolItemEvents($newSchool);
		    });
		}

		function initUnivSchoolEvents($school) {
		    $school.find('.dropdown-edcation-state .buttonChoose').click(function(e) {
		        e.preventDefault();
		        var $list = $(this).closest('.dropdown').find('.list');
		
		        if ($list.hasClass('hidden')) {
		            $list.removeClass('hidden').addClass('visible');
		        } else {
		            $list.removeClass('visible').addClass('hidden');
		        }
		    });

		    $school.find('.dropdown-edcation-state .list .button').click(function(e) {
		        e.preventDefault();
		        var selectedValue = $(this).data('value');
		        var selectedText = $(this).find('span').text();
		        var $dropdown = $(this).closest('.dropdown');
		        
		        $dropdown.addClass('selected');
		        $dropdown.find('.label').removeClass('hidden').attr('aria-hidden', 'false');
		        $dropdown.find('.buttonChoose').html('<span>' + selectedText + '</span>');
		        $dropdown.find('input[type="hidden"]').val(selectedValue);
		        $dropdown.find('.list').removeClass('visible').addClass('hidden');
		    });
		}
		
		function updateCertifications(certificationData) {
			if(certificationData == null){
				return;
			}
			
		    $('#license_containers').empty();

		    certificationData.forEach(function(cert, index) {
		        var newCertHtml = $('#tplLicenseItem').html().replace(/c23/g, 'c' + (index + 1));
		        var $newCert = $(newCertHtml);

		        $newCert.find('[data-type="Lc_Name"]').val(cert.certificate_name);
		        $newCert.find('[data-type="Lc_Pub"]').val(cert.publisher);
		        $newCert.find('[data-format-type="month"]').val(cert.acquisition_date);
		        $newCert.find('.dev-btn-del-license').click(function() {
		            $(this).closest('.container').remove();
		        });
		        $('#license_containers').append($newCert);
		    });

		    $('.formWrapCertificate .buttonAddField').off('click').click(function() {
		        var newIndex = $('#license_containers .container').length + 1;
		        var newCertHtml = $('#tplLicenseItem').html().replace(/c23/g, 'c' + newIndex);
		        var $newCert = $(newCertHtml);

		        $newCert.find('.dev-btn-del-license').click(function() {
		            $(this).closest('.container').remove();
		        });

		        $('#license_containers').append($newCert);
		    });
		}
		
		function updateCareer(careerData) {
			if(careerData == null){
				return;
			}
			
		    $('#career_containers').empty();
		    
		    careerData.forEach(function(career, index) {
		        var newCareerHtml = $('#tplCareerItem').html().replace(/c14/g, 'c' + (index + 1));
		        var $newCareer = $(newCareerHtml);
		        
		        $newCareer.find('[id^="Career_C_Name_"]').val(career.company_name);
		        $newCareer.find('[id^="Career_C_Part_"]').val(career.dname);
		        $newCareer.find('[id^="Career_CSYM_"]').val(career.join_date);
		        if (career.resignation_date) {
		            $newCareer.find('[id^="Career_CEYM_"]').val(career.resignation_date);
		        } else {
		            $newCareer.find('[id^="Career_CEYM_"]').val('재직중');
		        }

		        if (career.position) {
		            $newCareer.find('[id^="Career_position_field"]').val(career.position);
		        }
		        
		        if (career.sal) {
		            $newCareer.find('[id^="Career_M_MainPay_User_"]').val(career.sal);
		        }
		        
		        $newCareer.find('[id^="Career_Prfm_Prt_"]').val(career.job_description);
		        $('#career_containers').append($newCareer);
		    });
		}
		
		function updateLanguages(languageData) {
			if(languageData == null){
				return;
			}
			
		    var $container = $('#language_containers');
		    
		    if ($container.length === 0) {
		        return;
		    }

		    $container.html('');

		    var $template = $('#tplLanguageItem');
		    if ($template.length === 0) {
		        console.error("Error: Template #tplLanguageItem not found");
		        return;
		    }

		    var templateHtml = $template.html();

		    languageData.forEach(function(lang, index) {
		        var newItemHtml = templateHtml.replace(/c508/g, 'c' + (index + 1));
		        var $newLangItem = $(newItemHtml);
		        
		        var categoryValue = lang.category === "회화능력" ? "1" : "2";
		        $newLangItem.find('[name$="Eval_Category"]').val(categoryValue);
		        $newLangItem.find('.dropdown-category .buttonChoose span').text(lang.category);
		        $newLangItem.find('.dropdown-category').addClass('selected');
		        $newLangItem.find('.dropdown-category .label').attr('aria-hidden', 'false').removeClass('hidden');

		        var langCode = getLanguageCode(lang.language);
		        $newLangItem.find('[name$="Lang1_Name"]').val(langCode);
		        $newLangItem.find('.dropdown-language-name .buttonChoose span').text(lang.language);
		        $newLangItem.find('.dropdown-language-name').addClass('selected');
		        $newLangItem.find('.dropdown-language-name .label').attr('aria-hidden', 'false').removeClass('hidden');

		        if (lang.category === "회화능력") {
		            $newLangItem.find('.devConversationArea').show();
		            $newLangItem.find('.devExamArea').hide();

		            var conversationLevelValue = getConversationLevelValue(lang.lang_level);
		            $newLangItem.find('[name$="Lang1_Stat"]').val(conversationLevelValue);
		            $newLangItem.find('.devConversationArea .buttonChoose span').text(lang.lang_level);
		            $newLangItem.find('.devConversationArea .dropdown-language-grade').addClass('selected');
		            $newLangItem.find('.devConversationArea .dropdown-language-grade .label').attr('aria-hidden', 'false').removeClass('hidden');
		        } else if (lang.category === "공인시험") {
		            $newLangItem.find('.devExamArea').show();
		            $newLangItem.find('.devConversationArea').hide();

		            var examList = getExamListByLanguage(langCode);
		            var $examListContainer = $newLangItem.find('.devExamDropdown .list ul');
		            $examListContainer.empty();
		            examList.forEach(function(exam) {
		                $examListContainer.append('<li><button type="button" class="button" data-value="' + exam.Exam_Code + '"><span>' + exam.Exam_Name + '</span></button></li>');
		            });

		            var examInfo = getExamInfo(langCode, lang.test_name);
		            $newLangItem.find('[name$="Test1_Name"]').val(examInfo.Exam_Code);
		            $newLangItem.find('.devExamDropdown .buttonChoose span').text(lang.test_name);
		            $newLangItem.find('.devExamDropdown').addClass('selected').css({
		                'display': 'inline-block',
		                'margin-right': '10px'
		            });
		            $newLangItem.find('.devExamDropdown .label').attr('aria-hidden', 'false').removeClass('hidden');
		            $newLangItem.find('.devExamInput').remove();
		            $newLangItem.find('.devExamGradeInput').addClass('is-value').show().css({
		                'display': 'inline-block',
		                'margin-right': '10px'
		            });
		            $newLangItem.find('.devExamGradeInput input').val(lang.lang_level);
		            $newLangItem.find('.devExamGradeDropdown').hide();
		            $newLangItem.find('.devExamGradeDropdown input').attr('disabled', 'disabled');
		            $newLangItem.find('[name$="Test_YYMM"]').val(lang.aquisition_date);
		            $newLangItem.find('.input-passdate').addClass('is-value').css({
		                'display': 'inline-block'
		            });
		        }
		        $container.append($newLangItem);
		    });
		}
		
		function getExamListByLanguage(langCode) {
		    var language = filteredLanguageExamData.find(lang => lang.Lang_Code === langCode);
		    return language ? language.Exams : [];
		}
		
	    function getLanguageCode(languageName) {
	        var language = filteredLanguageExamData.find(lang => lang.Lang_Name === languageName);
	        return language ? language.Lang_Code : "";
	    }

	    function getConversationLevelValue(level) {
	        var levels = {
	            "일상회화 가능": "1",
	            "비즈니스 회화가능": "2",
	            "원어민 수준": "3"
	        };
	        return levels[level] || "";
	    }

	    function getExamInfo(langCode, examName) {
	        var language = filteredLanguageExamData.find(lang => lang.Lang_Code === langCode);
	        if (language) {
	            var exam = language.Exams.find(exam => exam.Exam_Name === examName);
	            return exam || { Exam_Code: "", Exam_Name: examName };
	        }
	        return { Exam_Code: "", Exam_Name: examName };
	    }

		function updateIntroduction(introductionData){
			if(introductionData == null){
				return;
			}
			
			$("#ResumeProfile_Contents_").html(introductionData);
		}
		/* 수정 삭제를 위한 js functions end */
		/* 등록을 위한 js functions start */
		function formatDate(dateString) {
	        if (!dateString) return null;
	        var parts = dateString.split('.');
	        if (parts.length !== 2) return dateString; // 잘못된 형식이면 원래 문자열 반환
	        return parts[0] + '-' + (parts[1].length === 1 ? '0' + parts[1] : parts[1]) + '-01'; // 월을 2자리로 만들고 일을 01로 설정
	    }
		
		function removeCommasAndParseInt(str) {
		    return parseInt(str.replace(/,/g, ''), 10);
		}
		
		function createResumeData() {
		    const mainData = {
		    	id: "${resumeNum}",
		        owner: $('#UserInfo_M_Name').val(),
		        email: $('#UserInfo_M_Email').val(),
		        title: $('#UserResume_M_Resume_Title').val(),
		        profile: "profile_1.png",
		        birth: formatDate($('#UserInfo_M_Born').val()),
		        gender: $('#genderSelect').val(),
		        tel: $('input[name="UserInfo.M_Hand_Phone"]').eq(0).val(),
		        phone: $('input[name="UserInfo.M_Hand_Phone"]').eq(1).val(),
		        addr: ($('#sido1').val() + ' ' + $('#gugun1').val()).trim(),
		        introduce: $('.textarea-introduction textarea').val(),
		        modifyDate: new Date().toISOString().split('T')[0]
		    };

		    const subData = {
		        skills: $('.chip.active').map(function() {
		            return { skillName: $(this).data('value') };
		        }).get(),
		        education: $('.formWrapEducation .container').map(function() {
		            const $this = $(this);
		            return {
		                schoolClassification: $this.find('[name$="Mstr_Dctr_Type_Code"]').val(),
		                schoolName: $this.find('input[data-type="School_Name"][type="text"]').val(),
		                admissionDate: formatDate($this.find('[name$="Entc_YM"]').val()),
		                graduationDate: formatDate($this.find('[name$="Grad_YM"]').val()),
		                graduationState: $this.find('.dropdown-edcation-state .button.buttonChoose span').text(),
		                major: $this.find('[id^="univmajor_"]').val(),
		                grades: parseFloat($this.find('[name$="Grade"]').val()),
		                totalScore: parseFloat($this.find('[name$="Grade_Prft_Scr"]').val())
		            };
		        }).get(),
		        career: $('.formWrapCareer .container').map(function() {
		            const $this = $(this);
		            return {
		                companyName: $this.find('[id^="Career_C_Name_"]').val(),
		                dname: $this.find('[id^="Career_C_Part_"]').val(),
		                joinDate: formatDate($this.find('[id^="Career_CSYM_"]').val()),
		                resignationDate: formatDate($this.find('[id^="Career_CEYM_"]').val()), // 1일씩 밀리는 이슈
		                jobDescription: $this.find('.textarea-career').val(),
		                position: $this.find('[name="position_field"]').val(),
		                sal: parseInt(removeCommas($this.find('[id^="Career_M_MainPay_User_"]').val()))
		            };
		        }).get(),
		        certifications: $('.formWrapCertificate .container').map(function() {
		            const $this = $(this);
		            return {
		                certificateName: $this.find('[id^="License_Search_"]').val(),
		                publisher: $this.find('[id^="License_Lc_Pub_"]').val(),
		                acquisitionDate: formatDate($this.find('[id^="License_Lc_YYMM_"]').val())
		            };
		        }).get(),
		        languages: $('.formWrapLanguage .container').map(function() {
		            const $this = $(this);
		            const evalCategory = $this.find('[id^="Language_Eval_Category_"]').val();
		            const isConversation = evalCategory === '1';

		            return {
		                language: $this.find('.dropdown-language-name .button.buttonChoose > span').text().trim(),
		                testName: isConversation ? null : $this.find('.devExamDropdown .button.buttonChoose > span').text().trim(),
		                langLevel: isConversation 
		                    ? $this.find('.devConversationArea .dropdown-language-grade .button.buttonChoose > span').text().trim()
		                    : $this.find('.devExamArea [id^="Language_Test1_Point_I_"]').val(),
		                category: isConversation ? '회화능력' : '공인시험',
		                acquisitionDate: formatDate($this.find('[id^="Language_Test_YYMM_"]').val())
		            };
		        }).get()
		    };

		    Object.keys(subData).forEach(key => {
		        if (Array.isArray(subData[key]) && subData[key].length === 0) {
		            delete subData[key];
		        }
		    });

		    return {
		        ...mainData,
		        subData: JSON.stringify(subData)
		    };
		}
		
		function formatDate(dateString) {
		    if (!dateString) return null;
		    const date = new Date(dateString);
		    return date.toISOString().split('T')[0];
		}

		function removeCommas(str) {
		    return str.replace(/,/g, '');
		}

		/* 등록을 위한 js functions end */
	</script>
</head>
<body>
    <div id="__next" data-reactroot="">
		<jsp:include page="../assets/layout/user/header.jsp" />
		<main class="JobsFeed_Jobsfeed__DpeV9">  
			<section class="Section_Section__P1hhc">
			<!-- golgolz start -->
				<div class="resumePage">
					<form action="https://www.jobkorea.co.kr/User/Resume/Save" method="post" id="frm1">
						<div class="resumeWrapper">
							<div class="resumeContainer">
								<h2 style="font-size: 36px; color:#000; margin-bottom: 20px; font-weight: bold;">이력서 등록</h2>
								<div class="formWrap formWrapCareer" id="formCareer" style="">
									<div class="header">
										<h2 class="header">제목</h2>
									</div>
								</div>
								<div class="resumeTitle">
									<input id="UserResume_M_Resume_Title" maxlength="100" name="UserResume.M_Resume_Title" placeholder="기업에게 나에 대해 알려줍시다. 강점, 목표, 관심분야도 좋아요." type="text" value="" autofocus />
								</div>
 								<jsp:include page="./category/profile.jsp" />
 								<jsp:include page="./category/skill.jsp" />
 								<jsp:include page="./category/edu.jsp" />
 								<jsp:include page="./category/career.jsp" />
 								<jsp:include page="./category/certification.jsp" />
 								<jsp:include page="./category/language.jsp" />
 								<jsp:include page="./category/introduction.jsp" />
								<div id="resumeBtns">
									<c:choose>
        								<c:when test="${not empty resumeNum}">
											<input type="button" id="updateBtn" class="golgolBtn btn btn-outline-warning btn-sm update-btn" value="수정" />
											<input type="button" id="removeBtn" class="golgolBtn btn btn-outline-danger btn-sm remove-btn" value="삭제" />
								    	</c:when>
        								<c:otherwise>
											<input type="button" id="registerBtn" class="golgolBtn btn btn-outline-success btn-sm register-btn" value="등록" />
								        </c:otherwise>
								    </c:choose>
								</div>
							</div>
						</div>
					</form>
				</div>
				<div id="healthLayer" style="display: none"></div>
				<script src="http://localhost/recruit-app/assets/js/user/resume/countdown.js"></script>
				<script src="http://localhost/recruit-app/assets/js/user/resume/LoginWatcher.js"></script>
				<script type="text/javascript" src="http://localhost/recruit-app/assets/js/user/resume/page_leave.js"></script>
				<script type="text/template" id="tplKeywordCheckBox"></script>
				<script type="text/template" id="tplCommonDirectInput"></script>
				<script type="text/template" id="tplCommonNotFound"></script>
				<script type="text/template" id="tplCommonSearch"></script>
				<script type="text/template" id="tplDepthCommonItem"></script>
			<!-- golgolz end -->
			</section>
			<jsp:include page="../assets/layout/user/footer.jsp" />  
		</main>
	</div>
</body>
</html>
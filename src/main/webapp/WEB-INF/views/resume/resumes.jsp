<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    info=""%>
<%
String userId = (String)session.getAttribute("userId");
%>
<!DOCTYPE html>
<html>
<head>
	<!-- golgolz start -->
    <link href="http://localhost/recruit-app/assets/css/resume/mtu_common-sv-202405081446.css" rel="stylesheet" type="text/css" />
    <link href="http://localhost/recruit-app/assets/css/resume/mtu_style-sv-202405161357.css" rel="stylesheet" type="text/css"  />
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
	<!-- golgolz end -->
	<jsp:include page="../assets/layout/user/lib.jsp" />  
    <script src="https://code.jquery.com/jquery-3.7.1.js" integrity="sha256-eKhayi8LEQwp4NKxN+CfCh+3qOVUtJn3QNZ0TciWLP4=" crossorigin="anonymous"></script>
	<style text="text/css">
		<!-- golgolz start -->
		#container{
			border: none;
			min-height: 1200px;
		}
        #registerBtn {
        	font-size: 18px;
        	width: 112px;
        	padding: auto 0;
        	margin: 0px 10px;
        }
        .golgolBtn {
	        height: 40px;
			padding: 0 16px;
			font-size: 14px;
			min-width: 48px;
        }
        #container, .container, .content {
        	width: 1100px;
        }
        .col{
        	font-size: 14px;
        }
        .mtuList .col01 .tit a {
		    font-size: 23px;
		}
        .mtuList .col01 .date {
		    font-size: 18px;
		}
		<!-- golgolz end -->
	</style>
	<script text="text/javascript">
		var id = "<%= session.getAttribute("userId") %>";
		var recruitNum = "${recruit}";
		
		$(function(){
			<!-- golgolz start -->
			
			$("#registerBtn").click(function(){
				location.href = "http://localhost/recruit-app/resume/detail.do";
			});
			
			$.ajax({
	            url: "${pageContext.request.contextPath}/api/resumes.do?id=" + id,
	            method: 'GET',
	            dataType: 'JSON',
	            success: function(data) {
	    			updateResumeList(data);
	            	if(data.size === 0){
	            		isNoResult = true;
	            		$("#recruit-list tbody").html('<tr><td colspan="4" style="font-size: 16px; font-weight: bold;">검색 결과가 없습니다.</td></tr>');
	            	}
	            },
	            error: function(xhr, status, error) {
	                console.error("Error fetching data: " + error);
	                $("#recruit-list tbody").html('<tr><td colspan="4" style="font-size: 16px; font-weight: bold;">데이터를 불러오는 데 실패했습니다.</td></tr>');
	            }
	        });
			<!-- golgolz end -->
		});
		
		function updateResumeList(data) {
		    var mtuList = document.querySelector('.mtuList ul');
		    mtuList.innerHTML = '';
		    if(recruitNum){
			    for (var i = 0; i < data.length; i++) {
			        var resume = data[i];
			        var li = document.createElement('li');
			        li.innerHTML = 
			            '<div class="col col01">' +
			                '<div class="tit">' +
			                    '<a href="http://localhost/recruit-app/resume/detail.do?id=' + resume.resumeNum + '">' + resume.title + '</a>' +
			                '</div>' +
			                '<div class="date">' + resume.inputDate + '</div>' +
			            '</div>' +
			            '<div class="col col02">' +
			                '<div class="btnCell">' +
			                    '<input type="button" class="selectBtn golgolBtn btn btn-outline-primary btn-sm" data-resume="' + resume.resumeNum + '" value="선택" />' +
			                '</div>' +
			                '<div class="btnCell">' +
			                    '<input type="button" class="updateBtn golgolBtn btn btn-outline-primary btn-sm" data-resume="' + resume.resumeNum + '" value="수정" />' +
			                '</div>' +
			                '<div class="btnCell">' +
			                    '<input type="button" class="removeBtn golgolBtn btn btn-outline-primary btn-sm" data-resume="' + resume.resumeNum + '" value="삭제" />' +
			                '</div>' +
			            '</div>';
			        mtuList.appendChild(li);
			    }

			    // 이벤트 위임을 사용하여 버튼에 이벤트 핸들러 추가
			    $('.mtuList ul').on('click', '.selectBtn', function() {
			        apply($(this).data('resume'));
			    });

			    $('.mtuList ul').on('click', '.updateBtn', function() {
			        var resumeNum = $(this).data('resume');
			        window.location.href = 'http://localhost/recruit-app/resume/detail.do?id=' + resumeNum;
			    });

			    $('.mtuList ul').on('click', '.removeBtn', function() {
			        var resumeNum = $(this).data('resume');
			        if(confirm("삭제하시겠습니까?")) {
			            $.ajax({
			                url: "${pageContext.request.contextPath}/api/resume.do?id=" + resumeNum,
			                type: "DELETE",
			                success: function(data) {
			                    alert("삭제가 완료되었습니다.");
			                    // 삭제 후 목록을 다시 불러오는 로직 추가
			                },
			                error: function(xhr, status, error) {
			                    console.log("fail");
			                }
			            });
			        }
			    });
		    } else {
			    for (var i = 0; i < data.length; i++) {
			        var resume = data[i];
			        var li = document.createElement('li');
			        li.innerHTML = 
			            '<div class="col col01">' +
			                '<div class="tit">' +
			                    '<a href="http://localhost/recruit-app/resume/detail.do?id=' + resume.resumeNum + '">' + resume.title + '</a>' +
			                '</div>' +
			                '<div class="date">' + resume.inputDate + '</div>' +
			            '</div>' +
			            '<div class="col col02">' +
			                '<div class="btnCell">' +
			                    '<input type="button" class="updateBtn golgolBtn btn btn-outline-primary btn-sm" data-resume="' + resume.resumeNum + '" value="수정" />' +
			                '</div>' +
			                '<div class="btnCell">' +
			                    '<input type="button" class="removeBtn golgolBtn btn btn-outline-primary btn-sm" data-resume="' + resume.resumeNum + '" value="삭제" />' +
			                '</div>' +
			            '</div>';
			        mtuList.appendChild(li);
			    }

			    // 이벤트 위임을 사용하여 버튼에 이벤트 핸들러 추가
			    $('.mtuList ul').on('click', '.selectBtn', function() {
			        apply($(this).data('resume'));
			    });

			    $('.mtuList ul').on('click', '.updateBtn', function() {
			        var resumeNum = $(this).data('resume');
			        window.location.href = 'http://localhost/recruit-app/resume/detail.do?id=' + resumeNum;
			    });

			    $('.mtuList ul').on('click', '.removeBtn', function() {
			        var resumeNum = $(this).data('resume');
			        if(confirm("삭제하시겠습니까?")) {
			            $.ajax({
			                url: "${pageContext.request.contextPath}/api/resume.do?id=" + resumeNum,
			                type: "DELETE",
			                success: function(data) {
			                    alert("삭제가 완료되었습니다.");
			                    // 삭제 후 목록을 다시 불러오는 로직 추가
			                },
			                error: function(xhr, status, error) {
			                    console.log("fail");
			                }
			            });
			        }
			    });
		    }
		}
		
		function apply(resumeNum){
			if(confirm("해당 이력서로 지원하시겠습니까?")){
        		$.ajax({
    	            url: "${pageContext.request.contextPath}/api/apply.do",
    	            method: 'POST',
    	            data: JSON.stringify(createApplyVO(resumeNum)),
    	            contentType: 'application/json',
    	            success: function(data) {
    	            	if(data === "success"){
    						alert("지원 완료되었습니다.");
    						return;
    	            	}
    	            	
    	            	alert("오류가 발생했습니다. 자세한 사항은 관리자에게 문의하세요.");
    	            },
    	            error: function(xhr, status, error) {
    	                console.error("Error fetching data: " + error);
    	                $("#recruit-list tbody").html('<tr><td colspan="4" style="font-size: 16px; font-weight: bold;">데이터를 불러오는 데 실패했습니다.</td></tr>');
    	            }
    	        });
        	}
		}
		
		function createApplyVO(resumeNum){
			return{
				userId: id,
				recruitNum: recruitNum,
				resumeNum: resumeNum
			};
		}
	</script>
</head>
<body>
    <div id="__next" data-reactroot="">
		<jsp:include page="../assets/layout/user/header.jsp" />
		<main class="JobsFeed_Jobsfeed__DpeV9">  
			<div>
			</div>
			<section class="Section_Section__P1hhc">
			<!-- golgolz start -->
	        	<section id="container">
	       			<section class="content">
	            		<div class="ResumeMngCont">
	              			<div class="hdWrap">
	                			<h2 class="hd_1" style="font-weight: bold;">이력서 목록</h2>
	              			</div>
	              			<div class="btnBx">
	                			<input type="button" id="registerBtn" class="btn btn-outline-primary btn-sm" value="이력서 등록" />
	              			</div>
	              			<div>
	                			<div class="tableList">
	                  				<div class="">
	                    				<div class="listSortArea">
	                      					<div class="col col01" style="font-size:16px; font-weight: 500;">이력서 제목</div>
	                      					<div class="col col02" style="font-size:16px; font-weight: 500;">이력서 관리</div>
	                    				</div>
	                    				<div class="mtuList">
	                    					<ul>
	                    						<li></li>
	                    					</ul>
	                    				</div>
	                  				</div>
	                  				<!-- TIP -->
	                  				<div class="mtuTip">
	                    				<strong class="skip">이용 TIP</strong>
	                    				<ul class="tipList">
	                      					<li>
	                        					입사지원을 한 후 해당 이력서의 내용을 수정해도
	                        					<em>이전에 지원한 이력서의 내용은 바뀌지 않으므로</em>
	                        					회사마다 이력서 내용을 다르게 지원할 수 있습니다.
	                      					</li>
	                    				</ul>
	                  				</div>
	                			</div>
	              			</div>
	            		</div>
	          		</section>
	        	</section>
			<!-- golgolz end -->
			</section>
			<jsp:include page="../assets/layout/user/footer.jsp" />  
		</main>
	</div>
</body>
</html>
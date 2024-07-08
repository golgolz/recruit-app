<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    info=""%>
<!DOCTYPE html>
<html>
<head>
	<!-- golgolz start -->
    <link href="https://doberman-ready-termite.ngrok-free.app/recruit-app/assets/css/resume/mtu_common-sv-202405081446.css" rel="stylesheet" type="text/css" />
    <link href="https://doberman-ready-termite.ngrok-free.app/recruit-app/assets/css/resume/mtu_style-sv-202405161357.css" rel="stylesheet" type="text/css"  />
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
	<!-- golgolz end -->
	<jsp:include page="../assets/layout/user/lib.jsp" />  
    <script src="https://code.jquery.com/jquery-3.7.1.js" integrity="sha256-eKhayi8LEQwp4NKxN+CfCh+3qOVUtJn3QNZ0TciWLP4=" crossorigin="anonymous"></script>
	<style text="text/css">
		<!-- golgolz start -->
		#container{
			border: none;
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
        	width: 1300px;
        }
		<!-- golgolz end -->
	</style>
	<script text="text/javascript">
		$(function(){
			<!-- golgolz start -->
			$("#registerBtn").click(function(){
				location.href = "https://doberman-ready-termite.ngrok-free.app/recruit-app/resume/detail.jsp";
			});

			$("#updateBtn").click(function(){
				location.href = "https://doberman-ready-termite.ngrok-free.app/recruit-app/resume/detail.jsp";
			});

			$("#removeBtn").click(function(){
				confirm("삭제하시겠습니까?");
			});
			<!-- golgolz end -->
		});
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
	                			<h2 class="hd_1" style="font-weight: bold;">이력서 관리</h2>
	              			</div>
	              			<div class="btnBx">
	                			<input type="button" id="registerBtn" class="btn btn-outline-primary btn-sm" value="이력서 등록" />
	              			</div>
	              			<div>
	                			<div class="tableList">
	                  				<div class="">
	                    				<div class="listSortArea">
	                      					<div class="col col01">이력서 제목</div>
	                      					<div class="col col02">이력서 관리</div>
	                    				</div>
	                    				<div class="mtuList">
	                      					<ul>
	                        					<li>
	                          						<div class="col col01">
		                            					<div class="tit">
		                              						<a href="https://doberman-ready-termite.ngrok-free.app/recruit-app/resume/detail.jsp" target="_blank">기본 이력서 2</a>
	                            						</div>
	                            						<div class="date">2024.06.02</div>
	                          						</div>
	                          						<div class="col col02">
	                            						<div class="btnCell">
	                              							<input type="button" id="updateBtn" class="golgolBtn btn btn-outline-primary btn-sm" value="수정" />
	                            						</div>
		                            					<div class="btnCell">
															<input type="button" id="removeBtn" class="golgolBtn btn btn-outline-primary btn-sm" value="삭제" />
		                            					</div>
	                          						</div>
	                        					</li>
	                        					<li>
	                          						<div class="col col01">
		                            					<div class="tit">
		                              						<a href="https://doberman-ready-termite.ngrok-free.app/recruit-app/resume/detail.jsp" target="_blank">기본 이력서 2</a>
	                            						</div>
	                            						<div class="date">2024.06.02</div>
	                          						</div>
	                          						<div class="col col02">
	                            						<div class="btnCell">
	                              							<input type="button" id="updateBtn" class="golgolBtn btn btn-outline-primary btn-sm" value="수정" />
	                            						</div>
		                            					<div class="btnCell">
															<input type="button" id="removeBtn" class="golgolBtn btn btn-outline-primary btn-sm" value="삭제" />
		                            					</div>
	                          						</div>
	                        					</li>
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
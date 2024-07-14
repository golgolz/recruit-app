<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" info=""%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<link href="http://localhost/recruit-app/assets/css/layout/user/common-sv-202405271315.css" rel="stylesheet" type="text/css" />
<link href="//i.jobkorea.kr/content/css/ver_2/event/banner.promotion-sv-202401301659.css" rel="stylesheet" type="text/css" />
<!-- <link href="view-source:https://www.jobkorea.co.kr/help/inquiry" rel="stylesheet" type="text/css" /> -->
<link href="https://i.jobkorea.kr/deploy/pc/dist/css/personal/common/gnb-sv-202405231305.css" rel="stylesheet" type="text/css" />
<link href="https://i.jobkorea.kr/content/css/ver_2/mtc/mtc_lounge-sv-202402231655.css" rel="stylesheet" type="text/css" />
<link href="https://i.jobkorea.kr/content/css/ver_2/help/help-sv-202402231655.css" rel="stylesheet" type="text/css" />
<link href="https://i.jobkorea.kr/deploy/pc/dist/css/personal/layout/footer-sv-202405131313.css" rel="stylesheet" type="text/css" />
<link href="https://i.jobkorea.kr/deploy/pc/dist/css/personal/pages/main/auto_search-sv-202405231305.css" rel="stylesheet" type="text/css" />
<link href="https://i.jobkorea.kr/content/css/ver_2/mtc/inquiry_selection.css?v=2024052914000" rel="stylesheet" type="text/css" />
<jsp:include page="../../assets/layout/admin/lib.jsp" />


<!-- summernote -->
<script src="https://code.jquery.com/jquery-3.4.1.slim.min.js"
	integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n"
	crossorigin="anonymous"></script>
<link
	href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.css"
	rel="stylesheet">
<script
	src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.js"></script>
<!-- summernote -->

<style type="text/css">
	#newQnaFrm{margin:54px 40px 40px 280px; width:1614px; padding-left:28px;}
</style>

<script type="text/javascript">
	$(function(){
    	$("#qna_menu").addClass("bg-gradient-primary");
	});
</script>
<!-- golgolz start -->
<script type="text/javascript">
	$(function() {
		$("#qna_menu").addClass("bg-gradient-primary");
		$('#ans_content').summernote(
				{
					placeholder : 'Hello stand alone ui',
					tabsize : 2,
					width : 1435,
					height : 500,
					toolbar : [ [ 'style', [ 'style' ] ],
							[ 'font', [ 'bold', 'underline', 'clear' ] ],
							[ 'color', [ 'color' ] ],
							[ 'para', [ 'ul', 'ol', 'paragraph' ] ],
							[ 'table', [ 'table' ] ],
							[ 'insert', [ 'link', 'picture', 'video' ] ],
							[ 'view', [ 'fullscreen', 'codeview', 'help' ] ] ]
				});//summernote
				$("#btnSend").click(function(event) {
	                event.preventDefault(); // 기본 제출 방지

	                // summernote의 내용을 가져옴
	                var content = $('#ans_content').summernote('code');

	                // p 태그를 제거함
	                var sanitizedContent = content.replace(/<\/?p[^>]*>/g, '');

	                // summernote 내용을 업데이트
	                $('#ans_content').summernote('code', sanitizedContent);
			$("#answerPost").submit();
		}); //click
	});//ready
</script>

<style>
	table{
		width: 100%;
	}
	#emailFrm{
		margin:55px 40px 40px 8px; width:1500px; padding-left:28px
	}
	.note-editor{
		margin-top: 10px;
	}
	.typeWrite{
		width: 1435px;
	}
	tbody{
		border: 1px solid #e9e9e9;
	}
	.ec-base-table table:before{
		border: 1px solid #e9e9e9;
		width: 1px;
	}
	th{
		font-size: 14px;
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
							aria-current="page">문의 관리</li>
					</ol>
					<h6 class="font-weight-bolder mb-0">문의 관리</h6>
				</nav>
			</div>
		</nav>
	</main>
	
	<!-- golgolz start -->
	<div>
	<div class="loungeContent inquiryContent" id="newQnaFrm">

					<!--// 내 제안내역 보기 상세 -->
					<div class="inquiryViewWrap">
						<div class="inquiryView">
							<div class="viewCont">
								<dl class="inqCont">
									<dt><strong><c:out value="${newDetail.category}"/></strong> <c:out value="${newDetail.input_date}"/></dt>
									<dd><c:out value="${newDetail.title}"/></dd><br/>
									<c:out value="${newDetail.content}"/>
									<%-- <c:out value="${newDetail.ans_content}"/> --%>
								</dl>
							</div>

							<div class="viewCont">
							</div>
						</div>

					</div>
				<div id="emailFrm">
		<form action="${pageContext.request.contextPath}/manage/qna/qnas.do" method="post" id="answerPost">
		<div class="ec-base-table typeWrite ">
		<table border="1" summary="">
			<colgroup>
				<col style="width: 130px;" />
				<col style="width: auto;" />
			</colgroup>
			<tbody>
				<tr>
				</tr>
				<tr>
					<th scope="row">제목</th>
					<td><input id="title" name="ans_title" class="inputTypeText"
						placeholder="" maxLength="125" style="width: 100%"  value="${newDetail.ans_title}" type="text" /></td> <!--qna title에서 re:가 붙어야 함. -->
				</tr>
				<tr>
					<th scope="row">송신 이메일</th>
					<td><input id="user_id" name="user_id" class="inputTypeText"
						style="width: 100%" placeholder="" maxLength="125" value="${newDetail.user_id}" type="text" />
					<input id="reply_date" name="qna_num"  value="${param.qna_num}" type="hidden" /> <!-- sysdate-->
						</td> <!-- requestScope.어쩌구 ??? -->
				</tr>
			</tbody>
		</table>
		</div>
		
		<textarea  id="ans_content" name="ans_content" style="margin-left: 600px">${newDetail.ans_content}</textarea>
		<div id="emailButtonArea" style="margin-top: 20px; padding-bottom: 40px">
			<input type="button" value="취소" class="btn btn-outline-danger " style="float:right ; margin-right : 40px" onclick="location.href='http://localhost/recruit-app/manage/qna/new_qnas.do';">
			<input type="button" value="전송하기" class="btn btn-outline-secondary " style="float:right ; margin-right : 10px" id="btnSend">
			
		</div>
		</div>
					<!-- 내 제안내역 보기 상세 //-->
				</div>
		</div>
		
	<!-- golgolz end -->
</body>
</html>
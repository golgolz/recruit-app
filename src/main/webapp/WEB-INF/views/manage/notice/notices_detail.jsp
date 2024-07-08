<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" info=""%>
<!DOCTYPE html>
<html>
<head>
<!-- golgolz start -->
<jsp:include page="../../assets/layout/admin/lib.jsp" />
<link href="https://i.jobkorea.kr/content/css/ver_2/mtc/mtc_lounge-sv-202402231655.css" rel="stylesheet" type="text/css" />
<script type="text/javascript">
	$(function(){
		$("#notice_menu").addClass("bg-gradient-primary");
	});
</script>
<style>
	.noticeViewWrap{
		margin-left: 25px;
		margin-top: 0px;
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
							aria-current="page">공지사항 관리</li>
					</ol>
					<h6 class="font-weight-bolder mb-0">공지사항 상세</h6>
				</nav>
			</div>
		</nav>
		<div class="container-fluid py-4">
			<!-- golgolz start -->
			<div>
				<div class="loungeContent noticeViewContent" id="notice_detail_view">
			        <div class="noticeViewWrap">
			            <p class="noticeTit">
			                <span style="font-size:15px">일반공지</span>
			                <span style="margin-left:20px; color:#000000; font-size:15px">[시스템 점검 공지] 3/28(목) AM 01시-05시</span>
			                <span style="margin-left: auto">2020.02.03</span>
			            </p>
			            <div class="noticeView">
			                <!--// 공지사항 내용 -->
			                        <p>안녕하세요. 잡코리아 운영자입니다. 더욱 좋은 서비스로 보답할 수 있도록 노력하겠습니다.</p>
			                <!-- 공지사항 내용 //-->
			            </div>
			            <div>
			                <input type="button" class="btn btn-outline-dark btn-sm detail-control" value="뒤로" onclick="location.href='https://doberman-ready-termite.ngrok-free.app/recruit-app/manage/notice/notices.do'">
			                <input type="button" class="btn btn-outline-warning btn-sm" value="수정" onclick="location.href='https://doberman-ready-termite.ngrok-free.app/recruit-app/manage/notice/noticesUpdate.do'">
			                <input type="button" class="btn btn-outline-danger btn-sm" value="삭제" onclick="location.href='https://doberman-ready-termite.ngrok-free.app/recruit-app/manage/notice/notices.do'">
			            </div>
			        </div>
			    </div>
			</div>
			<!-- golgolz end -->
		</div>
	</main>
</body>
</html>
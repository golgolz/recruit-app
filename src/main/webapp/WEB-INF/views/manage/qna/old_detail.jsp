<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" info=""%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<link href="http://localhost/recruit-app/assets/css/layout/user/common-sv-202405271315.css" rel="stylesheet" type="text/css" />
<link href="//i.jobkorea.kr/content/css/ver_2/event/banner.promotion-sv-202401301659.css" rel="stylesheet" type="text/css" />
<link href="view-source:https://www.jobkorea.co.kr/help/inquiry" rel="stylesheet" type="text/css" />
<link href="https://i.jobkorea.kr/deploy/pc/dist/css/personal/common/gnb-sv-202405231305.css" rel="stylesheet" type="text/css" />
<link href="https://i.jobkorea.kr/content/css/ver_2/mtc/mtc_lounge-sv-202402231655.css" rel="stylesheet" type="text/css" />
<link href="https://i.jobkorea.kr/content/css/ver_2/help/help-sv-202402231655.css" rel="stylesheet" type="text/css" />
<link href="https://i.jobkorea.kr/deploy/pc/dist/css/personal/layout/footer-sv-202405131313.css" rel="stylesheet" type="text/css" />
<link href="https://i.jobkorea.kr/deploy/pc/dist/css/personal/pages/main/auto_search-sv-202405231305.css" rel="stylesheet" type="text/css" />
<link href="https://i.jobkorea.kr/content/css/ver_2/mtc/inquiry_selection.css?v=2024052914000" rel="stylesheet" type="text/css" />
<jsp:include page="../../assets/layout/admin/lib.jsp" />

<style type="text/css">
	#qnaDetailFrm{margin:54px 40px 40px 280px; width:1614px; padding-left:28px;}
</style>

<script type="text/javascript">
	$(function(){
    	$("#qna_menu").addClass("bg-gradient-primary");
	});
</script>
<!-- golgolz start -->
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
	<div class="loungeContent inquiryContent" id="qnaDetailFrm">
					<!-- <div class="topHdWrap">
						<h2 class="lug_hd_2">문의</h2>
					</div> -->

					<!--// 내 제안내역 보기 상세 -->
					<div class="inquiryViewWrap">
						<div class="inquiryView">
							<div class="viewCont">
								<dl class="inqCont">
									<dt><strong>[<c:out value="${oldDetail.category}"/>]</strong><c:out value="${oldDetail.input_date}"/></dt>
									<dd><strong><c:out value="${oldDetail.title}"/></strong></dd><br/>
									<c:out value="${oldDetail.content}"/>
								</dl>
							</div>

							<div class="viewCont">
								<dl class="inqCont">
									<dt><strong>[답변]</strong><c:out value="${oldDetail.reply_date}"/></dt>
									<dd><strong><c:out value="${oldDetail.ans_title}"/></strong><br/></dd><br/>
									<c:out value="${oldDetail.ans_content}"/>
								</dl>
							</div>
						</div>

						<div class="listBtmArea">
							<div class="btnListExDn">
								<!-- <a href="qnas.jsp" class="btnMtcTpl">목록</a> -->
								<input type="button" value="목록" class="btn btn-outline-dark btn-sm detail-control" onclick="location.href='http://localhost/recruit-app/manage/qna/qnas.do'">
							</div>
							<!-- <button type="button" onclick="javascript:window.scrollTo(0,0);" class="btnMtcTpl">TOP</button> -->
						</div>
					</div>
					<!-- 내 제안내역 보기 상세 //-->
				</div>
			</section>
		</div>
	</section>
	<!-- golgolz end -->
</body>
</html>
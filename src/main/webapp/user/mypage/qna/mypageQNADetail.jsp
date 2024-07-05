<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" info=""%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<jsp:include page="../../../assets/layout/user/lib.jsp" />  
	<!-- golgolz start -->
	<link href="https://i.jobkorea.kr/content/css/ver_2/mtc/mtc_lounge-sv-202402231655.css" rel="stylesheet" type="text/css" />
	<link href="https://i.jobkorea.kr/content/css/ver_2/help/help-sv-202402231655.css" rel="stylesheet" type="text/css" />
	<!-- 파비콘 -->
    <link rel="shortcut icon" href="https://static.wanted.co.kr/favicon/new/favicon.ico"/>
    <link rel="stylesheet" href="https://asset.wanted.co.kr/userweb/www/_next/static/css/c76e012c05e1318d.css" crossorigin="anonymous" data-n-g=""/>
	<link rel="stylesheet" href="http://localhost/recruit-app/assets/css/mypage.css"/>
	<link rel="stylesheet" href="http://localhost/recruit-app/assets/css/signup.css"/>
	<!-- bootstrap -->
	<link rel="stylesheet" href="http://localhost/recruit-app/assets/css/layout/user/btn-bootstrap.css" />	
	<!-- bootstrap -->
	
	<!-- golgolz end -->
	<style type="text/css">
		<!-- golgolz start -->
		
		<!-- golgolz end -->
	</style>
	<script type="text/javascript">
		$(function(){
			<!-- golgolz start -->
			<!-- golgolz end -->
		});
	</script>
</head>
<body>
    <div id="__next" data-reactroot="">
		<jsp:include page="../../../assets/layout/user/header.jsp" />
		<main class="JobsFeed_Jobsfeed__DpeV9">  
		<section class="Section_Section__P1hhc">
        <div class="MainLayout_MainLayout__root__p6itg">
          <div class="Grid_Grid__container__J9CcC Grid_Grid__spacing__5__ZwgDV">
          <jsp:include page="../mypage_layout.jsp"/>
          <div class="Grid_Grid__item__FUkSS Grid_Grid__justify_center__QJu2X Grid_Grid__align-items_flex-start__PA0JE Grid_Grid__grid__xs__12__rVqKh Grid_Grid__grid__md__6__9g_JE" style="margin-left:30px">
		  <!-- golgolz start -->
          
			<div style="margin:30px auto 0; width:731px"> 
			<div class="loungeContent inquiryContent" id="form">
			<div class="topHdWrap">
				<h1 style="font-size: 25px;"><strong>문의</strong></h1>
			</div>
			<!--// 내 제안내역 보기 상세 -->
				<div class="inquiryViewWrap">
				<div class="inquiryView">
				<div class="viewCont">
				<dl class="inqCont">
				<dt><strong>[<c:out value="${qnaDetail.category}"/>]</strong> <c:out value="${qnaDetail.input_date}"/></dt>
					<dd><strong><c:out value="${qnaDetail.title}"/></strong></dd><br/>
					<c:out value="${qnaDetail.content}"/>
				</dl>
				</div>
		
				<div class="viewCont">
					<dl class="inqCont">
					<dt><strong>[답변]</strong><c:out value="${qnaDetail.reply_date}"/></dt>
					<dd><strong><c:out value="${qnaDetail.ans_title}"/><strong/></dd><br/>
					<dd><c:out value="${qnaDetail.ans_content}"/></dd>
					</dl>
				</div>
				</div>
		
				<div class="listBtmArea" style="margin-bottom:30px">
				<div class="btnListExDn">
					<a href="http://localhost/recruit-app/user/mypage/qna/mypageQNAList.do" class="btnMtcTpl">목록</a>
					<!-- <input type="btton" value="목록" class="btn btn-outline-dark btn-sm detail-control"> -->
				</div>
					<!-- <button type="button" onclick="javascript:window.scrollTo(0,0);" class="btnMtcTpl">TOP</button> -->
				</div>
				</div>
			<!-- 내 제안내역 보기 상세 //-->
			</div>
			</section>
			</div>
			</div>
		  <!-- golgolz end -->
          </div>
        </div>
			</section>
			<jsp:include page="../../../assets/layout/user/footer.jsp" />
		</main>
	</div>
</body>
</html>
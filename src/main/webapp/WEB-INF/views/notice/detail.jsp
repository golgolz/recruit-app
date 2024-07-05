<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" info=""%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<link href="https://i.jobkorea.kr/content/css/ver_2/event/banner.promotion-sv-202401301659.css" rel="stylesheet" type="text/css" />
<link href="https://i.jobkorea.kr/content/css/ver_2/common-sv-202405271315.css" rel="stylesheet" type="text/css" />
<link href="https://i.jobkorea.kr/deploy/pc/dist/css/personal/common/gnb-sv-202405231305.css" rel="stylesheet" type="text/css" />
<link href="https://i.jobkorea.kr/content/css/ver_2/mtc/mtc_lounge-sv-202402231655.css" rel="stylesheet" type="text/css" /><!--  -->
<link href="https://i.jobkorea.kr/content/css/ver_2/help/help-sv-202402231655.css" rel="stylesheet" type="text/css" /><!--  -->
<link href="https://i.jobkorea.kr/deploy/pc/dist/css/personal/layout/footer-sv-202405131313.css" rel="stylesheet" type="text/css" />
<link href="https://i.jobkorea.kr/deploy/pc/dist/css/personal/pages/main/auto_search-sv-202405231305.css" rel="stylesheet" type="text/css" />

<!-- bootstrap -->
	<link rel="stylesheet" href="http://localhost/recruit-app/assets/css/layout/user/btn-bootstrap.css" />
<!-- bootstrap -->
	
	<jsp:include page="../assets/layout/user/lib.jsp" />  
	<!-- golgolz start -->
	
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
    <div id="__next" data-reactroot="" >
		<jsp:include page="../assets/layout/user/header.jsp" />
		<main class="JobsFeed_Jobsfeed__DpeV9">  
			<section class="Section_Section__P1hhc">
			<!-- golgolz start -->
			
	<div>
	<div class="loungeContent noticeViewContent" style="width: 100% ; max-width: 1300px; margin: 30px auto; box-sizing: border-box; padding: 20px;">
        <div class="topHdWrap clear" >
            <h2 class="lug_hd_2">공지사항</h2>
        </div>

        <div class="noticeViewWrap">
            <p class="noticeTit">
                <span class="sort" style="margin-right:40px ; text-align:center"><c:out value="${noticeDetail.category}"/></span>
                <span class="tit" style="vertical-align:middle"><c:out value="${noticeDetail.title}"/></span>
                <span class="date" style="display: block; text-align: right; margin-left:750px"><c:out value="${noticeDetail.input_date}"/></span>
            </p>
            <div class="noticeView">
                <!--// 공지사항 내용 -->
                        <p><c:out value="${noticeDetail.content}"/><br/></p>
                        <input type="hidden" id="notice_num" name="notice_num"  value="${noticeDetail.notice_num}"/>

                <!-- 공지사항 내용 //-->
            </div>
            <div class="listBtmArea" style="margin-bottom:30px">
                <div class="btnListExDn">
               <!--  <input type="btton" value="목록" class="btn btn-outline-dark btn-sm detail-control"> -->
                    <a href="http://localhost/recruit-app/notice/notices.do" class="btnMtcTpl">목록</a>
                </div>
                <!-- <button type="button" onclick="javascript: window.scrollTo(0,0);" class="btnMtcTpl">TOP</button> -->
            </div>
        </div>
    </div>
</div>
			
			<!-- golgolz end -->
			</section>
			<jsp:include page="../assets/layout/user/footer.jsp" />  
		</main>
	</div>
</body>
</html>
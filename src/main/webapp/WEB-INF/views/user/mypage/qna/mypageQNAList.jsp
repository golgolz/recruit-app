<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" info="" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<jsp:include page="../../../assets/layout/user/lib.jsp" />  
	<!-- bootstrap -->
	<link rel="stylesheet" href="http://localhost/recruit-app/assets/css/layout/user/btn-bootstrap.css" />
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
	<!-- bootstrap -->
	<!-- golgolz start -->
	<link href="https://i.jobkorea.kr/content/css/ver_2/mtc/mtc_lounge-sv-202402231655.css" rel="stylesheet" type="text/css" />
	<link href="https://i.jobkorea.kr/content/css/ver_2/help/help-sv-202402231655.css" rel="stylesheet" type="text/css" />
	<!-- 파비콘 -->
    <link rel="shortcut icon" href="https://static.wanted.co.kr/favicon/new/favicon.ico"/>
    <link rel="stylesheet" href="https://asset.wanted.co.kr/userweb/www/_next/static/css/c76e012c05e1318d.css" crossorigin="anonymous" data-n-g=""/>
	<link rel="stylesheet" href="http://localhost/recruit-app/assets/css/mypage.css"/>
	<link rel="stylesheet" href="http://localhost/recruit-app/assets/css/signup.css"/>
	
	<!--jQuery CDN 시작-->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
	<!--jQuery CDN 끝-->
	
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
<style>
td{
	font-size: 13px;
}
</style>
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
			<section class="content helpSecCont">
			<div class="loungeContent inquiryContent">
			<div class="topHdWrap">
				<h1 style="font-size:25px;"><strong>문의</strong></h1>
			</div>
		
			<!--// tap menu -->
			<div class="mtcTplTab">
				<ul class="tabItems">
					<li class=""><a href="http://localhost/recruit-app/user/mypage/qna/mypageQnaForm.do">문의</a></li>
					<li class="on"><a href="http://localhost/recruit-app/user/mypage/qna/mypageQNAList.do">문의 내역</a></li>
				</ul>
			</div>
			<!-- tap menu //-->
			<!--// 내 제안내역 보기 -->
			<div class="inquiryListWrap" id="pageContent">
			<!--// List 시작 -->
			<div class="schListWrap">
				<div class="mtcSchListTb">
				<!--[개발] 문의 내용이 없는 경우 hide 처리 -->
					<table summary="내 제안내역 보기 목록으로 글번호, 내용, 날짜, 답변여부로 구성되어 있습니다.">
					<caption>내 제안내역 보기</caption>
					<colgroup>
						<col class="col_1">
						<col class="col_2">
						<col class="col_3">
						<col class="col_4">
					</colgroup>
					<thead class="blind">
						<tr>
							<th scope="col">글번호</th>
							<th scope="col">내용</th>
							<th scope="col">날짜</th>
							<th scope="col">답변여부</th>
						</tr>
						</thead>
						<tbody>
							<c:forEach var="uesrqna" items="${qnaList}">
								<tr>
								<td><c:out value="${uesrqna.qna_num}"/></td>
								<td class="alLeft"><span class="tit"><a href="http://localhost/recruit-app/user/mypage/qna/mypageQNADetail.do?qna_num=${uesrqna.qna_num}"><c:out value="${uesrqna.title}"/></a></span></td>
								<td><c:out value="${uesrqna.input_date}"/></td>
								<td class=""><c:out value="${uesrqna.flag}"/></td>
								</tr>
							</c:forEach>
						</tbody>
						</table>
		
				<div style="text-align:center; margin-top:30px">
			        <nav aria-label="...">
			                <ul class="pagination pagination-lg" style="display: inline-flex;">
			                       <li class="page-item disabled">
			                            <span class="page-link">&lt;</span>
			                        </li>
			                        <li class="page-item"><a class="page-link" href="#">1</a></li>
			                        <li class="page-item active" aria-current="page">
			                            <span class="page-link">2</span>
			                        </li>
			                        <li class="page-item"><a class="page-link" href="#">3</a></li>
			                        <li class="page-item">
			                            <a class="page-link" href="#">&gt;</a>
			                        </li>
			                 </ul>
			         </nav>
			</div>
				
			</div>
			</div>
			</div>
			<!-- List 끝 //-->
			</div>
					</section>
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
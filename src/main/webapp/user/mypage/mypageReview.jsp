<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    info=""%>
<!DOCTYPE html>
<html>
<head>
	<jsp:include page="../../assets/layout/user/lib.jsp" />  
	<!-- golgolz start -->
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
	<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js" integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.min.js" integrity="sha384-0pUGZvbkm6XF6gxjEnlmuGrJXVbNuzT9qBBavbLwCsOGabYfZo0T0to5eqruptLy" crossorigin="anonymous"></script>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
	<link href="https://i.jobkorea.kr/content/css/ver_2/mtc/mtc_lounge-sv-202402231655.css" rel="stylesheet" type="text/css" />
	<link href="https://i.jobkorea.kr/content/css/ver_2/help/help-sv-202402231655.css" rel="stylesheet" type="text/css" />
	
	<!-- 파비콘 -->
    <link rel="shortcut icon" href="https://static.wanted.co.kr/favicon/new/favicon.ico"/>
    <link rel="stylesheet" href="https://asset.wanted.co.kr/userweb/www/_next/static/css/c76e012c05e1318d.css" crossorigin="anonymous" data-n-g=""/>
	<link rel="stylesheet" href="http://localhost/recruit-app/assets/css/mypage.css"/>
	<link rel="stylesheet" href="http://localhost/recruit-app/assets/css/signup.css"/>
	<!-- golgolz end -->
	<style>
	@media (min-width: 1000px) {
    .Grid_Grid__grid__md__6__9g_JE {
        -ms-flex-preferred-size: 50%;
        flex-basis: 100%;
        max-width: 65%;
    }
    }
    .salaryList ol.list, .salaryList ul.list {
    clear: both;
    overflow: hidden;
    position: relative;
    padding: 0 18px;
    margin-bottom: 20px;
    border: 1px solid #d6dce4;
    color: #666;
	}
	.salaryList ol.list li:first-child, .salaryList ul.list li:first-child {
    border-top: 0;
	}
    display: list-item;
    text-align: -webkit-match-parent;
    unicode-bidi: isolate;
	}
	.salaryCompanyList ul.list li {
    position: relative;
    height: 129px;
    padding: 32px 180px 0 220px;
    box-sizing: border-box;
	}
	li {
	.salaryCompanyList ul.list li > a {
    display: block;
    overflow: hidden;
	}
	.salaryCompanyList ul.list .thumbnailText {
    display: table;
    top: 42px;
	}
	.salaryCompanyList ul.list .thumbnail {
    overflow: hidden;
    position: absolute;
    left: 31px;
    top: 46px;
    width: 100px;
    height: 40px;
	}
	.salaryCompanyList ul.list .thumbnailText .inner {
    width: 100px;
    height: 40px;
    display: table-cell;
    vertical-align: middle;
    text-align: center;
    font-size: 14px;
    letter-spacing: 0px;
    font-weight: bold;
    color: #ccc;
    line-height: 1.45;
	}
	.salaryCompanyList ul.list .headers {
    margin-bottom: 9px;
    font-size: 0;
	}
	.salaryCompanyList ul.list .headers .text {
    display: inline-block;
    vertical-align: top;
    color: #333;
    font-size: 21px;
    letter-spacing: -0.5px;
    font-weight: bold;
    vertical-align: middle;
	}
	.salaryCompanyList ul.list .headers .buttonFavorites {
    display: inline-block;
    vertical-align: top;
    position: relative;
    top: 2px;
    overflow: hidden;
    width: 15px;
    height: 13px;
    margin-left: 4px;
    vertical-align: middle;
	}
	.salaryCompanyList ul.list .summary {
    overflow: hidden;
    position: relative;
    font-size: 0;
	}
	.salaryCompanyList ul.list .summary .item {
    display: inline-block;
    vertical-align: top;
    font-size: 15px;
    letter-spacing: 0px;
	}
	.salaryCompanyList ul.list .salary {
    display: table;
    position: absolute;
    right: 31px;
    top: 0;
    height: 100%;
    font-size: 20px;
    letter-spacing: -0.5px;
    color: #999;
	}
	.salaryCompanyList ul.list .salary .inner {
    display: table-cell;
    vertical-align: middle;
	}
	.salaryCompanyList ul.list .salary strong {
    color: #333;
    font-size: 30px;
    letter-spacing: -0.5px;
    font-weight: bold;
	}
    </style>
	<style type="text/css">
	</style>


<script type="text/javascript">
	$(function(){
    	$("#qna_menu").addClass("bg-gradient-primary");
	});
</script>
	<script type="text/javascript">
		$(function(){
			<!-- golgolz start -->
			<!-- golgolz end -->
		});
	</script>
</head>
<body>
    <div id="__next" data-reactroot="">
		<jsp:include page="../../assets/layout/user/header.jsp" />
		<main class="JobsFeed_Jobsfeed__DpeV9">  
			<section class="Section_Section__P1hhc">
			<!-- golgolz start -->
        <div class="MainLayout_MainLayout__root__p6itg">
          <div class="Grid_Grid__container__J9CcC Grid_Grid__spacing__5__ZwgDV">
          <jsp:include page="mypage_layout.jsp"/>
            <div class="Grid_Grid__item__FUkSS Grid_Grid__justify_center__QJu2X Grid_Grid__align-items_flex-start__PA0JE Grid_Grid__grid__xs__12__rVqKh Grid_Grid__grid__md__6__9g_JE">
            <div style="margin: 30px;">
            <h1 style="font-size: 25px;"><strong>리뷰</strong></h1>
			<!--// tap menu -->
			<div class="mtcTplTab" >
				<ul class="tabItems">
					<li class=""><a href="mypageCareer.jsp">나의 커리어</a></li>
					<li class="on"><a href="mypageReview.jsp">나의 리뷰</a></li>
				</ul>
			</div>
			<!-- tap menu //-->
				<div style="margin-top: 30px;">
					<label>나의 리뷰</label>
				</div>
				<div>
					<label>총 <strong>n</strong>건</label>
				</div>
				<div class="row salaryList salaryCompanyList" style="margin-top: 30px;">
				<style>
					table,tr{
					border: 1px solid #edeef0; 
					width: 100%; 
					border-left: none; 
					border-right: none;
					color: gray;
					}
					tr{
					height: 100px;
					}
					.tableHeader{
					text-align: center;
					width: 80px;
					}
					.companyInfo{
					margin-left:10px;
					margin-top: 1px;
					margin-bottom: 1px;
					}
					.reviewTitle{
					font-size: 15px;
					}
					.container{
					margin-bottom: 100px;
					}
				</style>
				<div class="container">
					<table>
						<tr>
							<td class="tableHeader"><h1 style="font-size: 15px;">쿠팡</h1></td>
							<td class="companyInfo">
							<ul class="companyInfo">
								<li class="reviewTitle">좋습니다</li>
								<li class="writeDate">2024-05-11</li>
								<li class="reviewContent">신입사원 초봉이 높아요. 좋아요.</li>
							</ul>
							</td>
							<td class="tableHeader"><input type="button" value="상세보기"></td>
						</tr>
						<tr>
							<td class="tableHeader"><h1 style="font-size: 15px;">배달의 민족</h1></td>
							<td class="companyInfo">
							<ul class="companyInfo">
								<li class="reviewTitle">조금 힘들어요</li>
								<li class="writeDate">2022-01-13</li>
								<li class="reviewContent">일은 힘든데, 성과급을 잘 챙겨줘요.</li>
							</ul>
							</td>
							<td class="tableHeader"><input type="button" value="상세보기"></td>
						</tr>
						<tr">
							<td class="tableHeader"><h1 style="font-size: 15px;">티모넷</h1></td>
							<td class="companyInfo">
							<ul class="companyInfo">
								<li class="reviewTitle">추천해요</li>
								<li class="writeDate">2018-03-10</li>
								<li class="reviewContent">워라벨이 보장돼요.</li>
							</ul>
							</td>
							<td class="tableHeader"><input type="button" value="상세보기"></td>
						</tr>
					</table>
                </div>
				</div>
            </div>
            </div>
          </div>
        </div>
			<!-- golgolz end -->
			</section>
			<jsp:include page="../../assets/layout/user/footer.jsp" />
		</main>
	</div>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" info=""%>
<!DOCTYPE html>
<html>
<head>
<jsp:include page="../../../../assets/layout/user/lib.jsp" />
<!-- golgolz start -->
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<link href="../../assets/css/company/company-info-list-6.css" rel="stylesheet" type="text/css" />
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
	<!-- 파비콘 -->
    <link rel="shortcut icon" href="https://static.wanted.co.kr/favicon/new/favicon.ico"/>
    <link rel="stylesheet" href="https://asset.wanted.co.kr/userweb/www/_next/static/css/c76e012c05e1318d.css" crossorigin="anonymous" data-n-g=""/>
	<link rel="stylesheet" href="http://localhost/recruit-app/assets/css/mypage.css"/>
	<link rel="stylesheet" href="http://localhost/recruit-app/assets/css/signup.css"/>
<!-- golgolz end -->

<style>
@media (max-width: 767px) {
    .Wrapper_Wrapper_container__cnwtJ {
        background-color: #fff;
    }
    .Body_Body__MlgY5 {
        width: calc(100% - 40px);
        margin: 0 20px;
    }
    .Summary_Summary__AO8Mn {
        padding-top: 24px;
        padding-bottom: 12px;
        margin: 0 -20px;
    }
        .Search_Search__MeaMt {
        position: relative;
        padding-top: 8px;
        padding-bottom: 16px;
        margin: 0 -20px;
        height: 56px;
    }
    .Aside_className__y5t_H {
        display: none;
    }
    .Search_Search__MeaMt:after, .Search_Search__MeaMt:before {
        content: "";
        position: absolute;
        top: 0;
        height: 56px;
        width: 20px;
    }
        .Search_Search__MeaMt:before {
        left: 0;
        background: -webkit-gradient(linear, right top, left top, from(rgba(255, 254, 254, 0)), to(#fffefe));
        background: linear-gradient(270deg, rgba(255, 254, 254, 0) 0, #fffefe);
    }
    .Search_Search__MeaMt>div {
        -ms-scroll-snap-type: x mandatory;
        scroll-snap-type: x mandatory;
        overflow-x: auto;
        white-space: nowrap;
        scrollbar-width: none;
        padding: 0 20px;
    }
    .Search_Search_search__RaFaG {
        width: 126px;
    }
    .CalendarBtn_CalendarBtn__tKe6N {
        background-color: transparent;
        -webkit-box-shadow: none;
        box-shadow: none;
    }
}
.Wrapper_Wrapper_container__cnwtJ {
    display: -ms-flexbox;
    display: flex;
    width: 65%;
    text-align: center;
}
.Body_Body__MlgY5 {
    width: 100%;
    margin:10px;
    margin-top: 30px;
    margin-bottom: 300px;
    font-size: 15px;
}

.Summary_Summary__AO8Mn {
    margin-bottom: 50px;
    font-size: 15px;
}
ol, ul {
    list-style: none;
}
.Summary_Summary_list_active__qwfF0, .Summary_Summary_list_active__qwfF0>a, .Summary_Summary_list_active__qwfF0>a dd, .Summary_Summary_list_active__qwfF0>a:active, .Summary_Summary_list_active__qwfF0>a:visited {
    color: #06f; /* 선택한 상태의 색상을 바꾸는 css */
}
.Summary_Summary_list__AyGdy {
    display: inline-block;
    text-align: center;
    color: #86939e;
    width: 24%;
    border-right: 1px solid #d1d1d1;
}
.Summary_Summary_list__AyGdy:last-of-type {
    border: none;
}
.Aside_className__y5t_H {
    float: left;
    width: 25.4716981132%;
    margin-bottom: 0;
    padding-right: 20px;
}
.Search_Search__MeaMt>div, .Search_Search__MeaMt>div div {
    display: -ms-flexbox;
    display: flex;
}
.Search_Search__MeaMt>div {
    -ms-flex-pack: justify;
    justify-content: space-between;
    font-weight: 600;
    font-size: 15px;
    height: 32px;
    margin-bottom: 17px;
}
.Search_Search_search__RaFaG {
    -ms-flex-align: center;
    align-items: center;
    background-color: #fff;
    border: 1px solid hsla(225, 5%, 46%, .22);
    border-radius: 50px;
    width: 180px;
    padding: 6px 20px;
    gap: 9px;
}
.SvgIcon_SvgIcon__root__8vwon {
    display: -ms-flexbox;
    display: flex;
    -ms-flex-align: inherit;
    align-items: inherit;
    -ms-flex-pack: inherit;
    justify-content: inherit;
}
.Search_Search_search__RaFaG svg {
    min-width: 16px;
    width: 16px;
    height: 16px;
}
.SvgIcon_SvgIcon__root__svg__DKYBi {
    -webkit-user-select: none;
    -moz-user-select: none;
    -ms-user-select: none;
    user-select: none;
    width: 1em;
    height: 1em;
    display: inline-block;
    fill: currentColor;
    -ms-flex-negative: 0;
    flex-shrink: 0;
    font-size: inherit;
}
svg:not(:root) {
    overflow-clip-margin: content-box;
    overflow: hidden;
}
.Search_Search_search__RaFaG input {
    width: 100%;
    font-size: 15px;
    border: none;
    color: #333;
    padding: 0;
    background: none;
}
input[type=text], textarea {
    -moz-appearance: none;
    -webkit-appearance: none;
    resize: none;
    outline: none;
}
input, input:focus, input[type=text], textarea {
    -webkit-box-shadow: none !important;
    box-shadow: none !important;
}
input, input:focus {
    outline: none !important;
}
.CalendarBtn_CalendarBtn__tKe6N {
    position: relative;
}
.CalendarBtn_CalendarBtn__tKe6N>button {
    display: -ms-flexbox;
    display: flex;
    -ms-flex-align: center;
    align-items: center;
    gap: 8px;
    min-width: 117px;
    background-color: #fff;
    border: 1px solid hsla(225, 5%, 46%, .22);
    border-radius: 100px;
    margin-left: 12px;
    padding: 6px 20px;
}
.Search_Search__MeaMt button {
    letter-spacing: .0145em;
}
.List_List_empty__pphW6 {
    margin-top: 80px;
    text-align: center;
}
dl {
    display: block;
    margin-block-start: 1em;
    margin-block-end: 1em;
    margin-inline-start: 0px;
    margin-inline-end: 0px;
    unicode-bidi: isolate;
}
@media (min-width: 992px) {
    .MainLayout_MainLayout__sidebar__G8teL {
        display: -ms-flexbox;
        display: flex;
        padding: 59px 0 0 55px;
        border-right: 1px solid #f7f7f7;
    }
        .Grid_Grid__grid__md__4__YPyIl {
        -ms-flex-preferred-size: 33.3333333333%;
        flex-basis: 33.3333333333%;
        max-width: 33.3333333333%;
}
}

.apply_table {
	border-top: 1px solid #dedede;
	border-bottom: 1px solid #dedede;
	width: 95%;
	text-align: center;
	height: 200px;
	font-size: 15px;
	margin-top: 50px;
	margin-bottom: 50px;
}
.apply_table th {
	background-color: #dedede;
	border: 1px solid #dedede;
	width: 20%;
	height: 50px;
	font-size: 15px;
}
.apply_table td {
	border-bottom: 1px solid #dedede;
	font-size: 15px;
}
<!--golgolz end-->
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
		<jsp:include page="../../../../assets/layout/user/header.jsp" />
		<main class="JobsFeed_Jobsfeed__DpeV9">
			<section class="Section_Section__P1hhc">
			<div class="MainLayout_MainLayout__root__p6itg">
          <div class="Grid_Grid__container__J9CcC Grid_Grid__spacing__5__ZwgDV">
			<jsp:include page="mypage_layout.jsp" />
            <div class="Wrapper_Wrapper_container__cnwtJ">
					<section class="Body_Body__MlgY5">
					<div style="text-align: left;  margin-bottom:15px; margin-left:15px;"><h1 style="font-size: 25px;"><strong>지원 현황</strong></h1></div>
						<ul class="Summary_Summary__AO8Mn" >
							<li class="Summary_Summary_list__AyGdy" style="padding-right: 15px;">
							<a href="#void" class="Summary_Summary_list__AyGdy Summary_Summary_list_active__qwfF0"><dl>
										<dt>0</dt>
										<dd>전체</dd>
									</dl></a></li>
							<li class="Summary_Summary_list__AyGdy" ><a
								href="#void" class=""><dl>
										<dt>0</dt>
										<dd>지원 완료</dd>
									</dl></a></li>
							<li
								class="Summary_Summary_list__AyGdy"><a
								href="#void" class=""><dl>
										<dt>0</dt>
										<dd>면접 합격</dd>
									</dl></a></li>
							<li class="Summary_Summary_list__AyGdy"><a
								href="#void" class=""><dl>
										<dt>0</dt>
										<dd>불합격</dd>
									</dl></a></li>
						</ul>
						<div class="Search_Search__MeaMt" >
							<div>
								<div>
									<div class="Search_Search_search__RaFaG" style="width: 200px;">
										<span class="SvgIcon_SvgIcon__root__8vwon" >
										<svg class="SvgIcon_SvgIcon__root__svg__DKYBi" viewBox="0 0 24 24">
										<path fill-rule="evenodd" clip-rule="evenodd" 
											d="M9.99961 2.1001C5.63656 2.1001 2.09961 5.63705 2.09961 10.0001C2.09961 14.3631 5.63656 17.9001 9.99961 17.9001C11.8569 17.9001 13.5645 17.2592 14.9133 16.1864L19.8634 21.1365C20.2148 21.4879 20.7847 21.4879 21.1362 21.1365C21.4876 20.785 21.4876 20.2151 21.1362 19.8637L16.1861 14.9136C17.2587 13.5648 17.8996 11.8573 17.8996 10.0001C17.8996 5.63705 14.3627 2.1001 9.99961 2.1001ZM3.89961 10.0001C3.89961 6.63116 6.63067 3.9001 9.99961 3.9001C13.3685 3.9001 16.0996 6.63116 16.0996 10.0001C16.0996 13.369 13.3685 16.1001 9.99961 16.1001C6.63067 16.1001 3.89961 13.369 3.89961 10.0001Z"></path></svg>
											</span>
										<input type="text" placeholder="회사명 검색" value="" style="width: 145px;" maxlength="10">
									</div>
								</div>
							</div>
						</div>
						<div>
							<div class="List_List_table__K2VFf" style="display: none;">
								<ul>
									<dl class="List_List_empty__pphW6">
										<dd>요청하신 결과가 없습니다.</dd>
									</dl>
								</ul>
							</div>
							<table class="apply_table" id="applyTable">
								<tr>
									<th>지원회사</th>
									<th>지원공고</th>
									<th>지원일자</th>
									<th>진행상태</th>
								</tr>
								<tr>
									<td>배달의 민족</td>
									<td>배민B마트 캡틴 모집</td>
									<td>2023-08-11</td>
									<td>지원완료</td>
								</tr>
								<tr>
									<td>쿠팡</td>
									<td>쿠팡 인프라 엔지니어 채용</td>
									<td>2023-07-22</td>
									<td>면접 합격</td>
								</tr>
								<tr>
									<td>LG</td>
									<td>LG 모바일캠프리더 채용</td>
									<td>2023-06-03</td>
									<td>면접 불합격</td>
								</tr>
							</table>
						</div>
						<!-- 페이지네이션 시작 -->
						<div style="text-align:center;">
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
						<!-- 페이지네이션 끝 -->
					</section>
				</div>
          </div>
        </div>
				<!-- golgolz end -->
			</section>
			<jsp:include page="../../../../assets/layout/user/footer.jsp" />
		</main>
	</div>
</body>
</html>
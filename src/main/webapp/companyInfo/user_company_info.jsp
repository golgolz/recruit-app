<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    info=""%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- <link href="../assets/css/company/company-info-list-1.css" rel="stylesheet" type="text/css" />
<link href="../assets/css/company/company-info-list-2.css" rel="stylesheet" type="text/css" />
<link href="../assets/css/company/company-info-list-3.css" rel="stylesheet" type="text/css" />
<link href="../assets/css/company/company-info-list-4.css" rel="stylesheet" type="text/css" />
<link href="../assets/css/company/company-info-list-5.css" rel="stylesheet" type="text/css" /> 헤더 변경됨 -->
<!-- <link href="../assets/css/company/company-info-list-7.css" rel="stylesheet" type="text/css" /> -->
<link href="../assets/css/company/company-info-list-6.css" rel="stylesheet" type="text/css" />
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
<jsp:include page="../assets/layout/user/lib.jsp" />  
<!-- golgolz start -->
	<!-- golgolz end -->
<style text="text/css">
	#btnSearchCompany{width:70px; height:40px; background-color:#FFFFFF; border:1px solid #333; margin-left:5px; font-size:15px}
	#content{
			width: 100%;
			max-width: 1300px;
			margin: 0 auto;
			box-sizing: border-box;
			padding: 20px;
	}
</style>
<script text="text/javascript">
	$(function(){
		<!-- golgolz start -->
		<!-- golgolz end -->
	});
</script>
</head>
<body>
    <div id="__next" data-reactroot="">
		<jsp:include page="../assets/layout/user/header.jsp" />
		<main class="JobsFeed_Jobsfeed__DpeV9">  
			<section class="Section_Section__P1hhc">
			<!-- golgolz start -->
			<div id="content">
    <form id="frmSearchCompany" action="/Salary/Index#salarySearchCompany" method="get">
        <div class="row salarySearchCompany" id="salarySearchCompany">
            <div class="container">
                <div class="search searchCompany">
                    <!-- <div class="popup" aria-live="polite" aria-hidden="true" id="autocompletePane">
                        <div class="noResult" id="noResultPane" style="display:none">
                            <p>검색 결과가 없음.</p>
                        </div>
                        <div class="list" id="recommendPane" style="display:none">
                            <ul></ul>
                        </div>
                        <div class="list" id="resultPane" style="display:none">
                            <ul></ul>
                        </div>
                        <div class="popupFooter" id="recommendButtonPane" style="display:none">
                            <button type="button" class="button buttonDeleteAll"><span>전체삭제</span></button>
                        </div>
                    </div> -->
                </div>
                <div style="border:1px solid #ccc; padding-top:40px; padding-bottom:10px; margin:auto; width:650px;">
                <div class="total">기업 검색<span class="subtitle"></span></div>
                    <table style="margin:auto; border-collapse:collapse; width:500px; height:170px">
                        <tbody>
                            <tr style="border-top:1px solid #ccc; border-bottom:1px solid #ccc;">
                                <th style="border-left:1px solid transparent; border-right:1px solid transparent; color:black;">기업명</th>
                                <td style="text-align:left; padding-left:20px; border-left:1px solid transparent; border-right:1px solid transparent;">
                                    <input type="text" name="company_name" value="" style="border:1px solid #ccc; width:250px">
                                </td>
                            </tr>
                            <tr style="border-bottom:1px solid #ccc;">
                                <th style="border-left:1px solid transparent; border-right:1px solid transparent; color:black;">평균 연봉</th>
                                <td style="text-align:left; padding-left:20px; border-left:1px solid transparent; border-right:1px solid transparent;">
                                    <input type="text" name="avg_sal" value="" style="border:1px solid #ccc; width:100px"> 만원 이상
                                </td>
                            </tr>
                            <tr style="border-bottom:1px solid #ccc;">
                                <th style="border-left:1px solid transparent; border-right:1px solid transparent; color:black;">기업 구분</th>
                                <td style="text-align:left; padding-left:20px; border-left:1px solid transparent; border-right:1px solid transparent;">
                                    <label>
                                        <input type="radio" name="company-classification" value="0"> 전체
                                    </label>
                                    <label style="margin-left:10px">
                                        <input type="radio" name="company-classification" value="1"> 대기업
                                    </label>
                                    <label style="margin-left:10px">
                                        <input type="radio" name="company-classification" value="2"> 중견기업
                                    </label>
                                    <label style="margin-left:10px">
                                        <input type="radio" name="company-classification" value="3"> 중소기업
                                    </label>
                                </td>
                            </tr>
                            <tr style="border-bottom:1px solid #ccc;">
                                <td colspan="2" style="text-align:center; margin-right:50px; border-left:1px solid transparent; border-right:1px solid transparent; border-bottom:1px solid transparent; color:black;">
                                    <input type="submit" value="초기화" class="btn btn-outline-secondary"/>
                                    <input type="submit" value="검색" class="btn btn-secondary"/>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </div>
                <!-- <div style="margin-top:15px">
                    <input type="button" value="초기화" id="frmRest" class="btn_medium grey">
                </div> -->
                <div class="dropdown category3 hidden" id="ddlJobType" aria-hidden="true">
                    <input type="hidden" name="jobTypeCode" id="hidJobTypeCode" value="" />
                    <button type="button" class="buttonChoose " aria-haspopup="true"><span>직무선택</span></button>
                </div>
            </div>
        </div>
        <div class="row salaryList salaryCompanyList" style="margin-top:30px">
            <input type="hidden" id="hidMemChk" value="0" />
            <div class="container">
                <div class="listHeader">
                    <div class="total">총 <em>1</em>건<span class="subtitle"></span></div>
                </div>
                <div class="noData" id="listNoData" style="display:none">
                    <p><strong>‘직무선택’</strong>에 대한 검색결과가 없습니다.<br>다른 검색어로 검색해주세요.</p>
                </div>
                <ul class="list" id="listCompany" >
                    <li>
                        <a href="http://localhost/recruit-app/companyInfo/user_company_detail.jsp" target="_blank">
                            <div class="thumbnail">
                                <img src="//imgs.jobkorea.co.kr/img1/_whitebg/200X80/Co_Logo/Logo/2011/10/2w1aj007Pm_gWzi2y3i2jm0djMcSj_ldjm.gif?v=202406041618&amp;hash=r&amp;serviceCode=CL" onerror="companylogoOnError('/salary/logourl?ucono=1882711' , this)">
                                <div class="inner">넥슨코리아</div>
                            </div>
                            <div class="headers" style="text-align:center">
                                <div class="text">넥슨코리아</div>
                            </div>
                            <div class="summary" style="text-align:center">
                                <div class="item">매출액 3조 9000억</div>
                                <div class="item">사원수 3,500명</div>
                            </div>
                        </a>
                    </li>
                </ul>
            </div>
            <div style="text-align:center;">
                <nav aria-label="...">
                    <ul class="pagination" style="width:100px; display: inline-flex;">
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
    </form>
</div>

			<!-- golgolz end -->
			</section>
			<jsp:include page="../assets/layout/user/footer.jsp" />  
		</main>
	</div>
</body>
</html>
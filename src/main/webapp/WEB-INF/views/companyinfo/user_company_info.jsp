<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    info=""%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
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
	.btnCompany{
		background-color: white;
		font-size: 12px;
		color: black;
		padding: 5px 10px;
		border: 1px solid #ccc;
		border-radius: 10px;
	}
</style>
<script text="text/javascript">
	$(function(){
		<!-- golgolz start -->
		var initialTotalItems = $("#listCompany li").length;
	    $(".total em").text(initialTotalItems);
		
		$("#companySearch").click(function(){
			var companyName= $("#companyName").val();
			var avgSal= $("#avgSal").val();
			var selectedValue = $('input[name="company-classification"]:checked').val();
			
			$.ajax({
				url:"companySearchList.do",
				type:"POST",
				dataType:"JSON",
				data:{
					"companyName" : companyName,
					"avgSal" : avgSal,
					"selectedValue" : selectedValue
				},
				success:function(response){
					if (response.status === "success") {
	                    var $list = $("#listCompany");
	                    $list.empty(); // 기존 리스트 지우기
	                    
	                    var totalItems = response.companyList.length; // 총 건수 가져오기
	                    $(".total em").text(totalItems); 
	                    
	                    if (response.companyList.length > 0) {
	                        $.each(response.companyList, function(index, company) {
	                            var listItem = $("<li>").attr("id", "companyinfoList_" + (index + 1));
	                            var link = $("<a>").attr("href", "https://doberman-ready-termite.ngrok-free.app/recruit-app/companyInfo/user_company_detail.jsp").attr("target", "_blank");

	                            var thumbnail = $("<div>").addClass("thumbnail");
	                            var img = $("<img>").attr("src", "https://doberman-ready-termite.ngrok-free.app/recruit-app/assets/images/company/logo/" + company.logo);
	                            var innerThumbnail = $("<div>").addClass("inner").text(company.companyName);
	                            thumbnail.append(img).append(innerThumbnail);

	                            var headers = $("<div>").addClass("headers");
	                            var text = $("<div>").addClass("text").text(company.companyName);
	                            headers.append(text);

	                            var summary = $("<div>").addClass("summary");
	                            var revenueItem = $("<div>").addClass("item").text("매출액 " + company.revenue + "억");
	                            var headcountItem = $("<div>").addClass("item").text("사원수 " + company.headcount + "명");
	                            summary.append(revenueItem).append(headcountItem);

	                            var salary = $("<div>").addClass("salary");
	                            var innerSalary = $("<div>").addClass("inner").html("<strong>" + company.avgSal + "</strong>만원");
	                            salary.append(innerSalary);

	                            link.append(thumbnail).append(headers).append(summary).append(salary);
	                            listItem.append(link);
	                            $list.append(listItem);
	                        });
	                    } else {
	                        $list.append("<div style='height:50px; width:100%; text-align:center;font-size:18px; padding-top:5px'>검색 결과가 없습니다.</div>");
	                    }
	                } else {
	                    alert("검색 중 오류가 발생했습니다.");
	                }
	            },

				error:function(xhr){
					console.log(xhr);
				}//error
			});//ajax
		});//click
		
		$("#initialization").click(function() {//초기화 버튼
            $("#companyName").val('');
            $("#avgSal").val('');
            $('input[name="company-classification"]').prop('checked', false);
            
            
            
        });//click
        
        $("#listCompany li").hide(); // 모든 리스트 항목 숨기기
        $("#listCompany li").slice(0, 5).show(); // 처음 5개만 보이기
		
		$("li").slice(0, 5).show(); // 초기갯수
	    $("#load").click(function(e){ // 클릭시 more
	        e.preventDefault();
	        $("li:hidden").slice(0, 5).show(); // 클릭시 more 갯수 지정
	        if($("li:hidden").length == 0){ // 컨텐츠 남아있는지 확인
	        	$("#load").hide(); // 더 보기 버튼 숨기기
	        }
	    });
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
<!--     <form id="frmSearchCompany" action="/Salary/Index#salarySearchCompany" method="get"> -->
        <div class="row salarySearchCompany" id="salarySearchCompany">
            <div class="container">
                <div class="search searchCompany">
                </div>
                <div style="border:1px solid #ccc; padding-top:30px; padding-bottom:20px; margin:auto; width:950px;">
                <div style="margin-bottom:18px; text-align:left; margin-left:45px; font-size:22px; color:#333"><strong>기업 검색</strong></div>
                    <table style="margin:auto; border-collapse:collapse; width:100%; height:180px">
                        <tbody>
                            <tr style="border-top:1px solid #ccc; border-bottom:1px solid #ccc;">
                                <th style="border-left:1px solid transparent; font-size:15px; border-right:1px solid transparent; color:black;">기업명</th>
                                <td style="text-align:left; padding-left:20px; border-left:1px solid transparent; border-right:1px solid transparent;">
                                    <input type="text" name="company_name" id="companyName" value="" style="border:1px solid #ccc; width:250px; height:22px;">
                                </td>
                            </tr>
                            <tr style="border-bottom:1px solid #ccc;">
                                <th style="border-left:1px solid transparent; font-size:15px; border-right:1px solid transparent; color:black;">평균 연봉</th>
                                <td style="text-align:left; padding-left:20px; border-left:1px solid transparent; border-right:1px solid transparent;">
                                    <input type="text" name="avg_sal" id="avgSal" value="" style="border:1px solid #ccc; width:100px; height:22px;"><span style="font-size:13px; color:black"> 만원 이상</span>
                                </td>
                            </tr>
                            <tr style="border-bottom:1px solid #ccc;">
                                <th style="border-left:1px solid transparent; font-size:15px; border-right:1px solid transparent; color:black;">기업 구분</th>
                                <td style="text-align:left; padding-left:20px; border-left:1px solid transparent; border-right:1px solid transparent;">
                                    <label style="margin-left:10px">
                                        <input type="radio" name="company-classification" value="대기업"><span style="font-size:13px; color:black"> 대기업</span>
                                    </label>
                                    <label style="margin-left:10px">
                                        <input type="radio" name="company-classification" value="중견기업"><span style="font-size:13px; color:black"> 중견기업</span>
                                    </label>
                                    <label style="margin-left:10px">
                                        <input type="radio" name="company-classification" value="중소기업"><span style="font-size:13px; color:black"> 중소기업</span>
                                    </label>
                                </td>
                            </tr>
                            <tr style="border-bottom:1px solid #ccc;">
                                <td colspan="2" style="text-align:center; margin-right:50px; border-left:1px solid transparent; border-right:1px solid transparent; border-bottom:1px solid transparent; color:black;">
                                    <input type="submit" value="검색" id="companySearch" class="btn btn-secondary btn-lg"/>
                                    <input type="submit" value="초기화" id="initialization" style="color:black" class="btn btn-outline-secondary btn-lg"/>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
        <div class="row salaryList salaryCompanyList" style="margin-top:30px">
            <input type="hidden" id="hidMemChk" value="0" />
            <div class="container">
                <div class="listHeader">
                    <div class="total">총 <em>1</em>건<span class="subtitle"></span></div>
                    <div style="text-align:right">
                    	<input class="btnCompany" type="button" value="최신등록순"/>
                    	<input class="btnCompany" type="button" value="기업이름순"/>
                    	<input class="btnCompany" type="button" value="평균연봉 높은순"/>
                    	<input class="btnCompany" type="button" value="사원 많은순"/>
                    </div>
                </div>
                <div class="noData" id="listNoData" style="display:none">
                    <p><strong>‘직무선택’</strong>에 대한 검색결과가 없습니다.<br>다른 검색어로 검색해주세요.</p>
                </div>
                <ul class="list" id="listCompany" style="padding-top:30px" >
                    <c:forEach var="company" items="${ requestScope.listCompanyinfo }" varStatus="i">
                    <li id="companyinfoList">
                        <a href="https://doberman-ready-termite.ngrok-free.app/recruit-app/companyinfo/companyinfoDetail.do?companyCode=${ company.companyCode }">
                            <div class="thumbnail">
                                <img src="https://doberman-ready-termite.ngrok-free.app/recruit-app/assets/images/company/logo/<c:out value="${ company.logo }"/>" />
                                <div class="inner"><c:out value="${ company.logo }"/></div>
                            </div>
                            <div class="headers">
                                <div class="text"><c:out value="${ company.companyName }"/></div>
                            </div>
                            <div class="summary">
                                <div class="item">매출액 <c:out value="${ company.revenue }"/>억</div>
                                <div class="item">사원수 <c:out value="${ company.headcount }"/>명</div>
                            </div>
                            <div class="salary">
                                <div class="inner"><strong><c:out value="${ company.avgSal }"/></strong>만원</div>
                            </div>
                        </a>
                    </li>
                    </c:forEach>
                    <div style="height:50px; width:100%; text-align:center;font-size:18px; padding-top:5px">
                    	<a href="#" id="load">더 보기 +</a>
                    </div>
                </ul>
            </div>
        </div>
    <!-- </form> -->
</div>

			<!-- golgolz end -->
			</section>
			<jsp:include page="../assets/layout/user/footer.jsp" />  
		</main>
	</div>
</body>
</html>
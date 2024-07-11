<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    info="부서별 사원정보 조회"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %> <%-- fn 태그 라이브러리 추가 --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="icon" href="http://stu6.sist.co.kr/spring_mvc/common/favicon.ico"/>
<!--bootstrap 시작-->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
<!--bootstrap 끝-->
<link rel="stylesheet" href="http://stu6.sist.co.kr/spring_mvc/common/css/main.css" type="text/css" media="all" />
<link rel="stylesheet" href="http://stu6.sist.co.kr/spring_mvc/common/css/board.css" type="text/css" media="all" />
<!--jQuery CDN 시작-->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<!--jQuery CDN 끝-->
<link href="../assets/css/company/company-info-list-6.css" rel="stylesheet" type="text/css" />
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
<style type="text/css">
	
</style>
<script type="text/javascript">
	$(function(){
		$("#companySearch").click(function(){
			var companyName= $("#companyName").val();
			var avgSal= $("#avgSal").val();
			var selectedValue = $('input[name="company-classification"]:checked').val();
			
			$.ajax({
				url:"search_test.do",
				type:"POST",
				dataType:"JSON",
				data:{
					"companyName" : companyName,
					"avgSal" : avgSal,
					"selectedValue" : selectedValue
				},
				success:function(response){
					if (response.status === "success") {
						var $tableBody = $("#companyTableBody");
						$tableBody.empty(); // 기존 리스트 지우기
						if (response.companyList.length > 0) {
							$.each(response.companyList, function(index, company) {
								var row = "<tr>" +
									"<td>" + company.companyCode + "</td>" +
									"<td>" + company.companyName + "</td>" +
									"<td>" + company.logo + "</td>" +
									"<td>" + company.revenue + "</td>" +
									"<td>" + company.headcount + "</td>" +
									"<td>" + company.inputDate + "</td>" +
									"</tr>";
								$tableBody.append(row);
							});//each
						} else {
							var noResultRow = "<tr><td colspan='6' style='text-align:center'>검색 결과가 없습니다.</td></tr>";
							$tableBody.append(noResultRow);
						}
					} else {
						alert("검색 중 오류가 발생했습니다.");
					}//success
				},
				error:function(xhr){
					console.log(xhr);
				}//error
			});//ajax
		});//click
		
		$("#initialization").click(function() {
            $("#companyName").val('');
            $("#avgSal").val('');
            $('input[name="company-classification"]').prop('checked', false);
        });//click

	});//ready
</script>
</head>
<body>
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
<div>
<table class="table table-hover">
<thead>
<tr>
<th style="width: 80px">기업코드</th>
<th style="width: 200px">기업명</th>
<th style="width: 120px">기업로고</th>
<th style="width: 120px">매출액</th>
<th style="width: 200px">사원수</th>
<th style="width: 200px">등록일</th>
</tr>
</thead>
<tbody id="companyTableBody">
<!-- 검색 결과 행이 이곳에 추가됩니다 -->
</tbody>
</table>
</div>
</body>
</html>
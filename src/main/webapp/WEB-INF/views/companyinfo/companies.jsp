<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" info=""%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>	
<!DOCTYPE html>
<html>
<head>
<jsp:include page="../assets/layout/admin/lib.jsp" />
<script type="text/javascript">
	$(function() {
		$("#company_menu").addClass("bg-gradient-primary");
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

	                    var totalItems = response.listCompanyinfo.length;
	                    $(".fc_red").text(totalItems); 

	                    if (totalItems > 0) {
	                        $.each(response.listCompanyinfo, function(index, company) {
	                            var listItem = '<tr class="list0"><td>' + (index + 1) + '</td>' +
	                                '<td><img src="http://localhost/recruit-app/assets/images/company/logo/' + company.logo + '" style="width: auto; height: 35px;"/></td>' +
	                                '<td>' + company.companyName + '</td>' +
	                                '<td>' + company.companyClassification + '</td>' +
	                                '<td>' + company.avgSal + '만</td>' +
	                                '<td><input type="button" value="바로가기" class="btn btn-outline-secondary btn-sm" style="font-weight: bold; margin: 0px auto;" onclick="location.href=\'http://localhost/recruit-app/companyinfo/adminCompanyinfoDetail.do\'" /></td></tr>';

	                            $list.append(listItem);
	                        });//each
	                    } else {
	                        $list.append('<div style="height:50px; width:100%; text-align:center;font-size:18px; padding-top:5px">검색 결과가 없습니다.</div>');
	                    }//end else
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
		
	});
</script>
<!-- golgolz start -->
<link href="http://localhost/recruit-app/assets/css/manage/order/admin.css" rel="stylesheet" />
<link href="http://localhost/recruit-app/assets/css/manage/order/reset.css" rel="stylesheet" />
<!-- golgolz end -->
</head>
<body>
	<jsp:include page="../assets/layout/admin/header.jsp" />
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
							class="opacity-5 text-dark" href="javascript:;"> 관리자 기능</a></li>
						<!-- 하단의 대시보드 텍스트를 본인 기능으로 변경 필요  -->
						<li class="breadcrumb-item text-sm text-dark active"
							aria-current="page">기업 관리</li>
					</ol>
					<h6 class="font-weight-bolder mb-0">기업 관리</h6>
				</nav>
			</div>
		</nav>
		<div class="container-fluid">
			<div class="s_wrap">
				<form name="fsearch" id="fsearch">
					<input type="hidden" name="code" value="list">
					<div class="tbl_frm01">
						<table>
							<colgroup>
								<col class="w100">
								<col>
							</colgroup>
							<tbody>
								<tr>
									<th scope="row">기업명</th>
									<td><input type="hidden" name="page" value="1" />
										<%-- <select name="category">
											<option value="기업코드" ${param.category eq '0' ? " selected" : "" }>기업코드</option>
											<option value="기업명" ${param.category eq '1' ? " selected" : "" }>기업명</option>
											<option value="근무지역" ${param.category eq '2' ? " selected" : "" }>근무지역</option>
										</select>  --%>
										<input type="text" id="" name="keyword" value="" class="frm_input" size="30">
									</td>
								</tr>
								<tr>
									<th scope="row">평균 연봉</th>
									<td class="box text">
										<input type="text" id="avgSal" name="avgSal" value="" class="frm_input" size="13"> 만원 이상
									</td>
								</tr>
								<tr>
									<th scope="row">기업 구분</th>
									<td>
										<label class="od_status"> 
											<input type="radio" name="compC" value="대기업" ${param.delivery eq '0' ? " checked" : "" }> 대기업
										</label> 
										<label class="od_status">
											<input type="radio" name="compC" value="중견기업" ${param.delivery eq '1' ? " checked" : "" }> 중견기업
										</label>
										<label class="od_status"> 
											<input type="radio" name="compC" value="중소기업" ${param.delivery eq '2' ? " checked" : "" }> 중소기업
										</label>
									</td>
								</tr>
								<tr>
									<th scope="row">사원수</th>
									<td>
										<label class="od_status">
											<input type="radio" name="headC" value="0" ${param.delivery eq '1' ? " checked" : "" }> 5인 미만
										</label>
										<label class="od_status"> 
											<input type="radio" name="headC" value="1" ${param.delivery eq '2' ? " checked" : "" }> 50인 미만
										</label>
										<label class="od_status"> 
											<input type="radio" name="headC" value="2" ${param.delivery eq '2' ? " checked" : "" }> 50인 이상
										</label>
									</td>
								</tr>
							</tbody>
						</table>
					</div>
					<div class="btn_confirm">
					    <input type="submit" value="검색" class="btn btn-secondary btn-sm"/>
						<input type="submit" value="초기화" class="btn btn-outline-secondary btn-sm"/>
					</div>
				</form>
				<div class="local_ov mart30"  align="right">
					<input type="button" value="등록하기" class="btn btn-outline-success btn-sm float-right" style="font-weight: bold; margin: 10px auto;" onclick="location.href='http://localhost/recruit-app/companyinfo/adminCompanyinfoWrite.do'" />
				</div>
				<form name="forderlist" id="forderlist" method="post">
					<input type="hidden" name="q1" value="code=list"> <input
						type="hidden" name="page" value="1">
				</form>
				<div class="tbl_head01">
					<table id="sodr_list">
						<colgroup>
							<col class="w40">
							<col class="w40">
							<col class="w60">
							<col class="w60">
							<col class="w90">
							<col class="w90">
						</colgroup>
						<thead>
							<tr>
								<th scope="col">번호</th>
								<th scope="col">기업로고</th>
								<th scope="col">기업이름</th>
								<th scope="col">기업구분</th>
								<th scope="col">평균연봉</th>
								<th scope="col">상세보기</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="company" items="${requestScope.listCompanyinfo}" varStatus="i">
							<tr class="list0">
								<td><c:out value="${ i.index +1 }"/></td>
								<td><img src="http://localhost/recruit-app/assets/images/company/logo/<c:out value="${ company.logo }"/>" style="width: auto; height: 35px;"/></td>
								<td><c:out value="${ company.companyName }"/></td>
								<td><c:out value="${ company.companyClassification }"/></td>
								<td><c:out value="${ company.avgSal }"/>만</td>
								<td>
									<input type="button" value="연혁/복리후생" class="btn btn-outline-secondary btn-sm" style="font-weight: bold;" onclick="location.href='http://localhost/recruit-app/companyinfo/adminHistoryWelfare.do?companyCode=${ company.companyCode }'"/>
									<input type="button" value="기업정보" class="btn btn-outline-secondary btn-sm" style="font-weight: bold;" onclick="location.href='http://localhost/recruit-app/companyinfo/adminCompanyinfoDetail.do?companyCode=${ company.companyCode }'"/>
								</td>
							</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
				<div class="alignCenter">
					<table cellpadding="0" cellspacing="0" border="0" width="100%">
						<tbody>
							<tr>
								<td align="center">
									<div id="pageNation"></div>
								</td>
								<td align="right">
								</td>
							</tr>
						</tbody>
					</table>
					<div style="justify-content: center;">
					<nav aria-label="Page navigation example">
					  <ul class="pagination" style="justify-content: center;">
					    <li>
					      <a class="page-link" href="#" aria-label="Previous">
					        <span aria-hidden="true">&laquo;</span>
					      </a>
					    </li>
					    <li><a class="page-link" href="#">1</a></li>
					    <li><a class="page-link" href="#">2</a></li>
					    <li><a class="page-link" href="#">3</a></li>
					    <li>
					      <a class="page-link" href="#" aria-label="Next">
					        <span aria-hidden="true">&raquo;</span>
					      </a>
					    </li>
					  </ul>
					</nav>
					</div>
				</div>
			</div>
		</div>
	</main>
</body>
</html>
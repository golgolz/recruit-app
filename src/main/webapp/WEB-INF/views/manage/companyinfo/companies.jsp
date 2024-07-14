<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" info=""%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<jsp:include page="../../assets/layout/admin/lib.jsp" />
<script type="text/javascript">
/* //페이지 이동 이벤트
function fncPage(page) {
    jQuery("#page").val(page);
    jQuery("#fsearch").attr("action",
            "http://localhost/recruit-app/manage/companyinfo/adminCompanyinfoList.do");
    jQuery("#fsearch").attr("method", "get");
    jQuery("#fsearch").submit();

}
//검색 이벤트
function fncSearch() {

    jQuery("#page").val(1);
    jQuery("#fsearch").attr("action",
            "http://localhost/recruit-app/manage/companyinfo/adminCompanyinfoList.do");
    jQuery("#fsearch").attr("method", "get");
    jQuery("#fsearch").submit();

} */
//페이지 이동 이벤트
function fncPage(page) {
    document.getElementById("page").value = page;
    alert(page)
    document.getElementById("fsearch").submit();
}

// 검색 이벤트
function fncSearch() {
    document.getElementById("page").value = 1;
    var searchDataValue = document.getElementById("searchDataValue").value.trim();
    var avgSal = document.getElementById("avgSal").value.trim();
    document.getElementById("fsearch").submit();
}

$(function() {
    $("#company_menu").addClass("bg-gradient-primary");

    $("#companySearch").click(function(e){
        e.preventDefault(); // 폼 제출 방지
        fncSearch();
    });

    $("#initialization").click(function(e) {
        e.preventDefault(); // 폼 제출 방지
        $("#companyName").val('');
        $("#avgSal").val('');
        $('input[name="company-classification"]').prop('checked', false);
        fncSearch();  // 초기화 후 검색 실행
    });
});
</script>

<!-- golgolz start -->
<link href="http://localhost/recruit-app/assets/css/manage/order/admin.css" rel="stylesheet" />
<link href="http://localhost/recruit-app/assets/css/manage/order/reset.css" rel="stylesheet" />
<!-- golgolz end -->
</head>
<body>
    <jsp:include page="../../assets/layout/admin/header.jsp" />
    <main class="main-content position-relative max-height-vh-100 h-100 border-radius-lg ps--active-y">
        <nav class="navbar navbar-main navbar-expand-lg px-0 mx-4 shadow-none border-radius-xl" id="navbarBlur" data-scroll="true">
            <div class="container-fluid py-1 px-3">
                <nav aria-label="breadcrumb">
                    <ol class="breadcrumb bg-transparent mb-0 pb-0 pt-1 px-0 me-sm-6 me-5">
                        <li class="breadcrumb-item text-sm"><a class="opacity-5 text-dark" href="javascript:;"> 관리자 기능</a></li>
                        <li class="breadcrumb-item text-sm text-dark active" aria-current="page">기업 관리</li>
                    </ol>
                    <h6 class="font-weight-bolder mb-0">기업 관리</h6>
                </nav>
            </div>
        </nav>
        <div class="container-fluid">
            <div class="s_wrap">
                <form name="fsearch" id="fsearch" method="get" action="http://localhost/recruit-app/manage/companyinfo/adminCompanyinfoList.do">
                    <input type="hidden" name="page" id="page" value="1">
                    <div class="tbl_frm01">
                        <table>
                            <colgroup>
                                <col class="w100">
                                <col>
                            </colgroup>
                            <tbody>
                                <tr>
                                    <th scope="row">기업명</th>
                                    <td>
                                        <input type="text" id="searchDataValue" name="searchDataValue" value="" class="frm_input" size="30">
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
                                            <input type="radio" name="company-classification" value="대기업"> 대기업
                                        </label> 
                                        <label class="od_status">
                                            <input type="radio" name="company-classification" value="중견기업"> 중견기업
                                        </label>
                                        <label class="od_status"> 
                                            <input type="radio" name="company-classification" value="중소기업"> 중소기업
                                        </label>
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                    <div class="btn_confirm">
                        <input type="button" value="검색" class="btn btn-secondary btn-sm" onclick="fncSearch(); return false;"/>
                        <input type="button" value="초기화" id="initialization" class="btn btn-outline-secondary btn-sm"/>
                    </div>
                </form>
                <div class="local_ov mart30" align="right">
                    <input type="button" value="등록하기" class="btn btn-outline-success btn-sm float-right" style="font-weight: bold; margin: 10px auto;" onclick="location.href='http://localhost/recruit-app/manage/companyinfo/adminCompanyinfoWrite.do'" />
                </div>
                <form name="forderlist" id="forderlist" method="post">
                    <input type="hidden" name="q1" value="code=list">
                    <input type="hidden" name="page" value="1">
                </form>
                <div id="listArea">
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
                                <c:forEach var="company" items="${requestScope.companyinfoList}" varStatus="i">
                                <input type="hidden" value="<c:out value="${ company.inputDate }"/>"/>
                                <tr class="list0">
                                    <td><c:out value="${ i.index +1 }"/></td>
                                    <td><img src="http://localhost/recruit-app/assets/images/company/logo/<c:out value="${ company.logo }"/>" style="width: auto; height: 35px;"/></td>
                                    <td><c:out value="${ company.companyName }"/></td>
                                    <td><c:out value="${ company.companyClassification }"/></td>
                                    <td><c:out value="${ company.avgSal }"/>만</td>
                                    <td>
                                        <input type="button" value="연혁/복리후생" class="btn btn-outline-secondary btn-sm" style="font-weight: bold;" onclick="location.href='http://localhost/recruit-app/manage/companyinfo/adminHistoryWelfare.do?companyCode=${ company.companyCode }'"/>
                                        <input type="button" value="기업정보" class="btn btn-outline-secondary btn-sm" style="font-weight: bold;" onclick="location.href='http://localhost/recruit-app/manage/companyinfo/adminCompanyinfoDetail.do?companyCode=${ company.companyCode }'"/>
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
                        <%-- <div class="pagination">
							<c:forEach var="page" begin="1" end="${totalPage}"
								varStatus="status">
								<c:choose>
									<c:when test="${page == sVO.page}">
										<span class="current"><span class="hidden">현재페이지</span>${page}</span>
									</c:when>
									<c:otherwise>
										<a href="javascript:fncPage(${page});">${page}</a>
									</c:otherwise>
								</c:choose>
							</c:forEach>
						</div> --%>
                        <div style="justify-content: center;">
					<nav aria-label="Page navigation example">
					  <ul class="pagination" style="justify-content: center;">
					    <li>
					      <a class="page-link" href="#" aria-label="Previous">
					        <span aria-hidden="true">&laquo;</span>
					      </a>
					    </li>
					    <c:forEach var="page" begin="1" end="${totalPage}"
								varStatus="status">
								<c:choose>
									<c:when test="${page == sVO.page}">
					    				<li><a class="page-link" href="#">${page}</a></li>
									</c:when>
									<c:otherwise>
					    				<li><a class="page-link" href="javascript:fncPage(${page});">${page}</a></li>
									</c:otherwise>
								</c:choose>
							</c:forEach>
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
        </div>
    </main>
</body>
</html>
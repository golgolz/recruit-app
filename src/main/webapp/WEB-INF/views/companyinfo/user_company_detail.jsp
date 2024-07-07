<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <link href="../assets/css/company/company-info-detail-3.css" rel="stylesheet" type="text/css" />
    <link href="../assets/css/company/company-info-detail-7.css" rel="stylesheet" type="text/css" />
    <jsp:include page="../assets/layout/user/lib.jsp" />
    <style text="text/css">
        #companyInfoList { width: 80px; height: 35px; font-size: 15px; margin-right: 30px; margin-top: 27px; }
        #recruitmentNotice { width: 120px; height: 35px; font-size: 15px; margin-right: 30px; margin-top: 27px; }
        #companyReview { width: 80px; height: 35px; font-size: 15px; margin-top: 27px; }
        #company_content {
            width: 100%;
            max-width: 1300px;
            margin: 0 auto;
            box-sizing: border-box;
            padding: 20px;
        }
    </style>
    <script text="text/javascript">
        $(function () {
            // 추가 스크립트가 필요하면 여기에 작성
        });
    </script>
</head>
<body class="company">
    <div id="__next" data-reactroot="">
        <jsp:include page="../assets/layout/user/header.jsp" />
        <main class="JobsFeed_Jobsfeed__DpeV9">
            <section class="Section_Section__P1hhc">
                <c:if test="${not empty requestScope.companyDetail}">
                    <c:set var="companyIntroDetail" value="${requestScope.companyDetail[0]}" />
                </c:if>
                <div class="company-wrap">
                    <div class="company-header-container">
                        <div class="company-header-branding background-type4">
                            <div class="company-header-branding-container ">
                                <input type="hidden" id="mId" value="" />
                                <input type="hidden" id="cId" value="" />
                                <input type="hidden" id="jkcId" value="nexonhr" />
                                <input type="hidden" id="devPath" value="https://www.jobkorea.co.kr">
                                <div class="logo"><img src="http://localhost/recruit-app/assets/images/company/logo/<c:out value="${ companyIntroDetail.logo }"/>" style="width:100px; height:auto;"></div>
                                <div class="company-header-branding-body">
                                    <div class="special-feature"></div>
                                    <div class="name">
                                        <c:out value="${companyIntroDetail.companyName}" />
                                    </div>
                                    <div class="summary">
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="company-nav" role="navigation">
                            <div class="company-nav-container">
                                <a href="http://localhost/recruit-app/companyinfo/companyinfoDetail.do?companyCode=${ companyIntroDetail.companyCode }" class="company-nav-item active">
                                    <div class="name">기업정보</div>
                                    <div class="post">
                                        <div class="header screen-out">게시물</div>
                                        <div class="value"></div>
                                    </div>
                                </a>
                                <a href="http://localhost/recruit-app/review/reviewResult.do?companyCode=${ companyIntroDetail.companyCode }" class="company-nav-item ">
                                    <div class="name">기업리뷰</div>
                                    <div class="post">
                                        <div class="header screen-out">게시물</div>
                                        <div class="value">${totalReviewCount}</div>
                                    </div>
                                </a>
                                <a href="http://localhost/recruit-app/recruit/detail.do?companyCode=${ companyIntroDetail.companyCode }" class="company-nav-item ">
                                    <div class="name">채용공고</div>
                                    <div class="post">
                                        <div class="header screen-out">게시물</div>
                                    </div>
                                </a>
                            </div>
                        </div>
                    </div>
                    <div id="company_content">
                        <input type="hidden" id="hdnCIdent" value="0fea3f631eabe498f4fed6f0e4e46f0a" />
                        <div class="company-body-infomation">
                            <!-- 기본정보 영역 -->
                            <div class="company-infomation-container working-environment-container working-environment-introduce fixed-height" style="margin-bottom:45px; height:200px">
                                <h3 class="header">기업소개</h3>
                                <div class="introduce-body">
                                    <div align="justify">
                                        <c:out value="${companyIntroDetail.description}" />
                                    </div>
                                </div>
                            </div>
                            <div class="company-infomation-row basic-infomation">
                                <h2 class="header"></h2>
                                <div class="company-infomation-container basic-infomation-container">
                                    <table class="table-basic-infomation-primary" summary="해당 기업의 산업, 사원수, 기업구분, 설립일, 자본금, 매출액, 대표자, 주요사업, 4대보험, 주소, 홈페이지 등의 정보">
                                        <caption class="table-caption">기업 상세 정보</caption>
                                        <colgroup>
                                            <col class="col-label">
                                            <col class="col-value">
                                            <col class="col-label">
                                            <col class="col-value">
                                        </colgroup>
                                        <tbody>
                                            <tr class="field">
                                                <th class="field-label">산업</th>
                                                <td class="field-value">
                                                    <div class="value-container">
                                                        <div class="value">컴퓨터&#183;하드웨어&#183;장비</div>
                                                    </div>
                                                </td>
                                                <th class="field-label">사원수</th>
                                                <td class="field-value">
                                                    <div class="value-container">
                                                        <div class="values">
                                                            <div class="value"><c:out value="${companyIntroDetail.headcount}" />명</div>
                                                            <div class="reference"></div>
                                                        </div>
                                                    </div>
                                                </td>
                                            </tr>
                                            <tr class="field">
                                                <th class="field-label">기업구분</th>
                                                <td class="field-value">
                                                    <div class="value-container">
                                                        <div class="value"><c:out value="${companyIntroDetail.companyClassification}" /></div>
                                                    </div>
                                                </td>
                                                <th class="field-label">설립일</th>
                                                <td class="field-value">
                                                    <div class="value-container">
                                                        <div class="values">
                                                            <div class="value"><c:out value="${companyIntroDetail.establishmentDate}" /></div>
                                                        </div>
                                                    </div>
                                                </td>
                                            </tr>
                                            <tr class="field">
                                                <th class="field-label">매출액</th>
                                                <td class="field-value">
                                                    <div class="value-container">
                                                        <div class="values">
                                                            <div class="value"><c:out value="${companyIntroDetail.revenue}" />억</div>
                                                            <div class="reference"></div>
                                                        </div>
                                                    </div>
                                                </td>
                                            </tr>
                                            <tr class="field">
                                                <th class="field-label">대표자</th>
                                                <td class="field-value">
                                                    <div class="value-container">
                                                        <div class="value"><c:out value="${companyIntroDetail.ceoName}" /></div>
                                                    </div>
                                                </td>
                                            </tr>
                                            <tr class="field">
                                                <th class="field-label">주소</th>
                                                <td class="field-value">
                                                    <div class="value-container">
                                                        <div class="value"><c:out value="${companyIntroDetail.addr}" /></div>
                                                    </div>
                                                </td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                            <div class="company-infomation-container corporate-issues-container corporate-history fixed-height">
                                <h3 class="header">연혁</h3>
                                <div class="corporate-history-list-company">
                                    <div class="corporate-history-list-item">
                                    <c:forEach var="history" items="${ requestScope.history }" varStatus="i">
                                        <c:if test="${not empty history.baseDate}">
                                            <div id="devJKhistory"><c:out value="${history.baseDate}" /> : <c:out value="${history.historyContent}" /></div>
                                        </c:if>
                                  	</c:forEach>
                                    </div>
                                </div>
                            </div>
                            <!-- 복리후생 -->
                            <div class="company-infomation-container working-environment-container working-environment-benefit" style="margin:auto; width:1040px; margin-top:50px">
                                <h3 class="header">복리후생</h3>
                                <div class="benefit-list">
                                    <c:forEach var="welfare" items="${ requestScope.welfare }" varStatus="i">
                                    <div class='benefit-item-group'>
                                        <c:if test="${not empty welfare.category}">
                                            <div class="benefit-header"><c:out value="${welfare.category}" /></div>
                                        </c:if>
                                        <div class="benefit-body">
                                            <c:if test="${not empty requestScope.welfare[0].welfareContent}">
                                                <p><c:out value="${requestScope.welfare[0].welfareContent}" /></p>
                                            </c:if>
                                        </div>
                                    </div>
                                   	</c:forEach>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <jsp:include page="../assets/layout/user/footer.jsp" />
            </section>
        </main>
    </div>
</body>
</html>

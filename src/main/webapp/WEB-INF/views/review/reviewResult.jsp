<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<% 
String userId = (String) session.getAttribute("userId");
String companyCode = request.getParameter("companyCode");
%>

<!doctype html>
<html class="no-js win ko-KR" lang="ko-KR" xmlns="http://www.w3.org/1999/xhtml" prefix="og:http://ogp.me/ns#" xml:lang="ko-KR" foxified=""> 
<head> 
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"> 
    <title>구지직 GoojzzK</title> 
    <link rel="stylesheet" href="http://localhost/recruit-app/assets/css/review/c76e012c05e1318d.css" crossorigin="anonymous" data-n-g=""> 
    <link rel="stylesheet" href="http://localhost/recruit-app/assets/css/review/pretendardvariable-dynamic-subset.min.css"> 
    <link rel="stylesheet" href="http://localhost/recruit-app/assets/css/review/layout.css"> 
    <link href="http://localhost/recruit-app/assets/css/review/common-sv-202405271315.css" rel="stylesheet" type="text/css"> 
    <link rel="stylesheet" href="http://localhost/recruit-app/assets/css/review/pretendard.css">
    <link href="../assets/css/company/company-info-detail-3.css" rel="stylesheet" type="text/css" />
    <link href="../assets/css/company/company-info-detail-4.css" rel="stylesheet" type="text/css" />
    <link href="../assets/css/company/company-info-detail-5.css" rel="stylesheet" type="text/css" />
    <link href="../assets/css/company/company-info-detail-6.css" rel="stylesheet" type="text/css" />
    <link href="../assets/css/company/company-info-detail-7.css" rel="stylesheet" type="text/css" /> 
    <link href="../assets/css/company/company-info-detail-8.css" rel="stylesheet" type="text/css" />
    <link href="../assets/css/company/company-info-list-6.css" rel="stylesheet" type="text/css" />
    <style>
    </style> <!-- golgolz start --> <!--bootstrap 시작--> 
    <link href="http://localhost/recruit-app/assets/css/review/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous"> 
    <title>(주)커리어앤스카우트 2024년 기업정보|기업리뷰 3건,5.0 리뷰평점|잡플래닛</title>
    <link rel="stylesheet" media="all" href="http://localhost/recruit-app/assets/css/review/desktop_any_language_newtemp-d32b6cf831bb4740bce993bfd96c569c6baeaf94d7f80f1fd4e9067b626891fe.css" data-turbolinks-track="true">
    <link rel="stylesheet" media="all" href="http://localhost/recruit-app/assets/css/review/jpcommon_desktop-d7d02c5d04814f9edee3ac58d449a441ba65aefc82944a890cddcc312ac1ad73.css" data-turbolinks-track="true">
    <link rel="stylesheet" media="all" href="http://localhost/recruit-app/assets/css/review/desktop_common_v2-174463b871c8b1f684e874f394980fc8267d7f870a87bb3185b66ed659e8287e.css" data-turbolinks-track="true">
    <link rel="stylesheet" media="all" href="http://localhost/recruit-app/assets/css/review/desktop_ko-KR_newtemp-f550b8856ce3e095f203010a136d24dd3b4391f319743678ad50c02ac602f35c.css" data-turbolinks-track="true">
    <link rel="stylesheet" media="all" href="http://localhost/recruit-app/assets/css/review/desktop_front-fe3c4b71d9e9065f7509e7887570cca6902a467a78a1a74aad66c8f140ccd872.css" data-turbolinks-track="true">
    <link rel="stylesheet" media="all" href="http://localhost/recruit-app/assets/css/review/desktop_jply_style-5722c441eee9f7605fda329c4150d3eb40981b085c777dd037842f553e51eaf5.css" data-turbolinks-track="true">
    <link rel="stylesheet" href="http://localhost/recruit-app/assets/css/review/7f85a56ba4.css">
    <style text="text/css">
        <!-- golgolz start -->
        /* 포함된 header.jsp의 스타일 */
        .Menu_MenuNav__EOf3X {
            color: #666666; /* 폰트 색상 적용 */
        }
        <!-- golgolz end -->
    </style> 

    <script text="text/javascript">
        $(function(){
            <!-- golgolz start -->
            <!-- golgolz end -->
        });
    </script> 
    
</head> 
<body class="viewReviews before_login schbar_keyword_off chrome fixed_header" data-locale="ko-KR" data-domain="www.jobplanet.co.kr" data-write-guide-enabled="true"> 
<div id="__next" data-reactroot=""> 
<jsp:include page="../assets/layout/user/header.jsp" />
<main class="JobsFeed_Jobsfeed__DpeV9"> 
    <section class="Section_Section__P1hhc"> <!-- golgolz start --> 
        <link rel="stylesheet" media="all" href="http://localhost/recruit-app/assets/css/review/companies-afa4d7b5c5b020895de3ce30935faf8c1cc0ae8954ef59a46484c2edbc9108d5.css" data-turbolinks-track="true"> 
        
        
        <!-- 회사 정보 표시 -->
<div class="company-header-container">
    <div class="company-header-branding background-type4">
        <div class="company-header-branding-container ">
            <input type="hidden" id="mId" value="">
            <input type="hidden" id="cId" value="">
            <input type="hidden" id="jkcId" value="nexonhr">
            <input type="hidden" id="devPath" value="https://www.jobkorea.co.kr">
            <div class="logo">
                <img src="http://localhost/recruit-app/assets/images/company/logo/<c:out value="${ companyInfo.companyImg }"/>" style="width:100px; height:auto;">
            
            </div>
            <div class="company-header-branding-body">
                <div class="special-feature"></div>
                <div class="name">
                    ${companyInfo.companyName}
                </div>
            </div>
        </div>
    </div>
    <div class="company-nav" role="navigation" style="background-color: #ffffff;">
        <div class="company-nav-container">
            <a href="<c:url value='/companyinfo/companyinfoDetail.do?companyCode=${companyInfo.companyCode}' />" 
            class="company-nav-item activecompany-nav-item">
                <div class="name">기업정보</div>
                <div class="post">
                    <div class="header screen-out">게시물</div>
                    <div class="value"></div>
                </div>
            </a>
            <a href="${pageContext.request.contextPath}/review/reviewResult.do?companyCode=${companyInfo.companyCode}" class="company-nav-item active">
                <div class="name">기업리뷰</div>
                <div class="post">
                    <div class="header screen-out">게시물</div>
                    <div class="value">${totalReviewCount}</div>
                </div>
            </a>
            <a href="../recruit/recruits.jsp" class="company-nav-item ">
                <div class="name">채용공고</div>
                <div class="post">
                    <div class="header screen-out">게시물</div>
                </div>
            </a>
        </div>
    </div>
</div>


        <div id="contents_wrap" style="background-color: #ffffff;" > 
            <div id="contents" class="jpcont_col2_a"  > 
                <div id="mainContents" class="jpcont_lft" style="width: 100%; max-width: 1300px; margin: 0 auto; box-sizing: border-box; padding: 20px;"> 
                    <div id="premiumReviewStatistics" class="jpcont_wrap">
                        <div class="review_stats_wrap review_summary">
                            <div class="review_stats_container">
                                <div class="review_stats_wrapper total">
                                    <div class="stats_hd">
                                        <h2 class="stats_ttl"> <em>전체 리뷰</em> 통계 </h2>
                                    </div>
                                    <div class="stats_smr_sec left_sec ">
                                        <c:set var="totalAvg" value="0"/>
                                        <c:set var="count" value="0"/>
                                        <c:forEach var="review" items="${reviewScreenOutput}">
                                            <c:set var="avg" value="${(review.avgQuestion1 + review.avgQuestion2 + review.avgQuestion3 + review.avgQuestion4) / 4}"/>
                                            <c:set var="totalAvg" value="${totalAvg + avg}"/>
                                            <c:set var="count" value="${count + 1}"/>
                                        </c:forEach>
                                        <c:choose>
                                            <c:when test="${count > 0}">
                                                <c:set var="overallAvg" value="${totalAvg / count}"/>
                                            </c:when>
                                            <c:otherwise>
                                                <c:set var="overallAvg" value="0"/>
                                            </c:otherwise>
                                        </c:choose>
                                        <span class="rate_point"><fmt:formatNumber value="${overallAvg}" type="number" maxFractionDigits="1"/></span>
                                        <div class="rate_star_wrap type2">
                                            <div class="rate_star_ty1">
                                                <span class="bg_rate_star">
                                                    <span class="val_starmark" style="width: ${overallAvg * 20}%;"><span class="alt_txt"><fmt:formatNumber value="${overallAvg}" type="number" maxFractionDigits="1"/></span></span>
                                                </span>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="rate_bar_set barfill total">
                                        <div class="job_tooltip_box hover block">
                                            <div class="rate_bar_group">
                                                <div class="rate_bar_title">
                                                    이직시 나의 커리어에 도움이 될까요?
                                                </div>
                                                <div class="rate_bar_unit">
                                                    <span class="rate_bar_val" style="max-width: ${reviewScreenOutput[0].avgQuestion1 * 20}%;"></span>
                                                    <span class="txt_point"><fmt:formatNumber value="${reviewScreenOutput[0].avgQuestion1}" type="number" maxFractionDigits="1"/></span>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="job_tooltip_box hover block">
                                            <div class="rate_bar_group">
                                                <div class="rate_bar_title">
                                                    연차를 자유롭게 사용해도 될까요?
                                                </div>
                                                <div class="rate_bar_unit">
                                                    <span class="rate_bar_val" style="max-width: ${reviewScreenOutput[0].avgQuestion2 * 20}%;"></span>
                                                    <span class="txt_point"><fmt:formatNumber value="${reviewScreenOutput[0].avgQuestion2}" type="number" maxFractionDigits="1"/></span>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="job_tooltip_box hover block">
                                            <div class="rate_bar_group">
                                                <div class="rate_bar_title">
                                                    급여는 만족스럽나요?
                                                </div>
                                                <div class="rate_bar_unit">
                                                    <span class="rate_bar_val" style="max-width: ${reviewScreenOutput[0].avgQuestion3 * 20}%;"></span>
                                                    <span class="txt_point"><fmt:formatNumber value="${reviewScreenOutput[0].avgQuestion3}" type="number" maxFractionDigits="1"/></span>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="job_tooltip_box hover block">
                                            <div class="rate_bar_group">
                                                <div class="rate_bar_title">
                                                    복지 혜택이 충분한가요?
                                                </div>
                                                <div class="rate_bar_unit">
                                                    <span class="rate_bar_val" style="max-width: ${reviewScreenOutput[0].avgQuestion4 * 20}%;"></span>
                                                    <span class="txt_point"><fmt:formatNumber value="${reviewScreenOutput[0].avgQuestion4}" type="number" maxFractionDigits="1"/></span>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div id="premiumReviewChart" class="jpcont_wrap"></div><!-- 프리미엄 -->
                    <div id="reviewsContainer" class="jpcont_wrap">
                        <article id="viewReviewsFilter" class="filter">
                            <div class="col1Wrap jply_review_filter"></div>
                            <div id="viewReviewsTitle" class="result">
    							총 <span class="num">${totalReviewCount}</span>개의 기업리뷰
							</div>
                        </article>
                    </div>

                    <article id="viewReviewsList" class="article_ty1">
                        <div class="section_wrap">
                            <div class="section_body">
                                <!-- 기존 리뷰 리스트를 감싸는 div 추가 -->
                                <div class="section_group" id="reviewListContainer">
                                    <c:forEach var="review" items="${reviewScreenOutput}">
                                        <section class="content_ty4 video_ad_content" data-content_type="review" data-content_id="${review.reviewNum}" data-company_id="${review.companyCode}">
                                            <div class="content_wrap">
                                                <div class="content_top_ty2">
                                                    <span class="ico_pers"></span>
                                                    <span class="txt1">${review.userId}</span>
                                                    <span class="vbar">|</span>
                                                    <span class="txt1"><fmt:formatDate value="${review.inputDate}" pattern="yyyy-MM-dd"/></span>
                                                </div>
                                                <div class="ctbody_col2">
                                                    <!-- 개별 리뷰 통계 값 그래프 -->
                                                    <c:set var="reviewQuestions" value="${reviewQuestionsMap[review.reviewNum]}"/>
                                                    <dl class="ctbody_lft">
                                                        <dt class="df_tit">커리어 (개별)</dt>
                                                        <dd class="blo_box1">
                                                            <div class="us_bl_s">
                                                                <div class="bl_score" style="width:${reviewQuestions.question1 * 20}%;"></div>
                                                            </div>
                                                        </dd>
                                                        <dt class="df_tit">휴가 및 연차 (개별)</dt>
                                                        <dd class="blo_box1">
                                                            <div class="us_bl_s">
                                                                <div class="bl_score" style="width:${reviewQuestions.question2 * 20}%;"></div>
                                                            </div>
                                                        </dd>
                                                        <dt class="df_tit">연봉 (개별)</dt>
                                                        <dd class="blo_box1">
                                                            <div class="us_bl_s">
                                                                <div class="bl_score" style="width:${reviewQuestions.question3 * 20}%;"></div>
                                                            </div>
                                                        </dd>
                                                        <dt class="df_tit">복지 혜택 (개별)</dt>
                                                        <dd class="blo_box1">
                                                            <div class="us_bl_s">
                                                                <div class="bl_score" style="width:${reviewQuestions.question4 * 20}%;"></div>
                                                            </div>
                                                        </dd>
                                                    </dl>

                                                    <div class="content_body_ty1">
                                                        <div class="us_label_wrap">
                                                            <h2 class="us_label "> <span class="us_label_box">BEST</span> ${review.title} </h2>
                                                        </div>
                                                        <dl class="tc_list">
                                                            <dd>
                                                                ${review.content}
                                                            </dd>
                                                        </dl>

                                                        <div style="display: flex; justify-content: flex-end; margin-top: 20px;">
                                                            <button class="btn btn-dark" onclick="submitRecommend(${review.reviewNum}, '${companyCode}', '${sessionScope.userId}', this)">추천 ${review.recommend}</button>
                                                        </div>
                                                    </div>

                                                    <script>
                                                        function checkLoginAndSubmit(form) {
                                                            var userId = form.userId.value;
                                                            if (!userId) {
                                                                alert("로그인해주세요.");
                                                                window.location.href = '${pageContext.request.contextPath}/user/loginPage.do'; // 로그인 페이지로 리다이렉션
                                                                return false; // 폼 제출 중단
                                                            }
                                                            return true; // 로그인된 경우 폼 제출
                                                        }

                                                        function submitRecommend(reviewNum, companyCode, userId, button) {
                                                            $.ajax({
                                                                type: "POST",
                                                                url: "${pageContext.request.contextPath}/review/updateRecommend.do",
                                                                data: {
                                                                    reviewNum: reviewNum,
                                                                    companyCode: companyCode,
                                                                    userId: userId
                                                                },
                                                                success: function(response) {
                                                                    alert(response.message);
                                                                    if (response.success) {
                                                                        var count = parseInt($(button).text().split(' ')[1]) + 1;
                                                                        $(button).text('추천 ' + count);
                                                                    }
                                                                },
                                                                error: function() {
                                                                    alert('추천 처리 중 오류가 발생했습니다.');
                                                                }
                                                            });
                                                        }
                                                    </script>

                                                    <c:if test="${not empty recommendMsg}">
                                                        <script>
                                                            alert("${recommendMsg}");
                                                        </script>
                                                    </c:if>
                                                    <c:remove var="recommendMsg" scope="request"/>
                                                </div>
                                            </div>
                                        </section>
                                    </c:forEach>
                                </div>
                                <!-- 더 보기 버튼 -->
                                <div style="height:50px; width:100%; text-align:center;font-size:18px; padding-top:5px">
                                    <a href="#" id="loadMore" data-page="1">더 보기 +</a>
                                </div>
                            </div>
                        </div>
                    </article>

                    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
                    <script>
                        $(document).ready(function() {
                            $('#loadMore').on('click', function(e) {
                                e.preventDefault();
                                var page = $(this).data('page');
                                loadMoreReviews(page);
                            });

                            function loadMoreReviews(page) {
                                $.ajax({
                                    url: '${pageContext.request.contextPath}/review/loadMoreReviews.do',
                                    type: 'GET',
                                    data: {
                                        page: page,
                                        companyCode: '${companyCode}'
                                    },
                                    success: function(response) {
                                        $('#reviewListContainer').append(response);
                                        $('#loadMore').data('page', page + 1);
                                    },
                                    error: function() {
                                        alert('리뷰를 불러오는 중 오류가 발생했습니다.');
                                    }
                                });
                            }
                        });
                    </script>
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

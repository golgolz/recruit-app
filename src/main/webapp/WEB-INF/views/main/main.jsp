<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!doctype html>
<html>

<head>
<jsp:include page="../assets/layout/user/lib.jsp" /> 

  <link rel="preload" href="http://localhost/recruit-app/assets/css/main/c76e012c05e1318d.css" as="style" crossorigin="anonymous">
  <link rel="stylesheet" href="http://localhost/recruit-app/assets/css/main/c76e012c05e1318d.css" crossorigin="anonymous" data-n-g="">
  <link rel="stylesheet" href="http://localhost/recruit-app/assets/css/main/31749fc30b2cee78.css" crossorigin="anonymous" data-n-p="">
  <link rel="preload" href="http://localhost/recruit-app/assets/css/main/105b10ca0c5005ca.css" as="style" crossorigin="anonymous">
  <link rel="stylesheet" href="http://localhost/recruit-app/assets/css/main/105b10ca0c5005ca.css" crossorigin="anonymous" data-n-p="">
  <link rel="stylesheet" href="http://localhost/recruit-app/assets/css/main/abbebb70674a7a53.css" crossorigin="anonymous" data-n-p="">
  <link rel="preload" href="http://localhost/recruit-app/assets/css/main/6c9e71f92bc24580.css" as="style" crossorigin="anonymous">
  <link rel="stylesheet" href="http://localhost/recruit-app/assets/css/main/6c9e71f92bc24580.css" crossorigin="anonymous" data-n-p="">
  <link rel="preload" href="http://localhost/recruit-app/assets/css/main/6b7b4649561ccba8.css" as="style" crossorigin="anonymous">
  <link rel="stylesheet" href="http://localhost/recruit-app/assets/css/main/6b7b4649561ccba8.css" crossorigin="anonymous" data-n-p="">
  <noscript data-n-css=""></noscript>
  <script defer crossorigin="anonymous" nomodule="" src="https://asset.wanted.co.kr/userweb/www/_next/static/chunks/polyfills-c67a75d1b6f99dc8.js"></script>
  <link rel="stylesheet" type="text/css" href="http://localhost/recruit-app/assets/css/main/slick.css">
  <link rel="stylesheet" type="text/css" href="http://localhost/recruit-app/assets/css/main/slick-theme.css">
  <link rel="stylesheet" href="http://localhost/recruit-app/assets/css/main/all.min.css">
  <meta charset="utf-8">
  <link rel="stylesheet" href="http://localhost/recruit-app/assets/css/main/slick.css" media="screen">
  <link rel="stylesheet" href="http://localhost/recruit-app/assets/css/main/pretendardvariable-dynamic-subset.min.css">
  <link rel="stylesheet" href="http://localhost/recruit-app/assets/css/main/pretendardvariable-jp-dynamic-subset.min.css">
  <link rel="search" href="/opensearch.xml" type="application/opensearchdescription+xml" title="Wanted">

  
  <style>
    .prev, .next {
      font-size: 2rem;
      position: absolute;
      top: 50%;
      transform: translateY(-50%);
      cursor: pointer;
      color: #666666;
      z-index: 2;
    }
    .prev { left: 10px; }
    .next { right: 10px; }
    .slick-slide {
      display: flex !important;
      justify-content: center;
      align-items: center;
    }
  </style>
</head>

<body>
  <div id="__next" data-reactroot="">
    <jsp:include page="../assets/layout/user/header.jsp" />

    <main class="JobsFeed_Jobsfeed__DpeV9">
      <section class="Section_Section__P1hhc" 
        style="width: 100%;
        max-width: 1300px;
        margin: 0 auto;
        box-sizing: border-box;
        padding: 20px;">
        <!-- 슬라이드 1 -->
        <div>
          <section class="Section_Section__P1hhc">

            <!-- 기업 홍보란 -->
            <div class="custom-page-wrapper" style="position:relative;">
              <div class="custom-post-slider">
                <i class="fas fa-chevron-left custom-prev"></i>
                <i class="fas fa-chevron-right custom-next"></i>
                <div class="custom-post-wrapper">

                  <div class="custom-post">
                    <div class="custom-slider-image-container"  style="width: 150 %;">
                      <img src="${pageContext.request.contextPath}/assets/images/ads/2.webp" class="custom-slider-image" >
                      <div class="custom-image-text">
                        <strong>클라썸은 지금도 전 직원 채용중.</strong> <br/>
                        <span style="font-size: 15px;">어서 지원하세요!</span>
                      </div>
                    </div>
                    <div class="custom-post-info">
                    </div>
                  </div>

                  <div class="custom-post">
                    <div class="custom-slider-image-container" style="width: 150%;">
                      <img src="${pageContext.request.contextPath}/assets/images/ads/1.webp" class="custom-slider-image">
                      <div class="custom-image-text">
                        <strong>인공지능 (AI)포지션.</strong> <br/>
                        <span style="font-size: 15px;">눈여겨볼 인공지능 (AI) 공고를 소개합니다</span>
                      </div>
                    </div>
                    <div class="custom-post-info">
                    </div>
                  </div>
                </div>
              </div>
            </div>
            
            
            <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
            <script src="https://cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script>
            <script>
              $(document).ready(function(){
                $('.custom-post-wrapper').slick({
                  prevArrow: $('.custom-prev'),
                  nextArrow: $('.custom-next'),
                  slidesToShow: 1,
                  slidesToScroll: 1,
                  infinite: true,
                  adaptiveHeight: true
                });
              });
            </script>

            <!-- 첫 번째 테마: 최근 등록된 공고 -->
<article class="MatchedJobArea_MatchedJobArea__vFPPT">
    <div class="CarouselContainer_CarouselContainer__95CM6">
        <aside class="CarouselHeader_CarouselHeader__d4DeW">
            <h4 class="Typography_Typography__root__xYuMs Typography_Typography__heading1__bVyRs Typography_Typography__weightBold__e15ql">최근 등록된 공고</h4>
            <div class="CarouselHeader_CarouselHeader__action__C_6l_">
                <a href="" class="CarouselHeader_CarouselHeader__link__WWKP1" data-attribute-id="jobs__seeMore" data-domain="recommendPosition">전체보기<span class="CarouselHeader_CarouselHeader__link__interaction__RUr0k"></span></a>
                <div class="CarouselNavigation_CarouselNavigation__V89Z_">
                    <button class="IconButton_IconButton__root__dO2x7 IconButton_IconButton__normal__O3ySx prev-1 CarouselNavigation_CarouselNavigation__left__MtZCF" aria-label="이전" style="font-size: 15px;">
                        <span class="IconButton_IconButton__label__ZcWfp">
                            <svg width="12" height="12" viewBox="0 0 12 12">
                                <path fill="#70737C" d="M3.345 9.72a.75.75 0 0 0 1.06 1.06l4.25-4.25a.75.75 0 0 0 0-1.06l-4.25-4.25a.75.75 0 0 0-1.06 1.06L7.065 6l-3.72 3.72z"></path>
                            </svg>
                        </span>
                        <span class="IconButton_IconButton__interaction__7RjPt"></span>
                    </button>
                    <button class="IconButton_IconButton__root__dO2x7 IconButton_IconButton__normal__O3ySx next-1 CarouselNavigation_CarouselNavigation__right__2qsYe" aria-label="다음" style="font-size: 15px;">
                        <span class="IconButton_IconButton__label__ZcWfp">
                            <svg width="12" height="12" viewBox="0 0 12 12">
                                <path fill="#70737C" d="M3.345 9.72a.75.75 0 0 0 1.06 1.06l4.25-4.25a.75.75 0 0 0 0-1.06l-4.25-4.25a.75.75 0 0 0-1.06 1.06L7.065 6l-3.72 3.72z"></path>
                            </svg>
                        </span>
                        <span class="IconButton_IconButton__interaction__7RjPt"></span>
                    </button>
                </div>
            </div>
        </aside>
        <div class="CarouselContainer_CarouselContainer__slider__zf_Yl">
            <div class="slick-slider slick-initialized" dir="ltr">
                <div class="slick-list">
                    <div class="slick-track" id="slick-track-1" style="width: 100%; opacity: 1; transform: translate3d(0px, 0px, 0px);">
                        <c:forEach var="post" items="${recentJobPosts}">
                            <div class="slick-slide" tabindex="-1" aria-hidden="false" style="outline: none; width: calc(25% - 10px); margin-right: 10px;">
                                 <a href="<c:url value='/main/detail.do?id=${post.recruitNum}' />">
                                    <div class="JobCard_JobCard__thumb__iNW6E" style="height: 135px; width: 200px;">
                                        <img src="<c:url value='../assets/images/company/${post.companyImage}' />" alt="${post.companyName}" style="width: 100%; height: 100%; object-fit: cover;">
                                    </div>
                                    <div>
                                        <p style="margin-bottom: 4px; overflow: hidden; display: -webkit-box; -webkit-line-clamp: 2; -webkit-box-orient: vertical; text-overflow: ellipsis; font-weight: 600; font-size: 16px; letter-spacing: .0057em; line-height: 24px;">${post.title}</p>
                                        <p>${post.companyName}</p>
                                    </div>
                                </a>
                            </div>
                        </c:forEach>
                        <!-- 더미 컨텐츠 추가 -->
                        <c:if test="${fn:length(recentJobPosts) < 4}">
                            <c:forEach begin="1" end="${4 - fn:length(recentJobPosts)}">
                                <div class="slick-slide" tabindex="-1" aria-hidden="false" style="outline: none; width: calc(25% - 10px); margin-right: 10px;">
                                    <a href="#">
                                        <div class="JobCard_JobCard__thumb__iNW6E" style="height: 135px; width: 200px; background-color: lightgray;"></div>
                                        <div>
                                            <p style="margin-bottom: 4px; overflow: hidden; display: -webkit-box; -webkit-line-clamp: 2; -webkit-box-orient: vertical; text-overflow: ellipsis; font-weight: 600; font-size: 16px; letter-spacing: .0057em; line-height: 24px;">&nbsp;</p>
                                            <p>&nbsp;</p>
                                        </div>
                                    </a>
                                </div>
                            </c:forEach>
                        </c:if>
                    </div>
                </div>
            </div>
        </div>
    </div>
</article>
      
       <!-- 로그인된 사용자 정보 확인 -->
        <c:if test="${not empty sessionScope.userId}">
          <c:set var="loggedInUser" value="${sessionScope.userId}" />
        </c:if>

        <!-- 두 번째 테마: 내가 관심있을만한 포지션 -->
<article class="MatchedJobArea_MatchedJobArea__vFPPT">
    <div class="CarouselContainer_CarouselContainer__95CM6">
        <aside class="CarouselHeader_CarouselHeader__d4DeW">
            <h4 class="Typography_Typography__root__xYuMs Typography_Typography__heading1__bVyRs Typography_Typography__weightBold__e15ql">내가 관심있을만한 포지션</h4>
            <div class="CarouselHeader_CarouselHeader__action__C_6l_">
                <a href="" class="CarouselHeader_CarouselHeader__link__WWKP1" data-attribute-id="jobs__seeMore" data-domain="recommendPosition">전체보기<span class="CarouselHeader_CarouselHeader__link__interaction__RUr0k"></span></a>
                <div class="CarouselNavigation_CarouselNavigation__V89Z_">
                    <button class="IconButton_IconButton__root__dO2x7 IconButton_IconButton__normal__O3ySx prev-2 CarouselNavigation_CarouselNavigation__left__MtZCF" aria-label="이전" style="font-size: 15px;">
                        <span class="IconButton_IconButton__label__ZcWfp">
                            <svg width="12" height="12" viewBox="0 0 12 12">
                                <path fill="#70737C" d="M3.345 9.72a.75.75 0 0 0 1.06 1.06l4.25-4.25a.75.75 0 0 0 0-1.06l-4.25-4.25a.75.75 0 0 0-1.06 1.06L7.065 6l-3.72 3.72z"></path>
                        </svg>
                        </span>
                        <span class="IconButton_IconButton__interaction__7RjPt"></span>
                    </button>
                    <button class="IconButton_IconButton__root__dO2x7 IconButton_IconButton__normal__O3ySx next-2 CarouselNavigation_CarouselNavigation__right__2qsYe" aria-label="다음" style="font-size: 15px;">
                        <span class="IconButton_IconButton__label__ZcWfp">
                            <svg width="12" height="12" viewBox="0 0 12 12">
                                <path fill="#70737C" d="M3.345 9.72a.75.75 0 0 0 1.06 1.06l4.25-4.25a.75.75 0 0 0 0-1.06l-4.25-4.25a.75.75 0 0 0-1.06 1.06L7.065 6l-3.72 3.72z"></path>
                        </svg>
                        </span>
                        <span class="IconButton_IconButton__interaction__7RjPt"></span>
                    </button>
                </div>
            </div>
        </aside>
        <div class="CarouselContainer_CarouselContainer__slider__zf_Yl">
            <div class="slick-slider slick-initialized" dir="ltr">
                <div class="slick-list">
                    <div class="slick-track" id="slick-track-2" style="width: 100%; opacity: 1; transform: translate3d(0px, 0px, 0px);">
                        <c:forEach var="post" items="${interestedPositions}">
                            <div class="slick-slide" tabindex="-1" aria-hidden="false" style="outline: none; width: calc(25% - 10px); margin-right: 10px;">
                                 <a href="<c:url value='/main/detail.do?id=${post.recruitNum}' />">
                                    <div class="JobCard_JobCard__thumb__iNW6E" style="height: 135px; width: 200px;">
                                        <img src="<c:url value='../assets/images/company/${post.companyImage}' />" alt="${post.companyName}" style="width: 100%; height: 100%; object-fit: cover;">
                                    </div>
                                    <div>
                                        <p style="margin-bottom: 4px; overflow: hidden; display: -webkit-box; -webkit-line-clamp: 2; -webkit-box-orient: vertical; text-overflow: ellipsis; font-weight: 600; font-size: 16px; letter-spacing: .0057em; line-height: 24px;">${post.title}</p>
                                        <p>${post.companyName}</p>
                                    </div>
                                </a>
                            </div>
                        </c:forEach>
                        <!-- 더미 컨텐츠 추가 -->
                        <c:if test="${fn:length(interestedPositions) < 4}">
                            <c:forEach begin="1" end="${4 - fn:length(interestedPositions)}">
                                <div class="slick-slide" tabindex="-1" aria-hidden="false" style="outline: none; width: calc(25% - 10px); margin-right: 10px;">
                                    <a href="#">
                                        <div class="JobCard_JobCard__thumb__iNW6E" style="height: 135px; width: 200px; background-color: lightgray;"></div>
                                        <div>
                                            <p style="margin-bottom: 4px; overflow: hidden; display: -webkit-box; -webkit-line-clamp: 2; -webkit-box-orient: vertical; text-overflow: ellipsis; font-weight: 600; font-size: 16px; letter-spacing: .0057em; line-height: 24px;">&nbsp;</p>
                                            <p>&nbsp;</p>
                                        </div>
                                    </a>
                                </div>
                            </c:forEach>
                        </c:if>
                    </div>
                </div>
            </div>
        </div>
    </div>
</article>

      
      <!-- 세 번째 테마: 고연봉 포지션 -->
      <article class="HighSalaryPositions_HighSalaryPositions__xyz">
    <div class="CarouselContainer_CarouselContainer__95CM6">
        <aside class="CarouselHeader_CarouselHeader__d4DeW">
            <h4 class="Typography_Typography__root__xYuMs Typography_Typography__heading1__bVyRs Typography_Typography__weightBold__e15ql">고연봉 포지션</h4>
            <div class="CarouselHeader_CarouselHeader__action__C_6l_">
                <a href="" class="CarouselHeader_CarouselHeader__link__WWKP1" data-attribute-id="jobs__seeMore" data-domain="recommendPosition">전체보기<span class="CarouselHeader_CarouselHeader__link__interaction__RUr0k"></span></a>
                <div class="CarouselNavigation_CarouselNavigation__V89Z_">
                    <button class="IconButton_IconButton__root__dO2x7 IconButton_IconButton__normal__O3ySx prev-2 CarouselNavigation_CarouselNavigation__left__MtZCF" aria-label="이전" style="font-size: 15px;">
                        <span class="IconButton_IconButton__label__ZcWfp">
                            <svg width="12" height="12" viewBox="0 0 12 12">
                                <path fill="#70737C" d="M3.345 9.72a.75.75 0 0 0 1.06 1.06l4.25-4.25a.75.75 0 0 0 0-1.06l-4.25-4.25a.75.75 0 0 0-1.06 1.06L7.065 6l-3.72 3.72z"></path>
                            </svg>
                        </span>
                        <span class="IconButton_IconButton__interaction__7RjPt"></span>
                    </button>
                    <button class="IconButton_IconButton__root__dO2x7 IconButton_IconButton__normal__O3ySx next-2 CarouselNavigation_CarouselNavigation__right__2qsYe" aria-label="다음" style="font-size: 15px;">
                        <span class="IconButton_IconButton__label__ZcWfp">
                            <svg width="12" height="12" viewBox="0 0 12 12">
                                <path fill="#70737C" d="M3.345 9.72a.75.75 0 0 0 1.06 1.06l4.25-4.25a.75.75 0 0 0 0-1.06l-4.25-4.25a.75.75 0 0 0-1.06 1.06L7.065 6l-3.72 3.72z"></path>
                            </svg>
                        </span>
                        <span class="IconButton_IconButton__interaction__7RjPt"></span>
                    </button>
                </div>
            </div>
        </aside>
        <div class="CarouselContainer_CarouselContainer__slider__zf_Yl">
            <div class="slick-slider slick-initialized" dir="ltr">
                <div class="slick-list">
                    <div class="slick-track" id="slick-track-2" style="width: 100%; opacity: 1; transform: translate3d(0px, 0px, 0px);">
                        <c:forEach var="post" items="${highSalaryPositions}">
                            <div class="slick-slide" tabindex="-1" aria-hidden="false" style="outline: none; width: calc(25% - 10px); margin-right: 10px;">
                                 <a href="<c:url value='/main/detail.do?id=${post.recruitNum}' />">
                                    <div class="JobCard_JobCard__thumb__iNW6E" style="height: 134pxpx; width: 200px;">
                                        <img src="<c:url value='../assets/images/company/${post.companyImage}' />" alt="${post.companyName}" style="width: 100%; height: 100%; object-fit: cover;">
                                    </div>
                                    <div>
                                        <p style="margin-bottom: 4px; overflow: hidden; display: -webkit-box; -webkit-line-clamp: 2; -webkit-box-orient: vertical; text-overflow: ellipsis; font-weight: 600; font-size: 16px; letter-spacing: .0057em; line-height: 24px;">${post.positionName}</p>
                                        <p>${post.companyName}</p>
                                    </div>
                                </a>
                            </div>
                        </c:forEach>
                        <!-- 더미 컨텐츠  -->
                       <c:if test="${fn:length(highSalaryPositions) < 4}">
    <c:forEach begin="1" end="${4 - fn:length(highSalaryPositions)}">
        <div class="slick-slide" tabindex="-1" aria-hidden="false" style="outline: none; width: calc(25% - 10px); margin-right: 10px;">
            <a href="#"> 
                <div class="JobCard_JobCard__thumb__iNW6E" style="height: 134px; width: 200px; background-color: lightgray;"></div>
                <div>
                    <p style="margin-bottom: 4px; overflow: hidden; display: -webkit-box; -webkit-line-clamp: 2; -webkit-box-orient: vertical; text-overflow: ellipsis; font-weight: 600; font-size: 16px; letter-spacing: .0057em; line-height: 24px;">&nbsp;</p> 
                    <p>&nbsp;</p> 
                </div>
            </a>
        </div>
    </c:forEach>
</c:if>
                    </div>
                </div>
            </div>
        </div>
    </div>
</article>


<!-- 네 번째 테마: 조회 기록 -->

<article class="ViewHistory_ViewHistory__xyz">
    <div class="CarouselContainer_CarouselContainer__95CM6">
        <aside class="CarouselHeader_CarouselHeader__d4DeW">
            <h4 class="Typography_Typography__root__xYuMs Typography_Typography__heading1__bVyRs Typography_Typography__weightBold__e15ql">조회 기록</h4>
            <div class="CarouselHeader_CarouselHeader__action__C_6l_">
                <a href="" class="CarouselHeader_CarouselHeader__link__WWKP1" data-attribute-id="jobs__seeMore" data-domain="recommendPosition">전체보기<span class="CarouselHeader_CarouselHeader__link__interaction__RUr0k"></span></a>
                <div class="CarouselNavigation_CarouselNavigation__V89Z_">
                    <button class="IconButton_IconButton__root__dO2x7 IconButton_IconButton__normal__O3ySx prev-3 CarouselNavigation_CarouselNavigation__left__MtZCF" aria-label="이전" style="font-size: 15px;">
                        <span class="IconButton_IconButton__label__ZcWfp">
                            <svg width="12" height="12" viewBox="0 0 12 12">
                                <path fill="#70737C" d="M3.345 9.72a.75.75 0 0 0 1.06 1.06l4.25-4.25a.75.75 0 0 0 0-1.06l-4.25-4.25a.75.75 0 0 0-1.06 1.06L7.065 6l-3.72 3.72z"></path>
                            </svg>
                        </span>
                        <span class="IconButton_IconButton__interaction__7RjPt"></span>
                    </button>
                    <button class="IconButton_IconButton__root__dO2x7 IconButton_IconButton__normal__O3ySx next-3 CarouselNavigation_CarouselNavigation__right__2qsYe" aria-label="다음" style="font-size: 15px;">
                        <span class="IconButton_IconButton__label__ZcWfp">
                            <svg width="12" height="12" viewBox="0 0 12 12">
                                <path fill="#70737C" d="M3.345 9.72a.75.75 0 0 0 1.06 1.06l4.25-4.25a.75.75 0 0 0 0-1.06l-4.25-4.25a.75.75 0 0 0-1.06 1.06L7.065 6l-3.72 3.72z"></path>
                            </svg>
                        </span>
                        <span class="IconButton_IconButton__interaction__7RjPt"></span>
                    </button>
                </div>
            </div>
        </aside>
        <div class="CarouselContainer_CarouselContainer__slider__zf_Yl">
            <div class="slick-slider slick-initialized" dir="ltr">
                <div class="slick-list">
                    <div class="slick-track" id="slick-track-3" style="width: 100%; opacity: 1; transform: translate3d(0px, 0px, 0px);">
                        <c:forEach var="post" items="${viewHistory}">
                            <div class="slick-slide" tabindex="-1" aria-hidden="false" style="outline: none; width: calc(25% - 10px); margin-right: 10px;">
                                <a href="../recruit/detail.do?id=${post.recruitNum}">
                                    <div class="JobCard_JobCard__thumb__iNW6E" style="height: 134px; width: 200px;">
                                        <img src="<c:url value='../assets/images/company/${post.companyImage}' />" alt="${post.companyName}" style="width: 100%; height: 100%; object-fit: cover;">
                                    </div>
                                    <div>
                                        <p style="margin-bottom: 4px; overflow: hidden; display: -webkit-box; -webkit-line-clamp: 2; -webkit-box-orient: vertical; text-overflow: ellipsis; font-weight: 600; font-size: 16px; letter-spacing: .0057em; line-height: 24px;">${post.positionName}</p>
                                        <p>${post.companyName}</p>
                                        <p>${post.viewDate}</p>
                                    </div>
                                </a>
                            </div>
                        </c:forEach>
                        <!-- 더미 컨텐츠 -->
                        <c:if test="${fn:length(viewHistory) < 4}">
                            <c:forEach begin="1" end="${4 - fn:length(viewHistory)}">
                                <div class="slick-slide" tabindex="-1" aria-hidden="false" style="outline: none; width: calc(25% - 10px); margin-right: 10px;">
                                    <a href="#"> 
                                        <div class="JobCard_JobCard__thumb__iNW6E" style="height: 134px; width: 200px; background-color: lightgray;"></div>
                                        <div>
                                            <p style="margin-bottom: 4px; overflow: hidden; display: -webkit-box; -webkit-line-clamp: 2; -webkit-box-orient: vertical; text-overflow: ellipsis; font-weight: 600; font-size: 16px; letter-spacing: .0057em; line-height: 24px;">&nbsp;</p> 
                                            <p>&nbsp;</p> 
                                            <p>&nbsp;</p> <div style="height: 24px;"></div>
                                        </div>
                                    </a>
                                </div>
                            </c:forEach>
                        </c:if>
                    </div>
                </div>
            </div>
        </div>
    </div>
</article>

      
    </section>
    </section>
  </main>
  <script>
    $(document).ready(function(){
      $('#slick-track-1').slick({
        prevArrow: '.prev-1',
        nextArrow: '.next-1',
        slidesToShow: 4,
        slidesToScroll: 4,
        infinite: false,
        adaptiveHeight: true
      });
    });
  </script>

        </div>
      <jsp:include page="../assets/layout/user/footer.jsp" />
    </main>
  </div>
</body>
</html>

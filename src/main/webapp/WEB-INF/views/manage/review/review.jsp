<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" info=""%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="https://code.jquery.com/ui/1.13.3/themes/base/jquery-ui.css">

<jsp:include page="../../assets/layout/admin/lib.jsp" />

<script src="https://code.jquery.com/jquery-3.7.1.js"></script>
<script src="https://code.jquery.com/ui/1.13.3/jquery-ui.js"></script>
<script src="http://localhost/recruit-app/assets/js/admin/datepicker-ko.js"></script>

<script type="text/javascript">
    $(function(){
        $("#review_menu").addClass("bg-gradient-primary");
        
        // 리뷰 행 클릭 시 상세 페이지로 이동
        $('.list').on('click', 'tr', function() {
            var reviewNum = $(this).data('review-num');
            window.location.href = '/recruit-app/manage/review/reviewUpdate.do?reviewNum=' + reviewNum;
        });

        // 초기화 버튼 클릭 이벤트 핸들러
        $("#btn-reset").click(function(){
            window.location.href = window.location.pathname;
        });
    });

    // JSON 데이터를 파싱하여 테이블에 추가하는 함수
    function loadReviews(reviewListJson, page = 1, itemsPerPage = 8) {
        console.log("loadReviews called with reviewListJson:", reviewListJson);
        const reviews = JSON.parse(reviewListJson);
        const reviewListTable = document.querySelector('.list');

        reviewListTable.innerHTML = ''; // 기존 리스트 초기화

        const startIndex = (page - 1) * itemsPerPage;
        const endIndex = page * itemsPerPage;
        const paginatedReviews = reviews.slice(startIndex, endIndex);

        paginatedReviews.forEach((review, index) => {
            console.log("Adding review:", review); // 디버그 로그 추가
            const row = document.createElement('tr');
            row.setAttribute('data-review-num', review.reviewNum);

            const reviewNumCell = document.createElement('td');
            reviewNumCell.textContent = startIndex + index + 1;
            row.appendChild(reviewNumCell);

            const userIdCell = document.createElement('td');
            userIdCell.textContent = review.userId;
            row.appendChild(userIdCell);

            const authorCell = document.createElement('td');
            authorCell.textContent = review.author;
            row.appendChild(authorCell);

            const titleCell = document.createElement('td');
            titleCell.textContent = review.title;
            row.appendChild(titleCell);

            const inputDateCell = document.createElement('td');
            inputDateCell.textContent = review.inputDate;
            row.appendChild(inputDateCell);

            const recommendCell = document.createElement('td');
            recommendCell.textContent = review.recommend;
            row.appendChild(recommendCell);

            const deleteFlagCell = document.createElement('td');
            deleteFlagCell.textContent = review.deleteFlag;
            row.appendChild(deleteFlagCell);

            reviewListTable.appendChild(row);
        });

        updatePagination(reviews.length, page, itemsPerPage);
    }

    function updatePagination(totalItems, currentPage, itemsPerPage) {
        const totalPages = Math.ceil(totalItems / itemsPerPage);
        const paginationUl = document.querySelector('.pagination');
        paginationUl.innerHTML = '';

        const prevPageLi = document.createElement('li');
        prevPageLi.className = 'page-items';
        const prevPageLink = document.createElement('a');
        prevPageLink.className = 'page-link';
        prevPageLink.href = '#';
        prevPageLink.setAttribute('aria-label', 'Previous');
        prevPageLink.innerHTML = '<span aria-hidden="true">&laquo;</span>';
        prevPageLink.onclick = function (e) {
            e.preventDefault();
            if (currentPage > 1) {
                loadReviews(window.reviewListJson, currentPage - 1, itemsPerPage);
            }
        };
        prevPageLi.appendChild(prevPageLink);
        paginationUl.appendChild(prevPageLi);

        for (let i = 1; i <= totalPages; i++) {
            const pageLi = document.createElement('li');
            pageLi.className = 'page-items';
            const pageLink = document.createElement('a');
            pageLink.className = 'page-link';
            pageLink.href = '#';
            pageLink.textContent = i;
            pageLink.setAttribute('data-page', i);
            pageLink.onclick = function (e) {
                e.preventDefault();
                loadReviews(window.reviewListJson, i, itemsPerPage);
            };
            pageLi.appendChild(pageLink);
            paginationUl.appendChild(pageLi);
        }

        const nextPageLi = document.createElement('li');
        nextPageLi.className = 'page-items';
        const nextPageLink = document.createElement('a');
        nextPageLink.className = 'page-link';
        nextPageLink.href = '#';
        nextPageLink.setAttribute('aria-label', 'Next');
        nextPageLink.innerHTML = '<span aria-hidden="true">&raquo;</span>';
        nextPageLink.onclick = function (e) {
            e.preventDefault();
            if (currentPage < totalPages) {
                loadReviews(window.reviewListJson, currentPage + 1, itemsPerPage);
            }
        };
        nextPageLi.appendChild(nextPageLink);
        paginationUl.appendChild(nextPageLi);
    }

    window.onload = function() {
        window.reviewListJson = '${reviewListJson}';
        console.log("window.onload called with reviewListJson:", window.reviewListJson);
        if (window.reviewListJson) {
            loadReviews(window.reviewListJson);
        }
    };
</script>




<!-- golgolz start -->

<link href="http://localhost/recruit-app/assets/css/pagenation.css" rel="stylesheet" />
<link href="http://localhost/recruit-app/assets/css/manage/order/admin.css" rel="stylesheet" />
<link href="http://localhost/recruit-app/assets/css/manage/order/reset.css" rel="stylesheet" />
<!-- golgolz end -->
</head>
<body>
    <jsp:include page="../../assets/layout/admin/header.jsp" />
    <main
        class="main-content position-relative max-height-vh-100 h-100 border-radius-lg ps ps--active-y">
        <nav
            class="navbar navbar-main navbar-expand-lg px=0 mx-4 shadow-none border-radius-xl"
            id="navbarBlur" data-scroll="true">
            <div class="container-fluid py-1 px-3">
                <nav aria-label="breadcrumb">
                    <ol
                        class="breadcrumb bg-transparent mb-0 pb-0 pt-1 px-0 me-sm-6 me-5">
                        <li class="breadcrumb-item text-sm"><a
                            class="opacity-5 text-dark" href="javascript:;">
                            관리자 기능</a></li>
                        <!-- 하단의 대시보드 텍스트를 본인 기능으로 변경 필요  -->
                        <li class="breadcrumb-item text-sm text-dark active"
                            aria-current="page">리뷰 관리</li>
                    </ol>
                    <h6 class="font-weight-bolder mb-0">리뷰 관리</h6>
                </nav>
            </div>
        </nav>
    
    <div class="container-fluid">
            <!-- golgolz start -->
            <div class="s_wrap">
        <form name="fsearch" id="fsearch" method="get" onsubmit="return handleFormSubmit(event);" action="/recruit-app/manage/review/review.do">
    <input type="hidden" name="code" value="list">
    <div class="tbl_frm01">
        <table>
            <colgroup>
                <col class="w100">
                <col>
            </colgroup>
            <tbody>
                <tr>
                    <th scope="row">검색어</th>
                    <td>
                        <select name="sfl">
                            <option value="id" <c:if test="${param.sfl == 'id'}">selected</c:if>>아이디</option>
                            <option value="name" <c:if test="${param.sfl == 'name'}">selected</c:if>>회원명</option>
                            <option value="titleOrContent" <c:if test="${param.sfl == 'titleOrContent'}">selected</c:if>>제목 또는 내용</option>
                        </select>
                        <input type="text" name="stx" value="${param.stx}" class="frm_input" size="30">
                    </td>
                </tr>
            </tbody>
        </table>
    </div>
    <div class="btn_confirm">
        <input type="submit" value="검색" class="btn btn-secondary btn-sm">
        <input type="button" value="초기화" class="btn btn-outline-secondary btn-sm" id="btn-reset">
    </div>
</form>

        <div class="local_ov mart30">
            총 리뷰 수 : <b class="fc_red">${reviewList != null ? reviewList.size() : 0}</b>건
        </div>
        <div class="tbl_head01">
            <table>
                <thead>
                    <tr>
                        <th scope="col" style="width: 50px;">번호</th>
                        <th scope="col" style="width: 50px;">아이디</th>
                        <th scope="col" style="width: 50px;">작성자</th>
                        <th scope="col" style="width: 150px;">제목</th>
                        <th scope="col" style="width: 130px;">작성일</th>
                        <th scope="col" style="width: 60px;">추천수</th>
                        <th scope="col" style="width: 60px;">삭제여부</th>
                    </tr>
                </thead>
                <tbody class="list">
                    <!-- 리뷰 리스트가 여기에서 동적으로 추가됩니다. -->
                </tbody>
            </table>
        </div>
        <div style="margin-top: 40px; justify-content: center;">
            <nav aria-label="Page navigation example">
                <ul class="pagination" style="justify-content: center;">
                    <!-- 페이지네이션 아이템들이 여기에 동적으로 추가됩니다. -->
                </ul>
            </nav>
        </div>
    </div>
</div>

    <!-- golgolz end -->
    </main>
</body>
</html>
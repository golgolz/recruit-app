<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <jsp:include page="/WEB-INF/views/assets/layout/admin/lib.jsp" />
    <link rel="stylesheet" type="text/css" href="https://img.echosting.cafe24.com/editors/froala/css/froala_style_ec.min.css?vs=2404251303" charset="utf-8"/>
    <link rel="stylesheet" type="text/css" href="https://insideobject.com/ind-script/optimizer.php?filename=nZExDgIxDAT7KC3vsOAJPIEfOMFwJxJv5DgS_J6jggYJ0o52doulBVVofzBqhqtxJZOOYVko904Xgzpl1AqNG9jRL3nJoaMMX6Eh4T4pDvfZ0cIPsTnVORWZVNFCWVVCYtWv-9waHcF2ptNn3YZjeuGYCvJtVjZpMP_Pft_7BA&type=css&k=ecd691e0c80070ef935d0e961272742f67437a3c&t=1681776733" />
    <link rel="stylesheet" type="text/css" href="https://insideobject.com/ind-script/optimizer_user.php?filename=tZRNbgMhDIX3M932HE5U5R6VegJgnMGKwQjDpLl9aVL1Z9uBHcboe9bTw-AlIKCbq2JWYDojG3t4ORwhVcvkZl8Cgy44L6i0RtALxeMJnCoEWSojWDF5gWumgq_GXcyKT637DP9Fs7lJLWCNkrvrOAlBYmfo46IzFN3UCpwqDQIXES6UBtE98ih0yi0sbpTfyawUTcFRrhs7iGxrKd2j_Q2X93GG8Ciz2zO3D72cWSRD4tpS0aop40Z4_TkNmrw1MO9j_1qrXzKhtg-vXtKbp5Qorr0FnMStMUhi2ul7kIxxuz00eiztv0DVT9oH&type=css&k=2ac0432e370996de85bc64830c9b818c88b32f75&t=1678165953&user=T" />
    <link rel="canonical" href="https://insideobject.com/board/product/write.html" />
    <link rel="alternate" href="https://m.insideobject.com/board/product/write.html" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/layout/user/btn-bootstrap.css" />
    <style text="text/css">
        .companyInfo {
            margin-top: 20px;
            display: flex;
            align-items: center;
            justify-content: flex-start; /* 왼쪽 정렬 */
            margin-bottom: 20px;
            padding: 10px;
            border: 1px solid #ddd; /* 칸을 구분하는 테두리 추가 */
            border-radius: 5px;
        }
        .companyInfo img {
            max-width: 100px; /* 이미지 최대 너비 설정 */
            height: auto;
            margin-right: 20px; /* 이미지와 텍스트 사이 간격 */
        }
        .companyInfo p {
            font-size: 3.0em; /* 기업명 텍스트 크기 설정 */
            margin: 0; /* 텍스트 주위의 기본 마진 제거 */
        }
    </style>
</head>
<body>
    <div id="__next" data-reactroot="">
        <jsp:include page="/WEB-INF/views/assets/layout/admin/header.jsp" />
        <main class="JobsFeed_Jobsfeed__DpeV9">
            <section class="Section_Section__P1hhc">
                <div>
                    <hr class="layout"/>
                    <div id="container">
                        <div id="contents">
                            <div class="companyInfo">
                                <img src="<c:url value='/assets/images/company/logo/${review.logo}' />" alt="${review.companyName}" />
                                <p>${review.companyName}</p>
                            </div>
                           <form id="frmWrite" name="frmWrite" action="${pageContext.request.contextPath}/manage/review/updateReview.do" method="post">
    <input type="hidden" name="reviewNum" value="${review.reviewNum}">
    <div class="ec-base-table typeWrite">
        <table border="1" summary="">
            <caption>글쓰기 폼</caption>
            <colgroup>
                <col style="width:130px;"/>
                <col style="width:auto;"/>
            </colgroup>
            <tbody>
                <tr>
                    <th scope="row">제목</th>
                    <td>
                        <input id="title" name="title" class="inputTypeText" placeholder="제목을 입력하세요" value="${review.title}" maxLength="125" type="text" required />
                    </td>
                </tr>
                <tr>
                    <td colspan="2" class="clear">
                        <link rel="stylesheet" href="https://img.echosting.cafe24.com/editors/froala/3.2.2/css/froala_editor.pkgd.min.css">
                        <script type="text/javascript" src="https://img.echosting.cafe24.com/editors/froala/3.2.2/js/froala_editor.pkgd.min.js"></script>
                        <textarea name="content" id="content" style="width: 100%; height: 400px;">${review.content}</textarea>
                        <script>
                            new FroalaEditor('#content', {
                                heightMin: 300,
                                language: 'ko'
                            });
                        </script>
                    </td>
                </tr>
            </tbody>
        </table>
    </div>
    <div class="ec-base-button">
        <input type="button" class="btnSubmitFix sizeS" id="btnDelete" style="float: left" value="삭제"/>
        <span class="gRight">
            <input type="submit" class="btnSubmitFix sizeS" id="btnWrite" value="수정"/>
            <a href="${pageContext.request.contextPath}/manage/review/review.do" class="btnBasicFix sizeS">취소</a>
        </span>
    </div>
</form>
                        </div>
                    </div>
                </div>
            </section>
        </main>
    </div>

    <script type="text/javascript">
        $(document).ready(function() {
            $('#btnDelete').click(function() {
                if(confirm('정말 삭제하시겠습니까?')) {
                    $.post('${pageContext.request.contextPath}/manage/review/deleteReview.do', {
                        reviewNum: ${review.reviewNum}
                    }, function(response) {
                        window.location.href = '${pageContext.request.contextPath}/manage/review/review.do';
                    });
                }
            });
        });
    </script>
</body>
</html>

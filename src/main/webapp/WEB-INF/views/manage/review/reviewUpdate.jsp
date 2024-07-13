<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>



 <link rel="stylesheet" type="text/css" href="https://img.echosting.cafe24.com/editors/froala/css/froala_style_ec.min.css?vs=2404180600" charset="UTF-8"/>
<link rel="stylesheet" type="text/css" href="https://insideobject.com/ind-script/optimizer.php?filename=nZExDgIxDAT7KC3vsOAJPIEfOMFwJxJv5DgS_J6jggYJ0o52doulBVVofzBqhqtxJZOOYVko904Xgzpl1AqNG9jRL3nJoaMMX6Eh4T4pDvfZ0cIPsTnVORWZVNFCWVVCYtWv-9waHcF2ptNn3YZjeuGYCvJtVjZpMP_Pft_7BA&type=css&k=ecd691e0c80070ef935d0e961272742f67437a3c&t=1681776733" />
<link rel="stylesheet" type="text/css" href="http://localhost/recruit-app/assets/css/manage/notice/optimizer_user.css" />
<jsp:include page="../../assets/layout/admin/lib.jsp" />
<!-- summernote -->
    <script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
    <link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.js"></script>
<!-- summernote -->


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
    
    <script type="text/javascript">
	$(function(){
    	$("#review_menu").addClass("bg-gradient-primary");
	});
</script>


</head>
<body>
    <jsp:include page="../../assets/layout/admin/header.jsp" />
    <main class="main-content position-relative max-height-vh-100 h-100 border-radius-lg ps ps--active-y">
        <nav class="navbar navbar-main navbar-expand-lg px-0 mx-4 shadow-none border-radius-xl" id="navbarBlur" data-scroll="true">
            <div class="container-fluid py-1 px-3">
                <nav aria-label="breadcrumb">
                    <ol class="breadcrumb bg-transparent mb-0 pb-0 pt-1 px-0 me-sm-6 me-5">
                        <li class="breadcrumb-item text-sm"><a class="opacity-5 text-dark" href="javascript:;">
                            관리자 기능</a></li>
                        <li class="breadcrumb-item text-sm text-dark active" aria-current="page">리뷰 관리</li>
                    </ol>
                    <h6 class="font-weight-bolder mb-0">리뷰 관리</h6>
                </nav>
            </div>
        </nav>

        <div class="container-fluid">
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
                                            <input id="title" name="title" class="inputTypeText" placeholder="제목을 입력하세요" value="${review.title}" maxLength="125" type="text" required style="width: 350px; height: 30px"/>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td colspan="2" class="clear">
                                            <textarea name="content" id="content" style="width: 100%; height: 400px;">${review.content}</textarea>
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                        <div class="ec-base-button">
                            <input type="button" class="btn btn-outline-danger btn-sm" id="btnDelete" style="float: left" value="삭제"/>
                            <span class="gRight">
                                <input type="submit" class="btn btn-outline-warning btn-sm" id="btnWrite" value="수정"/>
                                
                                <input type="button" value="취소" class="btn btn-outline-dark btn-sm detail-control" id="btnCancel" 
                                name="btnCancel" onclick="location.href='${pageContext.request.contextPath}/manage/review/review.do'"/>
                            </span>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </main>

 <script src="https://code.jquery.com/jquery-3.7.1.min.js"></script> 
<script src="https://code.jquery.com/ui/1.13.3/jquery-ui.js"></script>
<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.js"></script>
<script type="text/javascript">
    $(document).ready(function() {
        $('#btnDelete').click(function() {
            if(confirm('정말 삭제하시겠습니까?')) {
                $.post('${pageContext.request.contextPath}/manage/review/deleteReview.do', {
                    reviewNum: ${review.reviewNum}
                }, function(response) {
                    if(response.success) {
                        window.location.href = '${pageContext.request.contextPath}/manage/review/review.do';
                    } else {
                        alert('삭제에 실패했습니다: ' + (response.error || 'Unknown error'));
                    }
                }, 'json');
            }
        });

        $('#content').summernote({
            placeholder: '내용을 입력하세요',
            tabsize: 2,
            height: 400,
            toolbar: [
                ['style', ['style']],
                ['font', ['bold', 'underline', 'clear']],
                ['color', ['color']],
                ['para', ['ul', 'ol', 'paragraph']],
                ['table', ['table']],
                ['insert', ['link', 'picture', 'video']],
                ['view', ['fullscreen', 'codeview', 'help']]
            ],
            callbacks: {
                onChange: function(contents, $editable) {
                    $(this).val($(this).summernote('isEmpty') ? "" : contents);
                }
            }
        });
    });
</script>
</body>



</html>

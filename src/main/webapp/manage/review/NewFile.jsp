<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" info=""%>
<!DOCTYPE html>
<html>
<head>
<jsp:include page="../../assets/layout/admin/lib.jsp" />
<script type="text/javascript">
    $(function(){
        $("#review_menu").addClass("bg-gradient-primary");

        // 삭제 버튼 클릭 이벤트 핸들러
        $("#btnDelete").click(function(){
            if(confirm("정말 삭제하시겠습니까?")) {
                $("#frmWrite").attr("action", "/recruit-app/manage/review/deleteReview.do");
                $("#frmWrite").submit();
            }
        });

        // 수정 버튼 클릭 이벤트 핸들러
        $("#frmWrite").submit(function(){
            $("#frmWrite").attr("action", "/recruit-app/manage/review/updateReview.do");
        });
    });
</script>
<!-- golgolz start -->
<link rel="stylesheet" type="text/css" href="https://img.echosting.cafe24.com/editors/froala/css/froala_style_ec.min.css?vs=2404251303" charset="utf-8"/>
<link rel="stylesheet" type="text/css" href="https://insideobject.com/ind-script/optimizer.php?filename=nZExDgIxDAT7KC3vsOAJPIEfOMFwJxJv5DgS_J6jggYJ0o52doulBVVofzBqhqtxJZOOYVko904Xgzpl1AqNG9jRL3nJoaMMX6Eh4T4pDvfZ0cIPsTnVORWZVNFCWVVCYtWv-9waHcF2ptNn3YZjeuGYCvJtVjZpMP_Pft_7BA&type=css&k=ecd691e0c80070ef935d0e961272742f67437a3c&t=1681776733"  />
<link rel="stylesheet" type="text/css" href="https://insideobject.com/ind-script/optimizer_user.php?filename=tZRNbgMhDIX3M932HE5U5R6VegJgnMGKwQjDpLl9aVL1Z9uBHcboe9bTw-AlIKCbq2JWYDojG3t4ORwhVcvkZl8Cgy44L6i0RtALxeMJnCoEWSojWDF5gWumgq_GXcyKT637DP9Fs7lJLWCNkrvrOAlBYmfo46IzFN3UCpwqDQIXES6UBtE98ih0yi0sbpTfyawUTcFRrhs7iGxrKd2j_Q2X93GG8Ciz2zO3D72cWSRD4tpS0aop40Z4_TkNmrw1MO9j_1qrXzKhtg-vXtKbp5Qorr0FnMStMUhi2ul7kIxxuz00eiztv0DVT9oH&type=css&k=2ac0432e370996de85bc64830c9b818c88b32f75&t=1678165953&user=T"  />

<link rel="canonical" href="https://insideobject.com/board/product/write.html" />
<link rel="alternate" href="https://m.insideobject.com/board/product/write.html" />
<!-- golgolz end -->
</head>
<body>
    <jsp:include page="../../assets/layout/admin/header.jsp" />
    <main class="main-content position-relative max-height-vh-100 h-100 border-radius-lg ps ps--active-y">
        <nav class="navbar navbar-main navbar-expand-lg px-0 mx-4 shadow-none border-radius-xl" id="navbarBlur" data-scroll="true">
            <div class="container-fluid py-1 px-3">
                <nav aria-label="breadcrumb">
                    <ol class="breadcrumb bg-transparent mb-0 pb-0 pt-1 px-0 me-sm-6 me-5">
                        <li class="breadcrumb-item text-sm"><a class="opacity-5 text-dark" href="javascript:;">관리자 기능</a></li>
                        <!-- 하단의 대시보드 텍스트를 본인 기능으로 변경 필요  -->
                        <li class="breadcrumb-item text-sm text-dark active" aria-current="page">리뷰 관리</li>
                    </ol>
                    <h5 class="font-weight-bolder mb-0">리뷰 관리</h5>
                </nav>
            </div>
        </nav>
    
        <section class="Section_Section__P1hhc">
            <!-- golgolz start -->
            <div>
                <hr class="layout"/>
                <div id="container">
                    <div id="contents">
                        <form id="frmWrite" name="frmWrite" method="post" target="_self">
                            <input type="hidden" name="reviewNum" value="${review.reviewNum}"/>
                            <div class="xans-element- xans-board xans-board-write-4 xans-board-write xans-board-4">
                                <div class="ec-base-box typeProduct">
                                    <p class="thumbnail">
                                        <a href="">
                                            <img id="iPrdIm" src="http://localhost/assets/images/goods/${review.logo}" onerror="this.src='//img.echosting.cafe24.com/thumb/75x75.gif'" alt=""/>
                                        </a>
                                    </p>
                                    <div class="information" style="padding-left:30px">
                                        <h3>
                                            <a href="#void" id="aPrdNameLink"><span id="sPrdName">${review.companyName}</span></a>
                                        </h3>
                                    </div>
                                </div>
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
                                                <td><input id="title" name="title" fw-filter="isFill" fw-label="제목" fw-msg="" class="inputTypeText" placeholder="" value="${review.title}" maxLength="125" type="text" /></td>
                                            </tr>
                                            <tr>
                                                <td colspan="2" class="clear">
                                                    <!-- CSS -->
                                                    <link rel="stylesheet" href="https://img.echosting.cafe24.com/editors/froala/3.2.2/css/froala_editor.pkgd.min.css?vs=2404180600">
                                                    <link rel="stylesheet" href="https://img.echosting.cafe24.com/editors/froala/css/themes/ec_froala.css?vs=2404180600">
                                                    <!-- HTML -->
                                                    <textarea style="width: 100%;" name="content" id="content" class="ec-fr-never-be-duplicated">${review.content}</textarea>
                                                    <input type="hidden" id="content_hidden" fw-filter="isSimplexEditorFill" fw-label="내용" value="EC_FROALA_INSTANCE" />
                                                    <!-- JavaScript -->
                                                    <script type="text/javascript" src="https://img.echosting.cafe24.com/editors/froala/js/polyfill.min.js?vs=2404180600"></script>
                                                    <script type="text/javascript" src="https://img.echosting.cafe24.com/editors/froala/3.2.2/js/froala_editor.pkgd.min.js?vs=2404180600"></script>
                                                    <script type="text/javascript" src="https://img.echosting.cafe24.com/editors/froala/js/i18n/ko_KR.js?vs=2404180600"></script>
                                                    <script>
                                                        if (FroalaEditor.PLUGINS && FroalaEditor.PLUGINS.url) delete FroalaEditor.PLUGINS.url;
                                                    </script>
                                                    <!-- Run Froala Script -->
                                                    <script>
                                                        var EC_FROALA_ID = null;
                                                        var EC_FROALA_INSTANCE = null;
                                                        var fScrollPosition = 0;
                                                        var iCheckedImageListCount  = 0;
                                                        var aCheckedImageList = [];
                                                        var aInsertedImageList = [];
                                                        var isBeforeImageRemove = false;

                                                        (function() {
                                                            var d = "";
                                                            try {
                                                                var o = {"key":"DUA2yF3G1E1A5A2A2pZGCTRSAPJWTLPLZHTQQe1JGZxC4B3A3E2B5A1E1E4I1C2==","toolbarSticky":false,"theme":"ec-froala","attribution":false,"htmlRemoveTags":["script"],"htmlAllowedEmptyTags":["*"],"iframe":true,"iframeStyle":".fr-view{font-size: 12px;}","iframeStyleFiles":["\/\/img.echosting.cafe24.com\/editors\/froala\/css\/froala_style.min.css?vs=2404171300"],"heightMin":400,"language":"ko_KR","paragraphFormatSelection":true,"fontFamilySelection":true,"fontSize":["8","9","10","12","14","16","18","20","22","24","26","28","30"],"fontSizeSelection":true,"linkInsertButtons":["linkBack"],"quickInsertButtons":["ul","ol","hr"],"codeMirror":false,"entities":"&#60;&#62;","imageEditButtons":["imageAlign","imageRemove","|","imageLink","linkOpen","linkEdit","linkRemove","-","imageDisplay","imageStyle","imageAlt","imageSize"],"tableEditButtons":[],"tableInsertHelper":false,"imageDefaultMargin":0,"imageDefaultWidth":0,"imageUpload":false,"imageInsertButtons":["imageUpload"],"imageMaxSize":5242880,"filesManagerMaxSize":5242880,"toolbarButtons":{"moreText":{"buttons":["paragraphFormat","fontFamily","fontSize","bold","italic","underline","strikeThrough","textColor","backgroundColor","subscript","superscript","clearFormatting"],"buttonsVisible":5},"moreParagraph":{"buttons":["formatOL","formatUL","alignLeft","alignCenter","alignRight","outdent","indent","alignJustify","lineHeight"],"buttonsVisible":5},"moreRich":{"buttons":["insertTable","insertHR","emoticons","specialCharacters"],"buttonsVisible":0},"moreMisc":{"buttons":["undo","redo","fullscreen","html","print","spellChecker","selectAll"],"align":"right","buttonsVisible":2}},"toolbarButtonsSM":{"moreText":{"buttons":["paragraphFormat","fontFamily","fontSize","bold","italic","underline","strikeThrough","textColor","backgroundColor","subscript","superscript","clearFormatting"],"buttonsVisible":4},"moreParagraph":{"buttons":["formatOL","formatUL","alignLeft","alignCenter","alignRight","outdent","indent","alignJustify","lineHeight"],"buttonsVisible":2},"moreRich":{"buttons":["insertTable","insertHR","emoticons","specialCharacters"],"buttonsVisible":0},"moreMisc":{"buttons":["undo","redo","fullscreen","html","print","spellChecker","selectAll"],"align":"right","buttonsVisible":2}},"toolbarButtonsXS":{"moreText":{"buttons":["paragraphFormat","textColor","backgroundColor","bold","italic","underline","strikeThrough"],"buttonsVisible":1},"moreParagraph":{"buttons":["formatOL","formatUL","alignLeft","alignCenter","alignRight"],"buttonsVisible":0},"moreRich":{"buttons":["insertLink"]},"moreMisc":{"buttons":["undo","redo","html"],"buttonsVisible":0,"align":"right"}},"htmlDoNotWrapTags":["script","style","meta","link"],"htmlAllowedStyleProps":[".*"],"htmlAllowedTags":[".*"],"htmlAllowedAttrs":[".*"],"fontFamily":{"Dotum,sans-serif":"Dotum","Gulim,sans-serif":"Gulim","Batang,sans-serif":"Batang","Gungsuh,sans-serif":"Gungsuh","Arial,Helvetica,sans-serif":"Arial","Tahoma,Geneva,sans-serif":"Tahoma","Verdana,Geneva,sans-serif":"Verdana","Fixedsys,sans-serif":"Fixedsys","'Times New Roman',Times,serif":"Times New Roman","helvetica,sans-serif":"Helvetica","sans-serif":"Sans-serif","palatino,sans-serif":"Palatino","'Comic Sans MS',sans-serif":"Comic Sans MS","sand,sans-serif":"Sand","'Courier New',sans-serif":"Courier New","courier,sans-serif":"Courier","monospace,sans-serif":"Monospace","Georgia,serif":"Georgia","SimSun,sans-serif":"SimSun","SimHei,sans-serif":"SimHei","'MS PGothic',sans-serif":"MS PGothic","'MS PMincho',sans-serif":"MS PMincho","'MS UI PGothic',sans-serif":"MS UI PGothic","Meiryo,sans-serif":"Meiryo"},"colorsText":["#FF0000","#FF6C00","#FFAA00","#FFEF00","#A6CF00","#009E25","#00B0A2","#0075C8","#3A32C3","#7820B9","#EF007C","#000000","#252525","#464646","#636363","#7D7D7D","#9A9A9A","#FFE8E8","#F7E2D2","#F5EDDC","#F5F4E0","#EDF2C2","#DEF7E5","#D9EEEC","#C9E0F0","#D6D4EB","#E7DBED","#F1E2EA","#ACACAC","#C2C2C2","#CCCCCC","#E1E1E1","#EBEBEB","#FFFFFF","#E97D81","#E19B73","#D1B274","#CFCCA2","#61B977","#53AEA8","#518FBB","#6A65BB","#9A54CE","#E573AE","#5A504B","#767B86","#951015","#6E391A","#785C25","#5F5B25","#4C511F","#1C4827","#0D514C","#1B496A","#2B285F","#45245B","#721947","#352E2C","#3C3F45"],"colorsBackground":["#FF0000","#FF6C00","#FFAA00","#FFEF00","#A6CF00","#009E25","#00B0A2","#0075C8","#3A32C3","#7820B9","#EF007C","#000000","#252525","#464646","#636363","#7D7D7D","#9A9A9A","#FFE8E8","#F7E2D2","#F5EDDC","#F5F4E0","#EDF2C2","#DEF7E5","#D9EEEC","#C9E0F0","#D6D4EB","#E7DBED","#F1E2EA","#ACACAC","#C2C2C2","#CCCCCC","#E1E1E1","#EBEBEB","#FFFFFF","#E97D81","#E19B73","#D1B274","#CFCCA2","#61B977","#53AEA8","#518FBB","#6A65BB","#9A54CE","#E573AE","#5A504B","#767B86","#951015","#6E391A","#785C25","#5F5B25","#4C511F","#1C4827","#0D514C","#1B496A","#2B285F","#45245B","#721947","#352E2C","#3C3F45"],"docId":"content"};
                                                                EC_FROALA_INSTANCE = new FroalaEditor("textarea#content.ec-fr-never-be-duplicated", o, function() {
                                                                    EC_FROALA_ID = this.id;
                                                                    if (d != "") {
                                                                        this.el.innerHTML = this.clean.html(d);
                                                                        this.undo.saveStep();
                                                                    }
                                                                    var script = document.createElement("script");
                                                                    script.src = "//img.echosting.cafe24.com/editors/froala/js/polyfill.min.js?vs=2404171300";
                                                                    this.$iframe.get(0).contentWindow.document.head.appendChild(script);
                                                                    if (this.el.innerHTML === "<br>") {
                                                                        this.el.innerHTML = "<p><br></p>";
                                                                    }
                                                                });

                                                                EC_FROALA_INSTANCE.$iframe[0].setAttribute("id", "content" + "_IFRAME");
                                                                EC_FROALA_INSTANCE.$iframe[0].contentWindow.document.body.setAttribute("id", "content" + "_BODY");

                                                                EC_FROALA_INSTANCE.isEmptyContent = function () {
                                                                    var c = getContentFromFroala(this.id);
                                                                    var val = c.replace(/\<br\/?\>|\<\/?p\>|\s|&nbsp;/gi, "");
                                                                    if ("" == val) return true;
                                                                    return false;
                                                                };

                                                                EC_FROALA_INSTANCE.getContentFromFroala = function() {
                                                                    return getContentFromFroala(this.id);
                                                                };

                                                                EC_FROALA_INSTANCE.applyContentToFroala = function(content) {
                                                                    return applyContentToFroala(content, this.id);
                                                                };

                                                                EC_FROALA_INSTANCE.setValueBeforeSubmit = function(sSection) {
                                                                    return setValueBeforeSubmit(sSection, this.id);
                                                                };

                                                                if (typeof $Editor ===  "undefined") {
                                                                    $Editor = {};
                                                                }
                                                                $Editor["content"] = EC_FROALA_INSTANCE;
                                                            } catch (e) {
                                                                document.getElementById("content").value = d;
                                                                console.error(e);
                                                            }
                                                        })();
                                                    </script>
                                                </td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </div>
                                <div class="ec-base-button">
                                    <input type="button" class="btn btn-outline-danger btn-sm" id="btnDelete" style="float: left" value="삭제"/>
                                    <span class="gRight">
                                        <input type="submit" class="btn btn-outline-warning btn-sm" value="수정"/>
                                        <a href="/board/review/4/" class="btn btn-outline-dark btn-sm detail-controlS">취소</a>
                                    </span>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
            <!-- golgolz end -->
        </section>
    </main>
</body>
</html>

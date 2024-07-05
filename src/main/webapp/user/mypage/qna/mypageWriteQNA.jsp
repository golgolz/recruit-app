<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" info=""%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<jsp:include page="../../../assets/layout/user/lib.jsp" />  
	<!-- golgolz start -->
	<link href="https://i.jobkorea.kr/content/css/ver_2/mtc/mtc_lounge-sv-202402231655.css" rel="stylesheet" type="text/css" />
	<link href="https://i.jobkorea.kr/content/css/ver_2/help/help-sv-202402231655.css" rel="stylesheet" type="text/css" />
	<!-- 파비콘 -->
    <link rel="shortcut icon" href="https://static.wanted.co.kr/favicon/new/favicon.ico"/>
    <link rel="stylesheet" href="https://asset.wanted.co.kr/userweb/www/_next/static/css/c76e012c05e1318d.css" crossorigin="anonymous" data-n-g=""/>
	<link rel="stylesheet" href="http://localhost/recruit-app/assets/css/mypage.css"/>
	<link rel="stylesheet" href="http://localhost/recruit-app/assets/css/signup.css"/>
	<!-- bootstrap -->
	<link rel="stylesheet" href="http://localhost/recruit-app/assets/css/layout/user/btn-bootstrap.css" />
	<!-- bootstrap -->
	
	<!-- golgolz end -->
    </style>
	<style type="text/css">
		<!-- golgolz start -->
		
		<!-- golgolz end -->
	</style>
	<script type="text/javascript">
		$(function(){
			<!-- golgolz start -->
			<!-- golgolz end -->
		});
	</script>
</head>
<body>
    <div id="__next" data-reactroot="">
		<jsp:include page="../../../assets/layout/user/header.jsp" />
		<main class="JobsFeed_Jobsfeed__DpeV9">  
		<section class="Section_Section__P1hhc">
        <div class="MainLayout_MainLayout__root__p6itg">
          <div class="Grid_Grid__container__J9CcC Grid_Grid__spacing__5__ZwgDV">
          <jsp:include page="../mypage_layout.jsp"/>
          <div class="Grid_Grid__item__FUkSS Grid_Grid__justify_center__QJu2X Grid_Grid__align-items_flex-start__PA0JE Grid_Grid__grid__xs__12__rVqKh Grid_Grid__grid__md__6__9g_JE" style="margin-left:30px">
		  <!-- golgolz start -->
          
		    <div style="margin:30px auto 0; width:731px">
			<div class="loungeContent inquiryContent inquiryContent--selection">
		        <div class="topHdWrap">
		           <h1 style="font-size: 25px;"><strong>문의</strong></h1>
		        </div>
		        <!--// 문의하기 -->
		        <div class="inquiryFormWrap">
				<!--// tap menu -->
				<div class="mtcTplTab">
					<ul class="tabItems">
						<li class="on"><a href="mypageWriteQNA.jsp">문의</a></li>
						<li class=""><a href="http://localhost/recruit-app/user/mypage/qna/mypageQNAList.do">문의 내역</a></li>
					</ul>
				</div>
			<!-- tap menu //-->
		    <div class="inquiryForm inquiryForm--selection">
		       <form action="${pageContext.request.contextPath}/user/mypage/qna/mypageQNAList.do" method="post" id="Qnaform">
		          <!-- <input name="__RequestVerificationToken" type="hidden" value="u-pKXJVgM8PjAvtSkvCZ7ESdn7cq1LeUJ_qATcucklnoQplh8nDe7kWvaHm8qc6dJn7DrmDcOMl7MbFsxmCo9wazb4VtlDFSbBX9Mvds3N01" />
		          <input type="hidden" name="giNo" value="0" />
		          <input type="hidden" name="coMemId" />
		          <input type="hidden" name="coMemType" />
		          <input type="hidden" name="Category" id="Category" value="-1" />
		          <input type="hidden" name="IsAgree" id="IsAgree" value="false" /> -->
		       <fieldset>
		       <legend>문의하기 입력</legend>
			    <div class="tbInquiryBx">
			    <div class="tbRow">
			    <div class="tbCell tbTh">
			    문의종류 <em>(필수)</em>
			    </div>
			    <div class="tbCell">
			    <!-- <div class="mtcSltBx listLenSel"> -->
			    <div >
			    <label for="lb_view_1" id="lb_type"></label>
				    <select style="width:180px; height:35px" id="category" name="category">
				          <option value="">선택</option>
				          <option value="서비스 문의">서비스 문의</option>
				          <option value="오류신고" >오류 신고</option>
				          <option value="제안사항">제안 사항</option>
				     </select>
			       </div>
			       </div>
			       </div>
			       <div class="tbRow">
			                            
			       <div class="tbCell tbTh">
			         <label for="lb_inq_1">제목 <em>(필수)</em></label>
			       </div>
			       <!-- <div class="tbCell"> -->
			       <div class="tbCell">
			         <textarea name="title" id="lb_inq_2" title="제목을 입력하세요." style="height:35px; width:400px ;font-size:15px" value="${qna.title}"></textarea>
			         <!-- <textarea name="contents" id="lb_inq_2" title="내용을 입력하세요." class="txArea" style="height:45px"></textarea> -->
			       </div>
			       </div>
			       <div class="tbRow">
			       <div class="tbCell tbTh">
			           <label for="lb_inq_2">내용 <em>(필수)</em></label>
			       </div>
<!-- 			       <div class="tbCell">
			       <textarea name="contents" id="lb_inq_2" title="내용을 입력하세요." class="txArea"></textarea> -->
			       <div>
			       <textarea name="content" value="${qna.content}" id="lb_inq_2" title="내용을 입력하세요." style="height:350px; width:400px"></textarea>
			       </div>
			       </div>
			       
			       <!-- <div class="tbCell tbTh">
			         <label for="lb_inq_2">답변 email <em>(필수)</em></label><br/>
			         <textarea name="email"  title="내용을 입력하세요." style="height:45px; width:400px"></textarea>
			       </div> -->
			       
			       <div class="tbRow">
			       <!-- <div class="tbRow tbMail"> -->
			         <div class="tbCell tbTh">
                                    <label for="lb_inq_4">답변 e-메일 <em>(필수)</em></label>
                                </div>
                                <div class="tbCell">
                         	        <textarea name="email"  title="내용을 입력하세요." style="height:35px; width:400px" class="vertical-center-textarea" readonly="readonly"></textarea>
                                    <!-- <input type="text" id="lb_inq_4" name="emailName" class="mtcIpt" title="이메일 주소 앞부분" /> -->
			      <!-- <div class="tbCell__dropdown">
			         <select name="" id="lb_view_2" title="이메일 사업자 입력">
			             <option value="">직접입력</option>
			             <option value="naver.com">naver.com</option>
			             <option value="hanmail.net">hanmail.net</option>
			             <option value="nate.com">nate.com</option>
			             <option value="daum.net">daum.net</option>
			             <option value="gmail.com">gmail.com</option>
			          </select>
			      </div> -->
			    <!--  </div> -->
			     </div>
			     </div>
			      <div id="privacyBx1" class="privacyBx" >
			      <div class="mtcChk-Bx privacyBx__check-box" >
			        <input type="checkbox" id="lb_agree" name="" value="" />
			            <label for="lb_agree" class="bxIpt privacyBx__title">개인정보 수집 및 이용에 동의합니다.</label>
			      </div>
			       <dl>
			       <dt class="privacyBx__title" for="lb_agree"></dt>
			       <dd class="privacyBx__info">
			       <span class="privacyBx__info privacyBx__info--black">
			         문의에 대한 처리 및 답변을 위해 아이디, e-메일 정보가 수집
			      </span>되며, 수집된 정보는
			      <span class="privacyBx__info privacyBx__info--black">
			      3년간 보관</span>합니다.<br>회원님은 동의를 거부할 수 있으며, 거부 시 응대지원이 원활하지 않을 수 있습니다.</dd> </dl>
			      </div>
			      <div class="inquiryBtn" style="margin-bottom:30px">
			       <!--   <button type="submit" class="btnInq"><span>문의하기</span></button> -->
			         <button type="button" class="btnInq"><span>문의하기</span></button>
			         <button type="button" class="btnInq btnCancel"><span>취소</span></button>
			      </div>
			      </fieldset>
			      </form>
			      </div>
			      </div>
			</div>
	          
		  <!-- golgolz end -->
          </div>
        </div>
			</section>
			<jsp:include page="../../../assets/layout/user/footer.jsp" />
		</main>
	</div>
</body>
</html>
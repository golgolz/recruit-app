<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    info=""%>
<!DOCTYPE html>
<html>
<head>
	<jsp:include page="../../assets/layout/user/lib.jsp" />  
	<!-- golgolz start -->
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"></script>
	<!-- 파비콘 -->
    <link rel="shortcut icon" href="https://static.wanted.co.kr/favicon/new/favicon.ico"/>
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous">
    <link rel="stylesheet" href="https://asset.wanted.co.kr/userweb/www/_next/static/css/c76e012c05e1318d.css" crossorigin="anonymous" data-n-g=""/>
	<link rel="stylesheet" href="http://localhost/recruit-app/assets/css/mypage.css"/>
	<link rel="stylesheet" href="http://localhost/recruit-app/assets/css/signup.css"/>
	<link rel="stylesheet" href="http://localhost/recruit-app/assets/css/layout/user/btn-bootstrap.css" />
	<!-- golgolz end -->
<style>
	@media (max-width: 767px) {
    .css-9dug5j {
        min-width: auto;
    }
    .css-j2itip {
        display: flex;
        flex-direction: column;
        align-items: flex-end;
	    }
	}
	.css-j2itip {
	    color: rgb(23, 23, 25);
	    font-weight: var(--text-weight-body-normal);
	    text-align: left;
	    letter-spacing: var(--text-spacing-body);
	    font-size: var(--text-size-body);
	    line-height: var(--text-height-body);
	    flex: 1 1 0%;
	    margin-right: 15px;
	    word-break: break-all;
	}
	.css-15hfbq8:not(:first-child) {
	    border-top: 1px solid rgba(112, 115, 124, 0.22);
	}
	.css-15hfbq8 {
	    display: flex;
	    -webkit-box-align: center;
	    align-items: center;
	    cursor: pointer;
	}
	.css-xr5rwo:not(:first-child) {
	    border-top: 1px solid rgba(112, 115, 124, 0.22);
	}
	.css-xr5rwo {
	    display: flex;
	    -webkit-box-align: center;
	    cursor: pointer;
	    align-items: flex-start;
	}
	#__next {
	    padding: 0;
	    margin: 0;
	    width: 100%;
	    height: 100%;
	    min-width: 320px;
	    text-rendering: optimizeLegibility;
	    word-break: keep-all;
	    overflow-wrap: anywhere;
	}
	body {
	background-color: #FFFFFF;
	}
	.css-1sbrczv {
		    width: 100%;
		    height: 48px;
		    min-height: 48px;
		    padding: 0px 16px;
		    outline: none;
		    background-color: transparent;
		    border: 1px solid rgba(112, 115, 124, 0.22);
		    color: #171719;
		    border-radius: 10px;
		    font-size: 15px;
		    font-weight: 400;
		}
    </style>
	<style type="text/css">
		<!-- golgolz start -->
		.button{
            width: 120px; height: 40px; border: 1px solid rgba(112, 115, 124, 0.22); border-radius: 10px;
            }
            .btn{
            width: 120px; height: 40px; font-size: 15px;
            }
            .modifyPassBtn{
            background-color: grey;
            color: #FFFFFF;
            }
            .modifyBtn{
            background-color: skyblue;
            color: #FFFFFF;
            }
            #modifyPassBtn:hover{
            	color: blue;
            }
            option{
				font-size: 15px;
			}
			body.modal-open {
		  		padding-right: 0 !important; /* !important를 사용하여 우선순위 높임 */
			}
		<!-- golgolz end -->
	</style>
	<script type="text/javascript">
		$(function(){
			<!-- golgolz start -->
			$('#modifyUser').click(function(){
      		  location.href = 'checkPass.jsp';
      	  	});//click
      	  
      	  	$('#cancleBtn').click(function(){
      	  	  alert('회원정보 변경이 취소 되었습니다.');
      	  	  location.href='mypageUserInfo.jsp';		
      	  	});//click	
      	  	
      	  	$('#modifyBtn').click(function(){
      	  	  alert('회원정보 수정이 완료 되었습니다.');
      	  	  location.href='mypageUserInfo.jsp';
      	  	});//click
      	  	
      	  	$('#modifyPassBtn').click(function(){
      	  		$("#securityQuestionModal").modal("show");
      	  	});//click
      	  	
	      	$("#confirmAnswer").click(function() {
	      	    const selectedQuestion = $("#questionSelect").val();
	      	    const answer = $("#answerInput").val();
	      	    
	      	    // 답변 유효성 검사 (필요한 경우 추가)
	
	      	    // 유효한 답변일 경우 처리 로직 추가
	      	    console.log("선택된 질문:", selectedQuestion);
	      	    console.log("답변:", answer);
	      	    
	      	    // 데이터베이스 조회 결과와 비교
	      	    var flag = false;
	      	    
	      	    // 필드 초기화 후 닫기
				$("#questionSelect").val('0');
				$("#answerInput").val('');
	      	    $("#securityQuestionModal").modal("hide");
	      	    
	      	    if(!flag){
	      	    	location.href='http://localhost/recruit-app/user/mypage/modifyPass.jsp';
	      	    }
	      	});//click
	      	
	      	$("#cancleModal").click(function(){
	      		$("#questionSelect").val('0');
				$("#answerInput").val('');
				$("#securityQuestionModal").modal("hide");
	      	});//click
	      	
	      	$('#securityQuestionModal').on('hidden.bs.modal', function () {
	      		$("#questionSelect").val('0');
				$("#answerInput").val('');
	    	});//click
			<!-- golgolz end -->
		});
	</script>
</head>
<body>
    <div id="__next" data-reactroot="">
		<jsp:include page="../../assets/layout/user/header.jsp" />
		<main class="JobsFeed_Jobsfeed__DpeV9">  
			<section class="Section_Section__P1hhc">
			<!-- golgolz start -->
        <div class="MainLayout_MainLayout__root__p6itg">
          <div class="Grid_Grid__container__J9CcC Grid_Grid__spacing__5__ZwgDV">
          <jsp:include page="mypage_layout.jsp"/>
            <div
              class="Grid_Grid__item__FUkSS Grid_Grid__align-items_flex-start__PA0JE Grid_Grid__grid__md__1__aOHPk MainLayout_MainLayout__space__8eQvZ"
            ></div>
            <div
              class="Grid_Grid__item__FUkSS Grid_Grid__justify_center__QJu2X Grid_Grid__align-items_flex-start__PA0JE Grid_Grid__grid__xs__12__rVqKh Grid_Grid__grid__md__6__9g_JE"
            >
              <div
                class="Grid_Grid__container__J9CcC Grid_Grid__direction_column__jR3AZ Grid_Grid__wrap_nowrap__4r_cp ProfileView_ProfileView__root__eOS_q"
              >
                <section
                  class="Grid_Grid__item__FUkSS Grid_Grid__align-items_flex-start__PA0JE"
                >
                  <div
                    class="Grid_Grid__container__J9CcC Grid_Grid__align-items_flex-start__PA0JE ProfileViewHeader_ProfileViewHeader__root__PjH6q"
                  >
                    <div
                      class="Grid_Grid__item__FUkSS Grid_Grid__align-items_flex-start__PA0JE Grid_Grid__align-self_stretch__awciG"
                    >
                      <div
                        class="Grid_Grid__container__J9CcC Grid_Grid__align-items_center__VEikH ProfileViewHeaderAvatar_ProfileViewHeaderAvatar__root__OR4Te"
                      	style="text-align: center;"
                      >
                        <div
                          class="Grid_Grid__item__FUkSS Grid_Grid__align-items_flex-start__PA0JE"
                          style="text-align: center;"
                        >
                          <div
                            class="Avatar_Avatar__root__5Xq6z Avatar_Avatar__sizeXlarge__cwS_g ProfileViewHeaderAvatar_ProfileViewHeaderAvatar__avatar__d0_38"
                          	style="text-align: center;"
                          >
                            <div class="Avatar_Avatar__bg__MRkK0" style="text-align: center;">
                              <img
                                alt="프로필 이미지"
                                src="http://localhost/recruit-app/assets/images/mypage/user_default.png"
                                class="Avatar_Avatar__img__kcubw"
                                style="text-align: center;"
                              />
                            </div>
                          </div>
                        </div>
                        <div
                          class="Grid_Grid__item__FUkSS Grid_Grid__align-items_flex-start__PA0JE ProfileViewHeaderAvatar_ProfileViewHeaderAvatar__info__dUe_s"
                        >
                          <h4
                            class="Typography_Typography__root__xYuMs Typography_Typography__heading1__bVyRs Typography_Typography__weightBold__e15ql Typography_Typography__noWrap__ovbzF Typography_Typography__alignLeft__fYbY6 ProfileViewHeaderAvatar_ProfileViewHeaderAvatar__info__title__KuxZF"
                          >
                            정명호
                          </h4>
                        </div>
                      </div>
                    </div>
                </section>
                <div class="Grid_Grid__container__J9CcC Grid_Grid__align-items_center__VEikH ProfileViewFollowerFollwingInfo_ProfileViewFollowerFollwingInfo__root__TSJnS" >
                </div>
                <section class="Grid_Grid__item__FUkSS Grid_Grid__align-items_flex-start__PA0JE ProfileView_ProfileView__borderSection__VkDe7" style="margin: 30px 0px 30px 0px;">
                  <h1 style="font-size: 25px;">회원정보 변경</h1>
                </section>
                <section
                  class="Grid_Grid__item__FUkSS Grid_Grid__align-items_flex-start__PA0JE" style="margin-bottom: 50px;"
                >
                  <article class="css-dnwsdj">
                  <div class="css-9as5im">
                  <p data-testid="Typography" color="#000000" class="css-dk1ca0">회원정보</p>
                  <p data-testid="Typography" color="rgba(55, 56, 60, 0.61)" class="css-1b12nwt">서비스에서 사용하는 내 정보를 변경할 수 있습니다.</p>
                  </div>
                  <ul class="css-14jv0iu">
                  <li data-list-type="EMAIL_CHANGE" tabindex="0" class="css-1f5onls">
                  <p data-testid="Typography" color="#000000" class="css-9dug5j">이메일</p>
                  <p style="padding-left: 15px; font-size: 15px;">jeong@gmail.com</p>
                  <input type="hidden" name="email" data-testid="Input_email"
					autocomplete="on" class="css-1sbrczv" value="jeong@gmail.com" readyonly>
                  </li>
                  <li data-list-type="NAME_CHANGE" tabindex="0" class="css-15hfbq8">
                  <p data-testid="Typography" color="#000000" class="css-9dug5j">이름</p>
                  <input type="name" placeholder="이름을 입력해주세요." name="name"
					autocomplete="on" class="css-1sbrczv" value="정명호">
                  </li>
                  <li data-list-type="NAME_CHANGE" tabindex="0" class="css-15hfbq8" style="height: 79px;">
                  <p data-testid="Typography" color="#000000" class="css-9dug5j">성별</p>
                  <p style="padding-left: 15px; font-size: 15px;">남자</p>
                  <input type="hidden" name="gender"
					autocomplete="on" class="css-1sbrczv" value="남자" readonly="readonly">
                  </li>
                  <li data-list-type="PHONE_CHANGE" tabindex="0" class="css-15hfbq8"><p data-testid="Typography" color="#000000" class="css-9dug5j">휴대폰 번호</p>
                  <input type="text" placeholder="휴대폰 번호를 입력해주세요." name="phone"
					autocomplete="on" class="css-1sbrczv" value="010-0000-0000">
                  </li>
                  <li data-list-type="PHONE_CHANGE" tabindex="0" class="css-15hfbq8"><p data-testid="Typography" color="#000000" class="css-9dug5j">전화번호</p>
                  <input type="text" placeholder="전화번호를 입력해주세요." name="tel"
					autocomplete="on" class="css-1sbrczv" value="032-000-0000">
                  </li>
                  <li data-list-type="SOCIAL_LINK" tabindex="0" class="css-15hfbq8"><p data-testid="Typography" color="#000000" class="css-9dug5j">주소</p>
                  <input type="text" placeholder="주소를 입력해주세요." name="addr"
					autocomplete="on" class="css-1sbrczv" value="인천시 부평구 부평동">
                  </li>
                  <li data-list-type="SOCIAL_LINK" tabindex="0" class="css-15hfbq8" style="height: 79px;">
                  <p data-testid="Typography" color="#000000" class="css-9dug5j" style="font-size: 15px;">
                  <button id="modifyPassBtn"><p>비밀번호 변경</p></button>
                  </p>
                  
                  </li>
                   <li data-list-type="SOCIAL_LINK" tabindex="0" style="text-align: center;">
                   <input type="button" id="modifyBtn" value="수정완료" class="btn btn-outline-warning btn-sm update-btn" style="margin: 5px;">
                   <input type="button" id="cancleBtn" value="취소" class="btn btn-outline-danger btn-sm remove-btn" style="margin: 5px;">
                   </li>
                  </ul></article>
				  
				  <!-- 모달 창 시작 -->
                  <div class="modal fade" id="securityQuestionModal" tabindex="-1" aria-labelledby="securityQuestionModalLabel" aria-hidden="true">
				  <div class="modal-dialog">
				    <div class="modal-content">
				      <div class="modal-header">
				        <h5 class="modal-title" id="securityQuestionModalLabel">보안 질문</h5>
				        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
				      </div>
				      <div class="modal-body">
				        <form id="securityQuestionForm">
				          <div class="mb-3">
				            <label for="questionSelect" class="form-label">질문 선택</label>
				            <select class="form-select" id="questionSelect" style="font-size: 15px;">
				              <option value="0">질문을 선택하세요</option>
							  <option value="1">당신이 가장 좋아하는 영화 이름은 무엇인가요?</option>
							  <option value="2">당신의 별명은 무엇인가요?</option>
							  <option value="3">가장 친한 친구 이름은 무엇인가요?</option>
							  <option value="4">당신이 태어난 도시 이름은 무엇인가요?</option>
							  <option value="5">당신이 가장 좋아하는 색깔은 무엇인가요?</option>
				            </select>
				          </div>
				          <div class="mb-3">
				            <label for="answerInput" class="form-label">답변</label>
				            <input type="text" class="form-control" id="answerInput" style="font-size: 15px;">
				          </div>
				        </form>
				      </div>
				      <div class="modal-footer">
				        <button type="button" class="btn btn-primary" id="confirmAnswer">확인</button>
				        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal" id="cancleModal">취소</button>
				      </div>
				    </div>
				  </div>
				</div>
				  <!-- 모달 창 끝 -->
                </section>
              </div>
            </div>
            <div
              class="Grid_Grid__item__FUkSS Grid_Grid__align-items_flex-start__PA0JE Grid_Grid__grid__md__1__aOHPk MainLayout_MainLayout__space__8eQvZ"
            ></div>
          </div>
        </div>
			<!-- golgolz end -->
			</section>
			<jsp:include page="../../assets/layout/user/footer.jsp" />
		</main>
	</div>
</body>
</html>
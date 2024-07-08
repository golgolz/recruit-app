<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    info=""%>
<!DOCTYPE html>
<html>
<head>
	<jsp:include page="../../assets/layout/user/lib.jsp" />  
	<!-- golgolz start -->
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    
    <!-- 파비콘 -->
    <link rel="shortcut icon" href="https://static.wanted.co.kr/favicon/new/favicon.ico"/>
    <link rel="stylesheet" href="https://asset.wanted.co.kr/userweb/www/_next/static/css/c76e012c05e1318d.css" crossorigin="anonymous" data-n-g=""/>
	<link rel="stylesheet" href="http://localhost/recruit-app/assets/css/mypage.css"/>
	<link rel="stylesheet" href="http://localhost/recruit-app/assets/css/signup.css"/>
	
	<!-- golgolz end -->
	<style type="text/css">
		<!-- golgolz start -->
		<!-- golgolz end -->
	</style>
	<script type="text/javascript">
		$(function(){
			<!-- golgolz start -->
			$("#modifyUser").click(function(){
      		  location.href = "http://localhost/recruit-app/user/mypage/checkPass.do";
      	  });
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
                      >
                        <div
                          class="Grid_Grid__item__FUkSS Grid_Grid__align-items_flex-start__PA0JE"
                        >
                          <div
                            class="Avatar_Avatar__root__5Xq6z Avatar_Avatar__sizeXlarge__cwS_g ProfileViewHeaderAvatar_ProfileViewHeaderAvatar__avatar__d0_38"
                          >
                            <div class="Avatar_Avatar__bg__MRkK0">
                              <img
                                alt="프로필 이미지"
                                src="http://localhost/recruit-app/assets/images/mypage/${ userInfo.profileImg }"
                                class="Avatar_Avatar__img__kcubw"
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
                            ${ userInfo.name }
                          </h4>
                        </div>
                      </div>
                    </div>
                </section>
                <div class="Grid_Grid__container__J9CcC Grid_Grid__align-items_center__VEikH ProfileViewFollowerFollwingInfo_ProfileViewFollowerFollwingInfo__root__TSJnS" >
                </div>
                <section class="" >
                  <div
                    class="Grid_Grid__container__J9CcC Grid_Grid__item__FUkSS Grid_Grid__align-items_center__VEikH ProfileViewHeaderActions_ProfileViewHeaderActions__root__MMI7E"
                  >
                  
                    <button id="modifyUser" class="Button_Button__root__V1ie3 Button_Button__outlined__H2mkd Button_Button__outlinedAssistive__mBcQK Button_Button__outlinedSizeMedium__k3ora ProfileViewHeaderActions_ProfileViewHeaderActions__btnSetting__5erq0">
                      <span class="Button_Button__label__1Kk0v">정보변경</span
                      ><span
                        class="Button_Button__interaction__kkYaa"
                      ></span></button>
                  </div>
                </section>
                <hr class="Divider_Divider__root__f2LD0 Divider_Divider__colorAlternative__nElS3"/>
                <section class="Grid_Grid__item__FUkSS Grid_Grid__align-items_flex-start__PA0JE ProfileView_ProfileView__borderSection__VkDe7" style="margin: 40px;">
                  <h1 style="font-size: 25px; text-align: center"><strong>${ userInfo.name }님, 환영해요.</strong></h1>
                </section>
                <section
                  class="Grid_Grid__item__FUkSS Grid_Grid__align-items_flex-start__PA0JE"
                >
                  <article class="css-dnwsdj">
                  <div class="css-9as5im">
                  <p data-testid="Typography" color="#000000" class="css-dk1ca0">사용자 정보</p>
                  <p data-testid="Typography" color="rgba(55, 56, 60, 0.61)" class="css-1b12nwt">서비스에서 사용하는 내 사용자 정보를 관리할 수 있습니다.</p>
                  </div>
                  <ul class="css-14jv0iu">
                  <li data-list-type="EMAIL_CHANGE" tabindex="0" class="css-1f5onls">
                  <p data-testid="Typography" color="#000000" class="css-9dug5j">이메일</p>
                  <p data-testid="Typography" color="#171719" class="css-j2itip">${ userInfo.userId }</p> </li>
                  <li data-list-type="NAME_CHANGE" tabindex="0" class="css-15hfbq8">
                  <p data-testid="Typography" color="#000000" class="css-9dug5j">이름</p>
                  <p data-testid="Typography" color="#171719" class="css-j2itip">${ userInfo.name }</p>
                  </li>
                  <li data-list-type="NAME_CHANGE" tabindex="0" class="css-15hfbq8">
                  <p data-testid="Typography" color="#000000" class="css-9dug5j">성별</p>
                  <p data-testid="Typography" color="#171719" class="css-j2itip">${ userInfo.gender }</p>
                  </li>
                  <li data-list-type="PHONE_CHANGE" tabindex="0" class="css-xr5rwo"><p color="#000000" class="css-9dug5j">휴대폰 번호</p>
                  <p data-testid="Typography" color="#171719" class="css-j2itip">${ userInfo.phone }</p>
                  </li>
                  <li data-list-type="PHONE_CHANGE" tabindex="0" class="css-xr5rwo"><p color="#000000" class="css-9dug5j">전화번호</p>
                  <p data-testid="Typography" color="#171719" class="css-j2itip">${ userInfo.tel }</p>
                  </li>
                  </ul></article>
                </section>
              </div>
            </div>
            <div class="Grid_Grid__item__FUkSS Grid_Grid__align-items_flex-start__PA0JE Grid_Grid__grid__md__1__aOHPk MainLayout_MainLayout__space__8eQvZ"></div>
          </div>
        </div>
			<!-- golgolz end -->
			</section>
			<jsp:include page="../../assets/layout/user/footer.jsp" />
		</main>
	</div>
</body>
</html>
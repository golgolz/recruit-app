<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    info=""%>
      <div
        role="presentation"
        class="NavBar_className__y2qGg"
        style="position: fixed"
      >
        <div class="NavBar_background__SQmnx"></div>
        <div class="MainBar_MainBar__40DX7" role="presentation">
          <nav class="MainBar_MainBarNav__pVhal">
            <div class="MainBar_MainBarNavLogo__caIek">
              <a
                href="http://localhost/recruit-app/main/main.do"
                aria-label="Wanted"
                data-attribute-id="gnb"
                data-gnb-kind="jobsfeed"
              >
                <img
                  src="http://localhost/recruit-app/assets/images/logo.png"
                  style="max-width: 100%; margin-top: 7px; padding-right: 20px"
                />
              </a>
            </div>
            <ul class="Menu_MenuNav__EOf3X">
              <li
                class="Menu_MenuItem__wI1yA"
                data-attribute-id="gnb"
                data-gnb-kind="event"
              >
                <a href="http://localhost/recruit-app/recruits.do"
                  ><span>채용공고</span></a
                >
              </li>
              <li
                class="Menu_MenuItem__wI1yA"
                data-attribute-id="gnb"
                data-gnb-kind="event"
              >
                <a href="http://localhost/recruit-app/companyinfo/companyinfoList.do"><span>기업</span></a>
              </li>
              <li
                class="Menu_MenuItem__wI1yA"
                data-attribute-id="gnb"
                data-gnb-kind="resume"
              >
                <a href="http://localhost/recruit-app/notice/notices.do"
                  ><span>공지사항</span></a
                >
              </li>
              <li
                class="Menu_MenuItem__wI1yA"
                data-attribute-id="gnb"
                data-gnb-kind="freelancer"
              >
                <a
                  href="http://localhost/recruit-app/user/mypage/qna/mypageQnaForm.do"
                  ><span>문의사항</span></a
                >
              </li>
            </ul>
            <%
            	String userId = (String)session.getAttribute("userId");
            	String name = (String)session.getAttribute("name");
            %>
            <aside class="Aside_aside__f0SVC">
              <ul class="Aside_asideList__3WNyu">
              <%
              if(userId != null && !userId.isEmpty()){
              %>
               <!-- 로그인 되었을 때 보여줄 버튼 -->
               <li
                id="mypageLi"
                class="Menu_MenuItem__wI1yA"
                data-attribute-id="gnb"
                data-gnb-kind="freelancer"
                style="margin-right: 20px;"
              	>
              	<button type="button" id="moveMypageBtn">
               		<span style="color: #666666">마이페이지</span>
              	</button>
              </li>
               <li
                id="logoutLi"
                class="Menu_MenuItem__wI1yA"
                data-attribute-id="gnb"
                data-gnb-kind="freelancer"
                style="margin-right: 15px;"
              	>
                <button type="button" id="logoutBtn">
               		<span style="color: #666666">로그아웃</span>
              	</button>
              </li>
              <!-- 로그인 되었을 때 보여줄 버튼 -->
              
              <!-- 로그인 되지 않았을 때 보여줄 버튼 -->
                <%
              }else {
                %>
               
                <li class="Aside_signUpButtonContainer___0wTS" id="signupLi">
                  <button
                    class="Button_Button__root__V1ie3 Button_Button__outlined__H2mkd Button_Button__outlinedAssistive__mBcQK Button_Button__outlinedSizeSmall__JJmOo Aside_signUpButton__pY721"
                    type="button"
                    id = "signupBtn"
                    data-attribute-id="gnb"
                    data-gnb-kind="signupLogin"
                    onclick="location.href = 'http://localhost/recruit-app/user/loginPage.do'"
                  >
                    <span class="Button_Button__label__1Kk0v"
                      ><span
                        class="Typography_Typography__root__xYuMs Typography_Typography__label2__BRssq Typography_Typography__weightBold__e15ql"
                        >회원가입/로그인</span
                      ></span
                    ><span class="Button_Button__interaction__kkYaa"></span>
                  </button>
                </li>
              <% } %>
              <!-- 로그인 되지 않았을 때 보여줄 버튼 -->
              </ul>
            </aside>
          </nav>
        </div>
      </div>
      <div class="Padding_padding___Nyki"></div>
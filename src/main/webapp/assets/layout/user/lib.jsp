<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    info=""%>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <title>구지직 GoojzzK</title>
    <link rel="stylesheet" href="https://doberman-ready-termite.ngrok-free.app/recruit-app/assets/css/layout/user/c76e012c05e1318d.css" crossorigin="anonymous" data-n-g="" />
    <link rel="stylesheet" href="https://doberman-ready-termite.ngrok-free.app/recruit-app/assets/css/layout/user/pretendardvariable-dynamic-subset.min.css" />
    <link rel="stylesheet" href="https://doberman-ready-termite.ngrok-free.app/recruit-app/assets/css/layout/user/layout.css" />
    <link href="https://doberman-ready-termite.ngrok-free.app/recruit-app/assets/css/layout/user/common-sv-202405271315.css" rel="stylesheet" type="text/css" />
    <link rel="preconnect" href="https://fonts.googleapis.com">
	<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/gh/orioncactus/pretendard/dist/web/static/pretendard.css"/>
    <script src="https://code.jquery.com/jquery-3.7.1.js" integrity="sha256-eKhayi8LEQwp4NKxN+CfCh+3qOVUtJn3QNZ0TciWLP4=" crossorigin="anonymous"></script>
    <style>
      body {
        font-family: Pretendard, -apple-system, BlinkMacSystemFont, system-ui,
          Roboto, "Helvetica Neue", "Segoe UI", "Apple SD Gothic Neo",
          "Noto Sans KR", "Malgun Gothic", sans-serif;
      }
    </style>
    <script type="text/javascript">
	    <%
		String userId = (String)session.getAttribute("userId");
		String name = (String)session.getAttribute("name");
	 	%>	
	    document.addEventListener('DOMContentLoaded', function() {
	    	<% if(userId != null && !userId.isEmpty()){%>
	    	
	    	    const moveMypageBtn = document.getElementById('moveMypageBtn');
			    const logoutBtn = document.getElementById('logoutBtn');
			    
			    moveMypageBtn.addEventListener('click',function(){
			    	window.location.href = 'https://doberman-ready-termite.ngrok-free.app/recruit-app/user/mypage/mypageUserInfo.do';
			    });
			    
			    logoutBtn.addEventListener('click',function(){
			    	var conResult = confirm('로그아웃 하시겠습니까?');
			    	if(conResult){
			    		window.location.href = 'https://doberman-ready-termite.ngrok-free.app/recruit-app/user/logout.do';
			    	}else{
			    		return;
			    	}//end else
			    });
			    
	    	<%}else {%>
		    const signupBtn = document.getElementById('signupBtn');
		    
		    signupBtn.addEventListener('click', function() {
		        window.location.href = 'https://doberman-ready-termite.ngrok-free.app/recruit-app/user/loginPage.do'; // 이동할 페이지 URL
		    });
		    <%}//end else%>
		    
	    });
    </script>
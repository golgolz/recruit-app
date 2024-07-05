<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" info=""%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<title>관리자 페이지</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js" integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.min.js" integrity="sha384-0pUGZvbkm6XF6gxjEnlmuGrJXVbNuzT9qBBavbLwCsOGabYfZo0T0to5eqruptLy" crossorigin="anonymous"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<link id="pagestyle" href="http://localhost/recruit-app/assets/css/material-dashboard.min.css"
	rel="stylesheet" />
<link rel="shortcut icon" href="http://demofran.com/data/banner/JnLfWUSUyR6sXJP5n3Re4Fvdc93k93.ico" type="image/x-icon">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/gh/orioncactus/pretendard/dist/web/static/pretendard.css"/>
<!-- <script type="text/javascript" src="http://localhost/recruit-app/assets/js/admin/datepicker-ko.js"</script>> -->
<style>
   body {
     font-family: Pretendard, -apple-system, BlinkMacSystemFont, system-ui,
       Roboto, "Helvetica Neue", "Segoe UI", "Apple SD Gothic Neo",
       "Noto Sans KR", "Malgun Gothic", sans-serif;
   }
</style>
<script type="text/javascript">
	
	document.addEventListener('DOMContentLoaded', function() {
    	
    	    var logoutLink = document.getElementById('logout_menu');
		    
		    logoutLink.addEventListener("click", function(event) {
		        event.preventDefault();
		        var conResult = confirm('로그아웃 하시겠습니까?');
		        if(conResult){
		    		window.location.href = 'http://localhost/recruit-app/manage/logout.do';
		    	}else{
		    		return;
		    	}//end else
		      });//click
	});
</script>
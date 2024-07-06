<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" info=""%>

<aside
	class="sidenav navbar navbar-vertical navbar-expand-xs border-0 border-radius-xl fixed-start bg-gradient-dark ps bg-white"
	id="sidenav-main">
	<div class="sidenav-header">
		<a class="navbar-brand m-0" href="http://localhost/recruit-app/manage/dashboard/dashboard.jsp">
			<span class="ms-1 font-weight-bold text-white">채용 관리 시스템</span>
		</a>
	</div>
	<hr class="horizontal light mt-0 mb-2" />
		<ul class="navbar-nav">
			<li class="nav-item">
				<a
					id="dashboard_menu"
					class="nav-link text-white"
					href="http://localhost/recruit-app/manage/dashboard/dashboard.do">
					<span class="nav-link-text ms-1">대시보드</span>
				</a>
			</li>
			<li class="nav-item">
				<a
					id="admin_menu"
					class="nav-link text-white"
					href="http://localhost/recruit-app/manage/admin/admins.do">
					<span class="nav-link-text ms-1">관리자 관리</span>
				</a>
			</li>
			<li class="nav-item">
				<a 
					id="user_menu"
					class="nav-link text-white"
					href="http://localhost/recruit-app/manage/user/users.do">
					<span class="nav-link-text ms-1">사용자 관리</span>
				</a>
			</li>
			<li class="nav-item">
				<a
					id="company_menu"
					class="nav-link text-white"
					href="http://localhost/recruit-app/companyinfo/adminCompanyinfoList.do">
					<span class="nav-link-text ms-1">기업 관리</span>
				</a>
			</li>
			<li class="nav-item">
				<a 
					id="recruit_menu"
					class="nav-link text-white"
					href="http://localhost/recruit-app/manage/recruit/recruits.jsp">
					<span class="nav-link-text ms-1">공고 관리</span>
				</a>
			</li>
			<li class="nav-item">
				<a
					id="review_menu"
					class="nav-link text-white"
					href="http://localhost/recruit-app/manage/review/reviews.do">
					<span class="nav-link-text ms-1">리뷰 관리</span>
				</a>
			</li>
			<li class="nav-item">
				<a
					id="qna_menu"
					class="nav-link text-white"
					href="http://localhost/recruit-app/manage/qna/qnas.do">
					<span class="nav-link-text ms-1">문의 관리</span>
				</a>
			</li>
			<li class="nav-item">
				<a
					id="notice_menu"
					class="nav-link text-white"
					href="http://localhost/recruit-app/manage/notice/notices.do">
					<span class="nav-link-text ms-1">공지사항 관리</span>
				</a>
			</li>
			<li class="nav-item" style="padding-top: 350px;">
				<a
					id="logout_menu"
					class="nav-link text-white"
					style="justify-content: center; font-weight: 500;"
					href="#">
					<span class="nav-link-text ms-1">로그아웃</span>
				</a>
			</li>
		</ul>
</aside>
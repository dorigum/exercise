<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.sql.DriverManager"%>
<%@ page import="java.sql.Connection"%>
<%@ page import="java.sql.Statement"%>
<%@ page import="java.sql.ResultSet"%>
<%@ page import = "java.util.Calendar" %>
<%@ page import = "java.util.Date" %>
<%!// 변수 선언
	Connection conn = null;
	Statement stmt = null;
	ResultSet rs = null;
	String uid = "exercise";
	String pwd = "1234";
	String url = "jdbc:oracle:thin:@localhost:1521:XE";
	String sql = "select * from test where id='bbb'";%>
	
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Exercise index 페이지</title>
		<!-- 음성 녹음 테스트 -->
		<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
		<link rel="stylesheet" href="/css/main.css" />
		<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css"/>
		<link rel="stylesheet" type="text/css" href="css/table.css">
		<!-- 한글 깨짐 인코딩  -->
		<%-- <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> --%>
		<%
			Calendar cal = Calendar.getInstance();
			String[] arr = {"일", "월", "화", "수", "목", "금", "토"};
		%>
		
		<%!
			public String getDay(int x){
			String str = "";
			switch(x){
			case 1:str="일요일"; break;
			case 2:str="월요일"; break;
			case 3:str="화요일"; break;
			case 4:str="수요일"; break;
			case 5:str="목요일"; break;
			case 6:str="금요일"; break;
			case 7:str="토요일"; break;
			}
			return str;
		}
		%>
		
	</head>
	<body class="is-preload">

		<!-- Wrapper -->
			<div id="wrapper">

				<!-- Main -->
					<div id="main">
						<div class="inner">
							<jsp:include page="/WEB-INF/views/top.jsp" flush="true" />
							<!-- Header -->
								<!-- <header id="header">
									<a href="/" class="logo"><strong>AI Personal </strong>Trainer</a>
									<ul class="icons">
										<li><a href="#" class="icon brands fa-twitter"><span class="label">Twitter</span></a></li>
										<li><a href="#" class="icon brands fa-facebook-f"><span class="label">Facebook</span></a></li>
										<li><a href="#" class="icon brands fa-snapchat-ghost"><span class="label">Snapchat</span></a></li>
										<li><a href="#" class="icon brands fa-instagram"><span class="label">Instagram</span></a></li>
										<li><a href="#" class="icon brands fa-medium-m"><span class="label">Medium</span></a></li>
									</ul>
								</header> -->

							<!-- Content -->
								<section>
									<header class="main">
										<h1>Exercise Text record</h1>
									</header>
									
									<!-- 날짜 및 요일 -->
										<font size=4px>
										<%= cal.get(Calendar.YEAR) %>년
										<%= cal.get(Calendar.MONTH)+1 %>월
										<%= cal.get(Calendar.DATE) %>일
										<%= getDay(cal.get(Calendar.DAY_OF_WEEK)) %>의 운동</font><br><br>
										
									<!-- 운동 기록 텍스트 입력 폼 -->	
									<form method="post" action="/exer/insert">
									<table>
										<tr><th>운동날짜</th><td><input type="text" name="dayNo"></td></tr>
										<tr><th>년</th><td><input type="text" name="year"></td></tr>
										<tr><th>월</th><td><input type="text" name="month"></td></tr>
										<tr><th>일</th><td><input type="text" name="exdate"></td></tr>
										<tr><th>요일</th><td><input type="text" name="day"></td></tr>
										<tr><th>운동번호</th><td><input type="text" name="exNo"></td></tr>
										<tr><th>무게</th><td><input type="text" name="weight"></td></tr>
										<tr><th>횟수</th><td><input type="text" name="count"></td></tr>
										<tr><td colspan="2"><input type="submit" value="등록">
															<input type="reset" value="취소"></td></tr>
									</table>
								</form>
									
									<!-- <span class="image main"><img src="images/pic11.jpg" alt="" /></span> -->
								</section>

						</div>
					</div>

				<!-- Sidebar -->
					<div id="sidebar">
						<div class="inner">

							<!-- Search -->
								<section id="search" class="alt">
									<form method="post" action="#">
										<input type="text" name="query" id="query" placeholder="Search" />
									</form>
								</section>

							<!-- Menu -->
								<nav id="menu">
									<header class="major">
										<h2>Menu</h2>
									</header>
									<ul>
										<li><a href="/">Mainpage</a></li>
										<li><a href="../exerMain">Exercise Management Main</a></li>
										<li>
											<span class="opener">Exercise Management</span>
											<ul>
												<li><a href="exerciseListView">Exercise Record List</a></li>
												<li><a href="../voiceRecord">Voice Record</a></li>
												<li><a href="../stt">Voice Record File Upload</a></li>
												<li><a href="exerciseNewForm">Text record</a></li>
											</ul>
										<li>
											<span class="opener">Food Management</span>
											<ul>
												<li><a href="#">Lorem Dolor</a></li>
												<li><a href="#">Ipsum Adipiscing</a></li>
												<li><a href="#">Tempus Magna</a></li>
												<li><a href="#">Feugiat Veroeros</a></li>
											</ul>
										</li>
									</ul>
								</nav>
	 	
							<!-- Menu -->
								<nav id="menu">
									<header class="major">
										<h2>Record / File Upload</h2>
									</header>
									<ul>
										<li><a href="exer/exerciseListView">Exercise Record List</a></li>
										<li><a href="indexTest2">Recode TEST</a></li>
										<li><a href="voiceRecord">Voice Record</a></li>
										<li><a href="stt">Voice Record File Upload</a></li>
										<li><a href="exer/exerciseNewForm">Text record</a></li>
									</ul>
								</nav>
								
							<!-- Section -->
								<section>
									<header class="major">
										<h2>Get in touch</h2>
									</header>
									<p>Sed varius enim lorem ullamcorper dolore aliquam aenean ornare velit lacus, ac varius enim lorem ullamcorper dolore. Proin sed aliquam facilisis ante interdum. Sed nulla amet lorem feugiat tempus aliquam.</p>
									<ul class="contact">
										<li class="icon solid fa-envelope"><a href="#">information@untitled.tld</a></li>
										<li class="icon solid fa-phone">(000) 000-0000</li>
										<li class="icon solid fa-home">1234 Somewhere Road #8254<br />
										Nashville, TN 00000-0000</li>
									</ul>
								</section>

							<!-- Footer -->
								<footer id="footer">
									<p class="copyright">&copy; Untitled. All rights reserved. Demo Images: <a href="https://unsplash.com">Unsplash</a>. Design: <a href="https://html5up.net">HTML5 UP</a>.</p>
								</footer>

						</div>
					</div>

			</div>

		<!-- Scripts -->
			<script src="/assets/js/jquery.min.js"></script>
			<script src="/assets/js/browser.min.js"></script>
			<script src="/assets/js/breakpoints.min.js"></script>
			<script src="/assets/js/util.js"></script>
			<script src="/assets/js/main.js"></script>

	</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<jsp:include page="/WEB-INF/views/top.jsp" flush="true" />


	<h1>AI 퍼스널 트레이너</h1>

	<div id="mainMenuBox">
		<ul id="menuItem">
			<li><a href="#">홈 이미지</a></li>
			<li><a href="#">달력</a></li>
			<li><a href="#">게시판</a></li>
			<li><a href="#">마이페이지</a></li>
		</ul>
	</div>

	<article id="content2">
		<!-- 베스트 상품 -->
		<div id="productBox">
			<div class='product'>
				<div>
					<a href="<c:url value='/muscle1'/>"><img
						src="<c:url value='/image/prd001.jpg'/>">가슴 운동</a>
				</div>
				<div>
					<a href="#"><img src="<c:url value='/image/prd002.jpg'/>">등
						운동</a>
				</div>
			</div>
		</div>
	</article>

</body>
</html>
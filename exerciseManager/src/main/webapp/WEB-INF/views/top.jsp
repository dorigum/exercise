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
	<header>
		<div id="headerBox">
			<div id="logoBox">
				<a href="<c:url value='/'/>"> <img
					src="<c:url value='image/logo2.png'/>" id="logoImg"></a>
			</div>
			<div id="topMenuBox">
				<c:if test="${empty sessionScope.sid }">
					<a href="<c:url value='/loginForm' />">로그인</a>
					<a href="<c:url value='/joinForm' />">회원가입</a>
					<a href="<c:url value='/test' />">test 삭제예정</a>
				</c:if>
				<c:if test="${not empty sessionScope.sid }">
            			${sessionScope.sid } 님 환영합니다! 
            			<a href="<c:url value='/logout' />">로그아웃 </a>
					<a href="<c:url value='/member/myPage' />">MY Page </a>
				</c:if>
			</div>
		</div>
	</header>
</body>
</html>
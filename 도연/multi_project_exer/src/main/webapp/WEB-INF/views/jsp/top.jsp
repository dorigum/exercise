<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>프로젝트 예제 : index 메인 페이지</title> 
		<link rel="stylesheet" type="text/css" href="css/common.css">
		<link rel="stylesheet" type="text/css" href="css/index.css">
		<link rel="stylesheet" type="text/css" href="css/menu.css">
		<link rel="stylesheet" type="text/css" href="css/slideShow.css">
		<link rel="stylesheet" type="text/css" href="css/tabMenu.css">
		<link rel="stylesheet" type="text/css" href="css/product.css"> 
		<script src="js/jquery-3.6.0.min.js"></script>	
		<script src="js/subMenu.js"></script> 
		<script src="js/slideShow.js"></script>
		<script src="js/tabMenu.js"></script>
		<script src="js/index.js"></script>
		<script type="text/javascript">
		
		</script>
	</head>
	<body>
       	<header>
       	<div id="topMenuBox">
           	<c:if test="${empty sessionScope.sid }">
           		<a href="<c:url value='/loginForm'/>">로그인&nbsp</a>
           		<a href="<c:url value='/joinForm'/>">회원가입</a>
           	</c:if>
           	<c:if test="${not empty sessionScope.sid }">
           		${sessionScope.sid } 님 환영합니다!
           	<a href="<c:url value='/logout'/>">로그아웃</a>
           	<a href="<c:url value='/board/board_list'/>">게시판</a>
           	<a href="<c:url value='/product/cartList'/>">장바구니</a>
           	<a href="<c:url value='/member/myPage'/>">MYPage</a>
           	</c:if>
           	</div>
           </nav>		
	</body>
</html>
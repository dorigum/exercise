<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>운동 종류 조회 테스트</title>
	</head>
	<body>
		<h3>운동 종류 조회 테스트</h3>
		<table border="1">
			<tr><th>운동번호</th><th>운동종류</th>
			
			<c:forEach items="${exerciseList }" var="Exercise">
				<tr>
					<td><a href="<c:url value='/exer/exerciseDetailView/${exercise.exNo }'/>">${exercise.exNo }</a></td>
					<td>${exercise.exNo }</td>
					<td>${exercise.exName }</td>
				</tr>
			</c:forEach>
		</table><br><br>
		
		<a href="<c:url value='/'/>">메인 화면으로 이동</a>
	</body>
</html>
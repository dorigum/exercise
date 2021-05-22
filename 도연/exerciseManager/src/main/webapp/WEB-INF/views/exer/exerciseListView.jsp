<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>전체 운동 기록 조회</title>
	</head>
	<body>
		<h3>전체 운동 기록 조회</h3>
		<table border="1">
			<tr><th>운동기록번호</th><th>년</th><th>월</th><th>일</th>
				<th>요일</th><th>운동번호</th><th>무게</th><th>날짜</th></tr>
				
			<c:forEach items="${exerciseList }" var="DayExercise">
				<tr>
					<td><a href="<c:url value='/exer/exerciseDetailView/${DayExercise.dayNo }'/>">${DayExercise.dayNo }</a></td>
					<td>${DayExercise.year }</td>
					<td>${DayExercise.month }</td>
					<td>${DayExercise.exdate }</td>
					<td>${DayExercise.day }</td>
					<td>${DayExercise.exNo }</td>
					<td>${DayExercise.weight }</td>
					<td>${DayExercise.count }</td>
				</tr>
			</c:forEach>
		</table><br><br>
		
		<a href="<c:url value='/'/>">메인 화면으로 이동</a>
	</body>
</html>
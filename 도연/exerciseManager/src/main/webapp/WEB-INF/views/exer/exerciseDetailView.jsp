<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>운동 상세 기록 조회</title>
	</head>
	<body>
		<h3>운동 상세 기록 조회</h3>
		<table border="1" width="400">
			<tr><td>운동날짜</td><td>${DayExercise.dayNo }</td></tr>
			<tr><td>년</td><td>${DayExercise.year }</td></tr>
			<tr><td>월</td><td>${DayExercise.month }</td></tr>
			<tr><td>일</td><td>${DayExercise.exdate }</td></tr>
			<tr><td>요일</td><td>${DayExercise.day }</td></tr>
			<tr><td>운동번호</td><td>${DayExercise.exNo }</td></tr>
			<tr><td>무게</td><td>${DayExercise.weight }</td></tr>
			<tr><td>횟수</td><td>${DayExercise.count }</td></tr>
		</table><br><br>
		
		<a href="<c:url value='/'/>">메인 화면으로 이동</a><br><br>
		
		<!-- 도서 정보 수정 화면 이동 -->
		<a href="<c:url value='/exer/updateForm/${DayExercise.dayNo }'/>">운동 기록 수정</a><br><br>
	
		<a href="javascript:deleteCheck();">운동 기록 삭제</a>
		<!-- 삭제 확인 메시지 출력 -->
		<script>
			function deleteCheck(){
				var answer = confirm("삭제하시겠습니까?");
				if(answer == true){
					location.href="/exer/delete/${DayExercise.dayNo}";
				}
			}
		</script>
	</body>
</html>
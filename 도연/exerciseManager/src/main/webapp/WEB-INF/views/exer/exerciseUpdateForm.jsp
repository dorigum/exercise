<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>도서 정보 수정 화면</title>
	</head>
	<body>
		<form method="post" action="/exer/update">
			<table>
				<tr><td>운동날짜</td><td><input type="text" name="dayNo" value="${DayExercise.dayNo }" readonly></td></tr>
				<tr><td>년</td><td><input type="text" name="year" value="${DayExercise.year }"></td></tr>
				<tr><td>월</td><td><input type="text" name="month" value="${DayExercise.month }"></td></tr>
				<tr><td>일</td><td><input type="text" name="exdate" value="${DayExercise.exdate }"></td></tr>
				<tr><td>요일</td><td><input type="text" name="day" value="${DayExercise.day }"></td></tr>
				<tr><td>운동번호</td><td><input type="text" name="exNo" value="${DayExercise.exNo }"></td></tr>
				<tr><td>무게</td><td><input type="text" name="weight" value="${DayExercise.weight }"></td></tr>
				<tr><td>횟수</td><td><input type="text" name="count" value="${DayExercise.count }"></td></tr>
				<tr><td colspan="2"><input type="submit" value="완료">
									<input type="reset" value="취소"></td></tr>
			</table>		
		</form>
	</body>
</html>
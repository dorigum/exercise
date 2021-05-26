<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>운동 기록</title>
	</head>
	<body>
		<h3>운동 기록</h3>
		<form method="post" action="/exer/insert">
			<table>
				<tr><td>운동날짜</td><td><input type="text" name="dayNo"></td></tr>
				<tr><td>년</td><td><input type="text" name="year"></td></tr>
				<tr><td>월</td><td><input type="text" name="month"></td></tr>
				<tr><td>일</td><td><input type="text" name="exdate"></td></tr>
				<tr><td>요일</td><td><input type="text" name="day"></td></tr>
				<tr><td>운동번호</td><td><input type="text" name="exNo"></td></tr>
				<tr><td>무게</td><td><input type="text" name="weight"></td></tr>
				<tr><td>횟수</td><td><input type="text" name="count"></td></tr>
				<tr><td colspan="2"><input type="submit" value="등록">
									<input type="reset" value="취소"></td></tr>
			</table>
		</form>
	</body>
</html>
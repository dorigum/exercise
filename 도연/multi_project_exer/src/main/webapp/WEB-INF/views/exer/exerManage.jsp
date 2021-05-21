<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import = "java.util.Calendar" %>
<%@ page import = "java.util.Date" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>운동 관리 페이지</title>
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
	<body>
		<!-- 날짜 및 요일 -->
		<%= cal.get(Calendar.YEAR) %>년
		<%= cal.get(Calendar.MONTH)+1 %>월
		<%= cal.get(Calendar.DATE) %>일
		<%= getDay(cal.get(Calendar.DAY_OF_WEEK)) %>의 운동<br><br>
		
		
		단순 텍스트 테이블 출력<br>
		<table border="1">
	 		<tr><td>	</td><td>목표</td><td>현재</td></tr>
	 		<tr><td colspan=3>코어</td></tr>
	 		<tr><td>플랭크</td><td>10분</td><td>20분</td></tr>
	 		
	 		<tr><td colspan=3>하체</td></tr>
	 		<tr><td>스쿼트</td><td>20회</td><td>스쿼트:0회/0분</td></tr><br><br>
	 		
	 	</table>
	 	
	 	
	 	
	 	
	 	
	 	데이터베이스에서 불러오기 테스트<br>
	 	<h3>운동 기록 조회</h3>
		<table border="1">
		<tr><th>	</th><th>목표</th><th>현재</th>
	 		
	 	<c:forEach items="${exerciseList }" var="DayExercise">
			<tr>
				<td>${exercise.exNo }</td>
				<td>${exercise.exName }</td>
			</tr>
			</c:forEach>
		</table><br><br>	
 		
		 
	</body>
</html>
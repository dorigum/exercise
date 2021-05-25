<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ page import = "java.util.Calendar" %>
<%@ page import = "java.util.Date" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Exercise index 페이지</title>
		<%
			Calendar cal = Calendar.getInstance();
			String[] arr = {"일", "월", "화", "수", "목", "금", "토"};
			
/* 			String day = "";
			switch(cal.get(Calendar.DAY_OF_WEEK)){
			case 1:day="일요일"; break;
			case 2:day="월요일"; break;
			case 3:day="화요일"; break;
			case 4:day="수요일"; break;
			case 5:day="목요일"; break;
			case 6:day="금요일"; break;
			case 7:day="토요일"; break;
			} */
			
/* 			String strDay = "";
			switch(cal.get(Calendar.DAY_OF_WEEK)){
			case Calendar.SUNDAY : strDay = "일요일"; break;
			case Calendar.MONDAY : strDay = "월요일"; break;
			case Calendar.TUESDAY : strDay = "화요일"; break;
			case Calendar.WEDNESDAY : strDay = "수요일"; break;
			case Calendar.THURSDAY : strDay = "목요일"; break;
			case Calendar.FRIDAY : strDay = "금요일"; break;
			case Calendar.SATURDAY : strDay = "토요일"; break;
			} */
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
		<h3>운동 관리 페이지</h3>
		<a href="exer/exerciseListView">운동 기록 조회</a><br><br>
		<a href="exer/exerciseNewForm">운동 기록</a><br><br>
		<a href="exer/exerManage">운동 관리</a><br><br>
		<a href="exer/exerManage2">운동 관리2</a><br><br>
		<a href="jsp/top">테스트용</a><br><br>

		<!-- 날짜 및 요일 -->
		<%= cal.get(Calendar.YEAR) %>년
		<%= cal.get(Calendar.MONTH)+1 %>월
		<%= cal.get(Calendar.DATE) %>일
		<%= getDay(cal.get(Calendar.DAY_OF_WEEK)) %>의 운동
		
		
<%-- 
		<%= arr[cal.get(Calendar.DAY_OF_WEEK)-1] %> '금' 으로 출력
		<%= day %> '금요일' 로 출력
		<%= strDay %> '금요일' 로 출력
		 --%>
		 
		 <table border="1">
	 		<tr><td>	</td><td>목표</td><td>현재</td></tr>
	 		<tr><td colspan=3>코어</td></tr>
	 		<tr><td>플랭크</td><td>10분</td><td>20분</td></tr>
	 		
	 		<tr><td colspan=3>하체</td></tr>
	 		<tr><td>스쿼트</td><td>20회</td><td>스쿼트:0회/0분</td></tr>
		 </table>
		 
		 
		 <!-- 음성 녹음 추가 테스트으으으으으으으으으으으으으으 -->
 		<!-- <a href="voiceRecord">음성 녹음 테스트</a><br><br> -->
 		
 		
 		
 		<!-- 음성 파일 업로드 추가 -->
 		<a href="stt">Speech To Text (음성을 텍스트로 변환)</a><br><br>
		
	</body>
</html>
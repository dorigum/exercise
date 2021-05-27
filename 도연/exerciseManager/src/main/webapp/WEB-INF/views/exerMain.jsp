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
		
		<link rel="stylesheet" type="text/css" href="css/table.css">
		
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
	
	
	<!-- 상단 메뉴 고정하기(아직 안만듦) -->
	<%-- 	<div id="wrap">
	<!--  TOP  -->
	<jsp:include page="/WEB-INF/views/jsp/top.jsp" flush="true" />  --%>
	
	
		<h3>운동 관리 페이지</h3>
		<a href="exer/exerciseListView">운동 기록 조회</a><br><br>
		<a href="exer/exerciseNewForm">운동 기록</a><br><br>
		<a href="exer/exerManage">운동 관리</a><br><br>
		<a href="exer/exerManage2">운동 관리2</a><br><br>

		<!-- 날짜 및 요일 -->
		<%= cal.get(Calendar.YEAR) %>년
		<%= cal.get(Calendar.MONTH)+1 %>월
		<%= cal.get(Calendar.DATE) %>일
		<%= getDay(cal.get(Calendar.DAY_OF_WEEK)) %>의 운동
		
				 
		 <!-- 단순 테이블만 출력 -->
		 <table class="type07">
		 	<thead>
	 		<tr>
	 			<th scope="cols">운동</th>
	 			<th scope="cols">목표</th>
	 			<th scope="cols">현재</th>
	 		</tr>
	 		</thead>
	 		
	 		<tbody>
	 		<tr>
	 			<th>플랭크</th>
	 			<td>10분</td>
	 			<td>20분</td>
 			</tr>
	 		
	 		<tr>
	 			<th>스쿼트</th>
	 			<td>20회</td>
	 			<td>스쿼트:0회/0분</td>
 			</tr>	
	 		</tbody>
		 </table>


		<!-- 테이블 CSS 예시  -->
		<table class="type07">
			<thead>
				<tr>
					<th scope="cols">타이틀</th>
					<th scope="cols">내용</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<th scope="row">항목명</th>
					<td>내용이 들어갑니다.</td>
				</tr>
				<tr>
					<th scope="row">항목명</th>
					<td>내용이 들어갑니다.</td>
				</tr>
				<tr>
					<th scope="row">항목명</th>
					<td>내용이 들어갑니다.</td>
				</tr>
			</tbody>
		</table>


		<!-- 음성 파일 업로드 -->
	 	<a href="stt">Speech To Text (음성을 텍스트로 변환)</a><br><br>
	 		
	 	<!-- 음성 녹음 기능 -->
	 	<a href="voiceRecord">음성 녹음 테스트</a><br><br>
		
	</body>
</html>
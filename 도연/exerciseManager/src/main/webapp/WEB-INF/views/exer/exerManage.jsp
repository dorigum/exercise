<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.DriverManager"%>
<%@ page import="java.sql.Connection"%>
<%@ page import="java.sql.Statement"%>
<%@ page import="java.sql.ResultSet"%>
<%@ page import = "java.util.Calendar" %>
<%@ page import = "java.util.Date" %>
<%!// 변수 선언
	Connection conn = null;
	Statement stmt = null;
	ResultSet rs = null;
	String uid = "exercise";
	String pwd = "1234";
	String url = "jdbc:oracle:thin:@localhost:1521:XE";
	String sql = "select * from DayExercise";%>
<!DOCTYPE html>
<html>
	<head>
	<meta charset="UTF-8">
	<title>JDBC를 이용한 데이터베이스 테이블 만들기</title>
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
		
		
		<!-- 운동 현황 보여주는 테이블 만들기 -->
		단순 텍스트 테이블 출력<br>
		<table border="1">
	 		<tr><td>	</td><td>목표</td><td>현재</td></tr>
	 		<tr><td colspan=3>코어</td></tr>
	 		<tr><td>플랭크</td><td>10분</td><td>20분</td></tr>
	 		
	 		<tr><td colspan=3>하체</td></tr>
	 		<tr><td>스쿼트</td><td>20회</td><td>스쿼트:0회/0분</td></tr><br><br><br>
	 	</table><br><br>

	 <!-- exercise 테이블 조회 -->
	<%
		try {
		// 데이터베이스를 접속하기 위한 드라이버 SW 로드
		Class.forName("oracle.jdbc.driver.OracleDriver");
		// 데이터베이스에 연결하는 작업 수행
		conn = DriverManager.getConnection(url, uid, pwd);
		// 쿼리를 생성할 객체 생성
		stmt = conn.createStatement();
		// 쿼리 생성
		rs = stmt.executeQuery(sql);
	%>
	<table border="1">
		<tr>
			<td>번호</td>
			<td>년</td>
			<td>월</td>
			<td>일</td>
			<td>요일</td>
			<td>운동번호</td>
			<td>무게</td>
			<td>횟수</td>
		</tr>
		<%
			while (rs.next()) {
		%>
		<tr>
			<td><%=rs.getString("dayNo")%></td>
			<td><%=rs.getString("year")%></td>
			<td><%=rs.getString("month")%></td>
			<td><%=rs.getString("exdate")%></td>
			<td><%=rs.getString("day")%></td>
			<td><%=rs.getString("exNo")%></td>
			<td><%=rs.getString("weight")%></td>
			<td><%=rs.getString("count")%></td>
		</tr>
	

	<%
		}
	} catch (Exception e) {
	e.printStackTrace();
	} finally {
	try {
	if (rs != null) {
		rs.close();
	}
	if (stmt != null) {
		stmt.close();
	}
	if (conn != null) {
		conn.close();
	}
	} catch (Exception e) {
	e.printStackTrace();
	}
	}
	%>
	</table><br><br>
	

	<a href="exerciseNewForm">운동 기록 직접 입력</a><br><br>
	<a href="exerciseNewForm">운동 기록 (음성 녹음) (아직 안만들었음!)</a><br><br>
	<a href="exerciseNewForm">운동 기록 (음성 파일 업로드) (아직 안만들었음!)</a><br><br>
</body>
</html>
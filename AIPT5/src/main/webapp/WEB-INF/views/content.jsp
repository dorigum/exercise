<%@page import="java.util.regex.Pattern"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
th{width:70px;            
            vertical-align: top;
            font-size: 20px;
            font-family: 굴림;
            border:2px solid #F0F;
            border-color:#FFE6E6;}
td{
            width:90px;           
            vertical-align: top;
            font-size: 20px;
            font-family: 굴림;
            border:2px solid #F0F;
            border-color:#FFE6E6;
             }
            


</style>
</head>
<%
	String idx = request.getParameter("idx");
	try {
		String driverName = "oracle.jdbc.driver.OracleDriver";	
		String url = "jdbc:oracle:thin:@localhost:1521:XE";	
		ResultSet rs = null;
	 
		Class.forName(driverName);
		Connection con = DriverManager.getConnection(url,"exercise","1234");
		out.println("Oracle Database Connection Success.");
	 
		Statement stmt = con.createStatement();			
		String sql = "select * from board where idx = " + idx ;
		rs = stmt.executeQuery(sql);
		
		while(rs.next()){
%> 

<body>

<h1>게시글 조회</h1>						
	<table border="2" border-color="#FFE6E6">							<!-- border은 테두리를 표시하는 속성입니다. -->
		<tr height="40px">									
			<th>글번호</th>						
			<td><%=rs.getString("idx")%></td>
			<th>작성자</th>
			<td><%=rs.getString("writer")%></td>
			<th>날짜</th>
			<td><%=rs.getString("regdate")%></td>
			<th>조회수</th>
			<td><%=rs.getString("count")%></td>
		</tr>
		<tr height="40px">
			<th colspan="2">운동이름</th>						<!-- colspan은 행병합 속성입니다. -->
			<td colspan="6"><%= rs.getString("title")%></td>
		</tr>
		<tr height="200px">
			<th colspan="2">설명</th>						
			<td colspan="6"><%=rs.getString("image")%><%= rs.getString("content")%></td>
		</tr>
	</table>
	<a href="delete?idx=<%=rs.getString("idx")%>">게시글삭제</a>
	<a href="simpleCalendar#search">목록으로</a> 
<%	
		}
		con.close();
	}catch (Exception e) {
		out.println("Oracle Database Connection Something Problem. <hr>");
		out.println(e.getMessage());
		e.printStackTrace();
	}
%>

</body>
</html>
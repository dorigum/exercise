<%@page import="java.util.regex.Pattern"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<%
	request.setCharacterEncoding("euc-kr");
	String title = request.getParameter("title");
	String writer = request.getParameter("writer");
	int count = 0;
	String content = request.getParameter("content");
	
	if(title == "" ||title == null) out.println("title is null");
	
	if(writer == "" ||writer == null) out.println("writer is null");	
	
	if(content == "" ||content == null) out.println("content is null");
	
try {
	 //String driverName = "oracle.jdbc.driver.OracleDriver";	
	 //String url = "jdbc:oracle:thin:@localhost:1521:XE";	
	 
	 String driverName = "oracle.jdbc.driver.OracleDriver";	
	 String url = "jdbc:oracle:thin:@localhost:1521:XE";	
	 
	 Class.forName(driverName);
	 Connection con = DriverManager.getConnection(url,"exercise", "1234");
	 out.println("Oracle 데이터베이스 db에 성공적으로 접속했습니다");
	 
	 Statement stmt = con.createStatement();			
	 String sql = "INSERT INTO BOARD "+
	 			"(IDX, TITLE, WRITER, REGDATE, COUNT, CONTENT) "+ 
	 			"VALUES (board_seq.nextval, '"+title+"', '"+writer+"', sysdate, "+count+", '"+content+"')";
	 stmt.executeUpdate(sql);
	 
	 
	 
	 con.close();
	}catch (Exception e) {
	 out.println("Oracle 데이터베이스 db접속에 문제가 있습니다. <hr>");
	 out.println(e.getMessage());
	 e.printStackTrace();
	}finally{
		out.print("<script>location.href='simpleCalendar';</script>");
	}
%>
<body>

</body>
</html>
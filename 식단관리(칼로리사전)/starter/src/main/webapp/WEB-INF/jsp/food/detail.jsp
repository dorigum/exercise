<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>식품 상세보기</title>
</head>
<style>
	h2 { text-align: center;}
  table { width: 100%;}
  textarea { width: 100%;}
 	#outter {
		display: block;
		width: 30%;
		margin: auto;
	}
</style>
<body>

<h2>칼로리 사전</h2>
<br><br><br>
<div id="outter">
	<table border="1">
		<tr>
			<td>식품코드: ${food.fCode }</td>
		</tr>
		<tr>
			<td>
				식품명: ${food.fName }
			</td>
		</tr>
		<tr>
			<td>분류: ${food.f_category}</td> 
		</tr>
		<tr>
			<td>1회 제공량: ${food.servings}</td> 
		</tr>
		<tr>
			<td>1회 칼로리량: ${food.kcal}</td> 
		</tr>
		<tr>
			<td>분류: ${food.kcal_per_100}</td> 
		</tr>
	</table>
	<input type="button" value="칼로리사전" style="float: right;" onclick="location.href='list.do';"> 
</div>
</body>
</html>

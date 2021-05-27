<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>로그인</title>   
		
	</head>
	<body>
		로그인폼
		<div id="wrap">
			<!--  TOP 메뉴 넣을 곳  -->
			
			<!-- 로그인 실패 시 에러 메시지 출력 -->
			<c:if test="${not empty ERRORMSG}">
	        	<font color="red">
	        		login failed
	        	</font>
    		</c:if>  
    		
			<!--  로그인 폼  -->
			<section>
		        <h1 id="title">로그인</h1>
		        <form method="post" id="loginForm" action="<c:url value="/login"/>">
		          <table>
		            <tr><th> ID</th><td><input type="text" id="id" name="id" ></td></tr>
		            <tr><th>비밀번호</th><td><input type="password" id="pwd" name="pwd"></td></tr>
		             <tr>
		                <td colspan="2" align="center" id="button">
		                    <br><input type="submit" value="로그인">
		                    <input type="reset" value="취소">
		                </td>
		            </tr>             
		            </table>
		        </form>	
	        </section>
	        
	      	
	      
		    <!--  BOTTOM 메뉴? 넣을지 안넣을지는 미정  -->
		</div>
	</body>
</html>



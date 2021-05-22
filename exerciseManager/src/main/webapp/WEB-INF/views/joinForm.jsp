<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>회원 가입 폼</title>
		<script src="<c:url value='/js/jquery-3.6.0.min.js'/>"></script>		
		<script src="<c:url value='/js/idCheck.js'/>"></script>	
		<script type="text/javascript"></script>	
	</head>
	<body>
	<div id="wrap">
		<!--  TOP  -->
		<!--  회원 가입 폼  -->
		<section>
	        <h1 id="title">회원 가입</h1>
	        <form id="joinForm" name="joinForm" method="post"  action="/join"><!-- action="join.do" -->
	          <table>
	            <tr><th> 성명</th><td><input type="text" id="memName" name="memName" ></td></tr>
	            <tr><th> ID</th><td><input type="text" id="memId" name="memId" > 
	            		<input type="button" id="idCheck" value="ID 중복 체크"></td></tr>
	            <tr><th>비밀번호</th><td><input type="password" id="memPwd" name="memPwd"></td></tr>
	            <tr><th>성별</th>
	                  <td><select id="memDepartment" name="memDepartment">
	                               <option value="">선택하세요</option>
								   <option value="남">남</option>
								   <option value="녀">녀</option>
	                          </select></td></tr> 
	            <tr><th>목표체중</th><td><input type="text" id ="goalWeight" name="golWeight"></td></tr>

	            <tr>
	                <td colspan="2" align="center" id="button">
	                    <br><input type="submit" value="완료">
	                    <input type="reset" value="취소">
	                </td>
	            </tr>             
	            </table>
	      </form>	
      </section>
      <!--  BOTTOM  -->
		</div>
    </body>
</html>



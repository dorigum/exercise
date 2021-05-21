<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html>
<html>
	<head>
		<script 
			src="https://kit.fontawesome.com/8f2ec3fbbc.js" 
			crossorigin="anonymous">
		</script>
		<script src="<c:url value='js/jquery-3.6.0.min.js'/>"></script>
		
		<script src="<c:url value='js/simpleCalendar.js'/>"></script>
	    <link href="<c:url value='css/simpleCalendar.css'/>" rel='stylesheet' />
	    
	    <script src="<c:url value='js/subMenu.js'/>"></script>
	    <script src="<c:url value='js/subMenu2.js'/>"></script>
        <link href="<c:url value='css/subMenu.css'/>" rel="stylesheet" >
        
		<meta charset="EUC-KR">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<title>simple Calender</title>
		<style>

		</style>
	</head>
 
	<body onload="build();">
		<div class="wrap">
		    <table align="center" id="calendar">
		        <tr>
		            <td>
		            	<font size=1%; color="#B3B6B3">
		            		<label onclick="beforem()" id="before" ></label>
	            		</font>
	           		</td>
		            <td colspan="5" align="center" id="yearmonth"></td>
		            <td>
		            	<font size=1%; color="#B3B6B3">
		            		<label onclick="nextm()" id="next"></label>
	            		</font>
	           		</td>
		        </tr>
		        <tr id="dayLabels">
		            <td align="center"> <font color="#FF9090">Sun.</font></td>
		            <td align="center"> Mon. </td>
		            <td align="center"> Tue. </td>
		            <td align="center"> Wed. </td>
		            <td align="center"> Thu. </td>
		            <td align="center"> Fri. </td>
		            <td align="center"><font color=#7ED5E4>Sat.</font></td>
		        </tr>
	
		    </table>
		    <button type="button" class="mobile-menu"><i class="fas fa-bars"></i></button>
		    <div class="menuwrap">
		        <nav id="menu">
		            <!-- "메뉴목록 표시" -->
		            <ul class="category_list">
		            	<li id="yearmonth"></li>
		                <li class=""><a class="link_sub_item" href="#">식단 입력: 텍스트</a></li>
		                <li class=""><a class="link_sub_item" href="#">식단 입력: OCR</a></li>
		                <li class=""><a class="link_sub_item" href="#">식단 수정</a></li>
		            </ul>            
		        </nav>
		    </div>
	    </div>
	    
	</body>
	 
</html>

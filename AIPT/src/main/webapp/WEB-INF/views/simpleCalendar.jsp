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
	    
	    <%-- <script src="<c:url value='js/subMenu.js'/>"></script> --%>
	    <script src="<c:url value='js/subMenu.js'/>"></script>
        <link href="<c:url value='css/subMenu.css'/>" rel="stylesheet" >
	    <script src="<c:url value='js/selectTimeBtn.js'/>"></script>
        <link href="<c:url value='css/selectTimeBtn.css'/>" rel="stylesheet" >
        
        <script src="<c:url value='js/selectTimeBtn.js'/>"></script>
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
		            <td colspan="2">
		            	<font size=1%; color="#B3B6B3">
		            		<label onclick="beforem()" id="before" ></label>
	            		</font>
	           		</td>
		            <td colspan="3" align="center" id="yearmonth"></td>
		            <td colspan="2">
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
		    <!-- <button type="button" class="mobile-menu"><i class="fas fa-bars"></i></button> -->
		    
		    <div class="menuwrap">
		        <nav id="menu">
		            <!-- "메뉴목록 표시" -->
		            <h3 align="center" id="monthday" style="font-size:25px;"></h3>
		            <p>아침</p>
		            <table id="brkfstTable" border="1" width="300">
		            	<tr>
		            		<td style="">음식명</td>
		            		<td>섭취량</td>
		            		<td>칼로리</td>
		            	</tr>
		            </table>
		            
		            <br>
		            <p>점심</p>
		            <table id="lunchTable" border="1" width="300">
    			        <tr>
		            		<td style="">음식명</td>
		            		<td>섭취량</td>
		            		<td>칼로리</td>
		            	</tr>
		            </table>
		            <br>
		            <p>저녁</p>
		            <table id="dinnerTable" border= "1" width="300">
		            	<tr>
		            		<td style="">음식명</td>
		            		<td>섭취량</td>
		            		<td>칼로리</td>
		            	</tr>
		            </table>
		            <br>
		            <p>야식</p>
		            <table id="nightTable" border= "1" width="300">
		            	<tr>
		            		<td style="">음식명</td>
		            		<td>섭취량</td>
		            		<td>칼로리</td>
		            	</tr>
		            </table>
		            <br>
		            <p>간식</p>
		            <table id="snackTable" border= "1" width="300">
		            	<tr>
		            		<td style="">음식명</td>
		            		<td>섭취량</td>
		            		<td>칼로리</td>
		            	</tr>
		            </table>
		            <br><br>
		            
		            <div id="dietSearch">
			            <input type="button" id="textSearch" href="#" value="식단 입력: 텍스트로 검색">
			            <input type="button" id="OCRSearch" href="#" value="식단 입력: 성분표로 검색">
			            <input type="button" id="dietDelete" href="#" value="식단 삭제 (미구현)">
		            </div>

		        </nav>
		    </div>
		    
		    <div class="textSearchMenuwrap">
		        <nav id="textSearchMenu">
		        	<h3>식단 입력: 텍스트로 검색</h3>
<!-- 		        		<div class="selectTime">
			        		<h4>시간 선택</h4>
			        			<button type="button" class="breakfastBtn"><i class="fas fa-sun"></i></i></button>
			        			<button type="button" class="lunchBtn"><i class="fas fa-cloud-sun"></i></button>
			        			<button type="button" class="dinnerBtn"><i class="fas fa-moon"></i></button>
			        			<button type="button" class="snackBtn"><i class="fas fa-cookie-bite"></i></i></button>
		        		</div> -->
	        		<div class="container">
					
						<ul class="tabs">
							<li class="breakfastBtn">아침</li>
							<li class="lunchBtn">점심</li>
							<li class="dinnerBtn">저녁</li>
							<li class="nightBtn">야식</li>
							<li class="snackBtn">간식</li>
						</ul>

						<div class="content">
								
						</div>
					</div>
		        </nav>
        	</div>
		    
		    <div class="OCRSearchMenuwrap">
		        <nav id="OCRSearchMenu">
		        	<h3>식단 입력: 성분표로 검색</h3>
<!-- 		        		<div class="selectTime">
			        		<h4>시간 선택</h4>
			        			<button type="button" class="breakfastBtn"><i class="fas fa-sun"></i></i></button>
			        			<button type="button" class="lunchBtn"><i class="fas fa-cloud-sun"></i></button>
			        			<button type="button" class="dinnerBtn"><i class="fas fa-moon"></i></button>
			        			<button type="button" class="snackBtn"><i class="fas fa-cookie-bite"></i></i></button>
		        		</div> -->
	        		<div class="container">
					
						<ul class="tabs">
							<li class="breakfastBtn current">아침</li>
							<li class="lunchBtn">점심</li>
							<li class="dinnerBtn">저녁</li>
							<li class="nightBtn">야식</li>
							<li class="snackBtn">간식</li>
						</ul>

						<div class="content">
							
						</div>

					</div>
		        </nav>
        	</div>
	    </div>
	    
	</body>
	 
</html>

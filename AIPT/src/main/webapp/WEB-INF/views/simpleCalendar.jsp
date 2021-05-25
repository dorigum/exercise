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
		            <table class="brkfstTable" border="1" width="300">
		            	<tr>
		            		<td style="">음식명</td>
		            		<td>섭취량</td>
		            		<td>칼로리</td>
		            	</tr>
		            </table>
		            
		            <br>
		            <p>점심</p>
		            <table class="lunchTable" border="1" width="300">
    			        <tr>
		            		<td style="">음식명</td>
		            		<td>섭취량</td>
		            		<td>칼로리</td>
		            	</tr>
		            </table>
		            <br>
		            <p>저녁</p>
		            <table class="dinnerTable" border= "1" width="300">
		            	<tr>
		            		<td style="">음식명</td>
		            		<td>섭취량</td>
		            		<td>칼로리</td>
		            	</tr>
		            </table>
		            <br>
		            <p>야식</p>
		            <table class="nightTable" border= "1" width="300">
		            	<tr>
		            		<td style="">음식명</td>
		            		<td>섭취량</td>
		            		<td>칼로리</td>
		            	</tr>
		            </table>
		            <br>
		            <p>간식</p>
		            <table class="snackTable" border= "1" width="300">
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
	        		<div class="container">
					
						<ul class="tabs">
							<li class="breakfastBtn" value="아침">아침</li>
							<li class="lunchBtn" value="점심">점심</li>
							<li class="dinnerBtn" value="저녁">저녁</li>
							<li class="nightBtn" value="야식">야식</li>
							<li class="snackBtn" value="간식">간식</li>
						</ul>
						
						<div class="content">
							<p align="center" id="clickDay1" style="font-size:15px; margin: 5px;"></p>
							<p align="center" id="clickTime1" style="font-size:15px; margin: 5px;">시간을 클릭하세요 :)</p>
							<p align="center" style="font-size:15px; margin: 5px;">
								현재 식단
							</p>
				            <table class="brkfstTable" border="1" width="350">
				            	<tr>
				            		<td style="">음식명</td>
				            		<td>섭취량</td>
				            		<td>칼로리</td>
				            	</tr>
				            </table>
						</div>

					</div>
		        </nav>
        	</div>
		    
		    
		    <div class="OCRSearchMenuwrap">
		        <nav id="OCRSearchMenu">
		        	<h3>식단 입력: 성분표로 검색</h3>
	        		<div class="container">
					
						<ul class="tabs">
							<li class="breakfastBtn" value="아침">아침</li>
							<li class="lunchBtn" value="점심">점심</li>
							<li class="dinnerBtn" value="저녁">저녁</li>
							<li class="nightBtn" value="야식">야식</li>
							<li class="snackBtn" value="간식">간식</li>
						</ul>

						<div class="content">
						
							<p align="center" id="clickDay2" style="font-size:15px; margin: 5px;"></p>
							<p align="center" id="clickTime2" style="font-size:15px; margin: 5px;">시간을 클릭하세요 :)</p>
							<p align="center" style="font-size:15px; margin: 5px;">
								현재 식단
							</p>
				            <table class="brkfstTable" border="1" width="350">
				            	<tr>
				            		<td style="">음식명</td>
				            		<td>섭취량</td>
				            		<td>칼로리</td>
				            	</tr>
				            </table>
						</div>

					</div>
		        </nav>
        	</div>
	    </div>
	    
	</body>
	 
</html>

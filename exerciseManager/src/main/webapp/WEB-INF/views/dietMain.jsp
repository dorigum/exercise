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
        <script src="<c:url value='js/ocr.js'/>"></script>
        <link href="<c:url value='css/ocr.css'/>" rel="stylesheet" >
		<meta charset="EUC-KR">
		<title>simple Calender</title> 
		
		<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
		<link rel="stylesheet" href="/css/main.css" />
		<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css"/>
		<link rel="stylesheet" type="text/css" href="css/table.css">
		
		<style>

		</style>
	</head>
 
	<body class="is-preload" onload="build();">
		<div id="wrapper">
		
	<!-- Main -->
			<div id="main">
				<div class="inner">
					<jsp:include page="/WEB-INF/views/top.jsp" flush="true" />
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
						            <table class="selectedTable" border="1" width="350">
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
						            <table class="selectedTable" border="1" width="350">
						            	<tr>
						            		<td style="">음식명</td>
						            		<td>섭취량</td>
						            		<td>칼로리</td>
						            	</tr>
						            </table>
						            
				            		<h3>영양 성분표 불러오기</h3>
				
									<form id="ocrForm"  method="post" enctype="multipart/form-data">	         
							         	파일 :  <input type="file" id="uploadFile" name="uploadFile"> 
							         	<br><br>
							           <input id="submit" type="submit" value="불러오기">
									</form><br><br>		
									
									
									<h3>영양 성분표 분석 결과</h3>
									
									<div id="resultDiv"></div>
									
									<form id="ocrResultForm" method="post" enctype="multipart/form-data">
										총 내용량: <input id="totalAmount" type="text" size=10 readonly> <span class="amountUnit"></span> <br>
										1회 제공량: <input id="unitAmount" type="text" size=10 readonly> <span class="amountUnit"></span> <br>
										1회 칼로리: <input id="unitCalories" type="text" size=10 readonly> Kcal <br>
										상품명: <input id="prodName" type="text" size=18 placeholder="상품명 입력"> <br>
										섭취량: <input id="intake" type="text" size=10 placeholder="섭취량 입력"> <span class="amountUnit"></span> <br>
										
										<input type="button" id="insertDietOCR" type="submit" value="식단표에 입력하기"></button> <br>
									<!-- nutriFactor VO 만들어서 입력 받기 (탄단지 까지만) -->
									<!-- 나중에 해당 정보를 DB에 넣는 기능까지 넣기 -->
										<!-- 칼로리사전에 저장 버튼 -> 클릭 (alert("사전에 저장되었습니다 :)") -->
									</form><br><br>
									<!-- <a href="/">index 페이지로 이동</a> -->
									
								</div>
		
							</div>
				        </nav>
		        	</div>
			    </div>
		    </div>
	    </div>
    		<!-- Scripts -->
		<script src="assets/js/jquery.min.js"></script>
		<script src="assets/js/browser.min.js"></script>
		<script src="assets/js/breakpoints.min.js"></script>
		<script src="assets/js/util.js"></script>
		<script src="assets/js/main.js"></script>
    
	</body>
	 
</html>

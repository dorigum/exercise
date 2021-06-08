<%@page import="java.util.regex.Pattern"%>
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
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<title>simple Calender</title> 
		<style>

		</style>
		

	</head>
	<%
 
	int idx = 1;
	 
    String title = request.getParameter("title");
 
    String writer = request.getParameter("writer");
 
    String regdate = request.getParameter("regdate");
 
    int count = 10000;
 
    String content = request.getParameter("content");



%>
 
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
		            <p>운동 이름</p>
		           <input class="subject" id ="exname" type="text" name="exname" placeholder="오늘한 운동을 입력해주세요.">
		            
		            <br>
		            <p>운동 부위</p>
		            <select class="memo" id="bodypart" name="bodypart">
		            <option>전신</option>
		            <option>상체</option>
		            <option>하체</option>
		            
		           </select>
		            
		            <br>
		            <p>운동 시간</p>
		           <textarea class ="memo" id="extime" name="extime" rows="1" cols="5" placeholder="숫자 입력">
			</textarea>시간
		<textarea class ="memo" id="extime" name="extime" rows="1" cols="5" placeholder="숫자 입력">
			</textarea>분
		            <br>
		            <p>운동 횟수</p>
		           <textarea class ="memo" id="excount" name="excount" rows="1" cols="5" placeholder="숫자 입력">
			</textarea>세트
			<textarea class ="memo" id="excount" name="excount" rows="1" cols="5" placeholder="숫자 입력">
			</textarea>회
		            <br>
		            <p>운동 코멘트</p>
		            <textarea class ="memo" id="excoment" name="excoment" rows="3" cols="20" placeholder="100글자까지 입력가능합니다">
			</textarea>		           
		            
		            <div id="dietSearch">
		                <button class="ok-button" type="button" onclick="click_ok();">등록</button><br><br>
			            <input type="button" id="textSearch" href="#" value="운동 기록 보기">
			            <input type="button" id="OCRSearch" href="#" value="운동 검색">			         
		            </div>
		            
		        </nav>
		    </div>
		    
		    
		    <div class="textSearchMenuwrap">
		        <nav id="textSearchMenu">
		       <h3>운동 기록표</h3>
	        			        
						
						<div class="content">
							<p align="center" id="clickDay1" style="font-size:20px; margin: 5px;"></p>							
				            <table class="selectedTable" border="1" width="350">
				            	<tr>
				            		<td style="">운동명</td>
				            		<td>부위</td>
				            		<td>시간</td>
				            		<td>횟수</td>
				            	</tr>
				            </table>
						</div>

					</div>
		        </nav>
        	</div>
		    
		    
		    <div class="OCRSearchMenuwrap">
		        <nav id="OCRSearchMenu">
		        	<h3>운동 검색</h3>
	        		<div class="container">
					
						

						<div class="content">
						
							<p align="center" id="clickDay2" style="font-size:15px; margin: 1px;"></p>
							<input type='text' name='word' value='' placeholder="운동이름을 검색하세요">
     					    <button type='submit'>검색</button>    
      					    <button type='button' onclick="window.open('./create_form.jsp', '', 'width=700, height=630'); return false;">등록</button>
							<table>
							<tr>
								<th>번호</th>
								<th>운동명</th>
								<th>작성자</th>
								<th>날짜</th>
								<th>조회수</th>
							</tr>
							
							<tr>
    <td><%=idx %></td>                     
   
    <td><%=title %></td>
   
    <td><%=writer %></td>
   
    <td><%=regdate %></td>
   
    <td><%=count %></td>
   
							</tr>



							</table>
							<a href="write">글쓰기</a>				
				           
				            
		            		
							<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>

							<a href="/">index 페이지로 이동</a>
							
						</div>

					</div>
		        </nav>
        	</div>
	    </div>
	    
	</body>
	 
</html>

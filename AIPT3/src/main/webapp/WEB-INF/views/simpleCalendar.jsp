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
		            <!-- "???????????? ??????" -->
		            <h3 align="center" id="monthday" style="font-size:25px;"></h3>
		            <p>?????? ??????</p>
		           <input class="subject" id ="exname" type="text" name="exname" placeholder="????????? ????????? ??????????????????.">
		            
		            <br>
		            <p>?????? ??????</p>
		            <select class="memo" id="bodypart" name="bodypart">
		            <option>??????</option>
		            <option>??????</option>
		            <option>??????</option>
		            
		           </select>
		            
		            <br>
		            <p>?????? ??????</p>
		           <textarea class ="memo" id="extime" name="extime" rows="1" cols="5" placeholder="?????? ??????">
			</textarea>??????
		<textarea class ="memo" id="extime" name="extime" rows="1" cols="5" placeholder="?????? ??????">
			</textarea>???
		            <br>
		            <p>?????? ??????</p>
		           <textarea class ="memo" id="excount" name="excount" rows="1" cols="5" placeholder="?????? ??????">
			</textarea>??????
			<textarea class ="memo" id="excount" name="excount" rows="1" cols="5" placeholder="?????? ??????">
			</textarea>???
		            <br>
		            <p>?????? ?????????</p>
		            <textarea class ="memo" id="excoment" name="excoment" rows="3" cols="20" placeholder="100???????????? ?????????????????????">
			</textarea>		           
		            
		            <div id="dietSearch">
		                <button class="ok-button" type="button" onclick="click_ok();">??????</button><br><br>
			            <input type="button" id="textSearch" href="#" value="?????? ?????? ??????">
			            <input type="button" id="OCRSearch" href="#" value="?????? ??????">			         
		            </div>
		            
		        </nav>
		    </div>
		    
		    
		    <div class="textSearchMenuwrap">
		        <nav id="textSearchMenu">
		       <h3>?????? ?????????</h3>
	        			        
						
						<div class="content">
							<p align="center" id="clickDay1" style="font-size:20px; margin: 5px;"></p>							
				            <table class="selectedTable" border="1" width="350">
				            	<tr>
				            		<td style="">?????????</td>
				            		<td>??????</td>
				            		<td>??????</td>
				            		<td>??????</td>
				            	</tr>
				            </table>
						</div>

					</div>
		        </nav>
        	</div>
		    
		    
		    <div class="OCRSearchMenuwrap">
		        <nav id="OCRSearchMenu">
		        	<h3>?????? ??????</h3>
	        		<div class="container">
					
						

						<div class="content">
						
							<p align="center" id="clickDay2" style="font-size:15px; margin: 5px;"></p>
							<p align="center" id="clickTime2" style="font-size:15px; margin: 5px;">????????? ??????????????? ???????????????</p>
							
				           
				            
		            		<input type='text' name='word' value='' placeholder="??????????????? ???????????????">
     					    <button type='submit'>??????</button>    
      					    <button type='button' onclick="window.open('./create_form.jsp', '', 'width=700, height=630'); return false;">??????</button>
							<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>

							<a href="/">index ???????????? ??????</a>
							
						</div>

					</div>
		        </nav>
        	</div>
	    </div>
	    
	</body>
	 
</html>

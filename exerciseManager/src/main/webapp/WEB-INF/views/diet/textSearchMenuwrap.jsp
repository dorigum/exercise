<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
	</head>
	<body>
		<div class="textSearchMenuwrap">
	        <div id="textSearchMenu">
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
	<!-- 										<p align="center" style="font-size:15px; margin: 5px;">
												현재 식단
											</p> -->
						
					<div class="byTimeDietTable"></div>	
						<!-- Ajax(selectTimeBtn.js) 로 Controller => DB 로 데이터 받아서 작성되는 부분 -->
						<!-- 검색  -->
							<div style="float: left;">
								<form name="form1" method="post" action="foodList">
						
								    <select name="search_option">
								    <option value="all" 
								<c:if test="${map.search_option == 'all'}">selected</c:if>
								        >전체</option>
								        
								        <option value="fCode"
								<c:if test="${map.search_option == 'fCode'}">selected</c:if>
								   >식품코드</option>
								
								        <option value="fName" 
								<c:if test="${map.search_option == 'fName'}">selected</c:if>
								        >식품명</option>
								
								        <option value="f_category" 
								<c:if test="${map.search_option == 'f_category'}">selected</c:if>
								        >분류</option>
								
								        
								
								    </select>
								    <input name="keyword" value="${map.keyword}">
								    <input type="submit" value="검색">
								</form>
							</div>
							<hr>
							<div id='bySeachFoodTable'>
							</div>
							<hr>
					
					
			            
					</div>
	
				</div>
	        </div>
      	</div>
	</body>
</html>
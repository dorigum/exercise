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
										
									<div class="byTimeDietTable">
											<!-- Ajax(selectTimeBtn.js) 로 Controller => DB 로 데이터 받아서 작성되는 부분 -->
									</div>	
									
									<h3>텍스트 검색</h3>
										<!-- 검색  -->
											<div style="float: left;">
												<form id="searchForm" name="searchForm" method="post">
										
												    <select id="search_option" name="search_option">
												    <option value="all" 
												<c:if test="${search_option == 'all'}">selected</c:if>
												        >전체</option>
												        
												        <option value="fCode"
												<c:if test="${search_option == 'fCode'}">selected</c:if>
												   >식품코드</option>
												
												        <option value="fName" 
												<c:if test="${search_option == 'fName'}">selected</c:if>
												        >식품명</option>
												
												        <option value="f_category" 
												<c:if test="${search_option == 'f_category'}">selected</c:if>
												        >분류</option>
												
												    </select>
												    <input id= "keyword" name="keyword" value="${keyword}">
												    <input type="submit" value="검색">
												</form>
										
											</div>
										
											
										<br><br><br><br>
										<hr>
										
										<h3>텍스트 분석 결과</h3>
										<div id="resultDiv"></div>
										
										<form id="searchResultForm" method="post">
											<div id="textResult">
												<span>총 내용량:</span> &nbsp;&nbsp; <input id="totalAmount" type="text" size=10 readonly> <!-- <span class="amountUnit"></span> --><br>
												<br>
												<span>1회 제공량:</span> &nbsp;&nbsp; <input id="unitAmount" type="text" size=10 readonly> <!-- <span class="amountUnit"></span> --> <br>
												<br>
												<span>1회 칼로리:</span> &nbsp;&nbsp; <input id="unitCalories" type="text" size=10 readonly> <!-- Kcal --> <br>
												<br>
												<span>상품명:</span> &nbsp;&nbsp; <input id="prodName" type="text" size=18 placeholder="상품명 입력"> <br>
												<br>
												<span>섭취량:</span> &nbsp;&nbsp; <input id="intake" type="text" size=10 placeholder="섭취량 입력"> <!-- <span class="amountUnit"></span> --> <br>
											</div>
											<br>
											<input id="insertDietSearch" type="submit" value="식단표에 입력하기"><br>
											
										<!-- nutriFactor VO 만들어서 입력 받기 (탄단지 까지만) -->
										<!-- 나중에 해당 정보를 DB에 넣는 기능까지 넣기 -->
											<!-- 칼로리사전에 저장 버튼 -> 클릭 (alert("사전에 저장되었습니다 :)") -->
										</form><br><br>
										<!-- <a href="/">index 페이지로 이동</a> -->
										
									</div>
							            
									</div>
			
								</div>
					        </div>
			        	</div>
	</body>
</html>
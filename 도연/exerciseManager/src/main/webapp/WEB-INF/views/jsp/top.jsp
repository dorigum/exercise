<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>프로젝트 예제 : index 메인 페이지</title> 
		<link rel="stylesheet" type="text/css" href="css/common.css">
		<link rel="stylesheet" type="text/css" href="css/index.css">
		<link rel="stylesheet" type="text/css" href="css/menu.css">
		<link rel="stylesheet" type="text/css" href="css/slideShow.css">
		<link rel="stylesheet" type="text/css" href="css/tabMenu.css">
		<link rel="stylesheet" type="text/css" href="css/product.css"> 
		<script src="js/jquery-3.6.0.min.js"></script>	
		<script src="js/subMenu.js"></script> 
		<script src="js/slideShow.js"></script>
		<script src="js/tabMenu.js"></script>
		<script src="js/index.js"></script>
		<script type="text/javascript">
		
		</script>
	</head>
	<body>
        	<header>
        	<div id="topMenuBox">
		            	<c:if test="${empty sessionScope.sid }">
		            		<a href="<c:url value='/loginForm'/>">로그인&nbsp</a>
		            		<a href="<c:url value='/joinForm'/>">회원가입</a>
		            	</c:if>
		            	<c:if test="${not empty sessionScope.sid }">
		            		${sessionScope.sid } 님 환영합니다!
		            	<a href="<c:url value='/logout'/>">로그아웃</a>
		            	<a href="<c:url value='/board/board_list'/>">게시판</a>
		            	<a href="<c:url value='/product/cartList'/>">장바구니</a>
		            	<a href="<c:url value='/member/myPage'/>">MYPage</a>
		            	</c:if>
		            	</div>
		            	
        		<div id="headerBox">
        		<div id="logoBox"><a href="<c:url value='/'/>">
	            	<img src="<c:url value='image/logo.png'/>" id="logoImg"></a></div>
	            	
	            	
        			

	            	
            	</div>
            </header>
            <nav>            
            	<div id="mainMenuBox">
                	<ul id="menuItem">
                		<li><a href="#" id="showAllMenu">전체보기 ▼</a></li>
                    	<li><a href="<c:url value='/penPage'/>">펜</a></li>                        
                    	<li><a href="#">메모지</a></li>                        	          
                        <li><a href="#">스티커</a></li>
                        <li><a href="#">노트</a></li>
                        <li><a href="#">디자인문구</a></li>
                    </ul>
                    <%-- <div><a href="<c:url value='/penPage'/>"><img src="<c:url value='/image/pen.png'/>"></a></div> --%> <!-- 메뉴 이미지 테스트 -->
            	</div>
                <div id="subMenuBox">
                 	<div  class="subMenuItem"  id="subMenuItem1">
                    	<ul>   
                                <li><a href="#"><b>펜</b></a></li>                
                                <li><a href="#">볼펜</a></li>
                                <li><a href="#">수성펜</a></li>
                                <li><a href="#">형광펜</a></li>
                    	</ul>   
                    </div>
                    <div  class="subMenuItem"  id="subMenuItem2">
                    	<ul>   
                                <li><a href="#"><b>메모지</b></a></li>                
                                <li><a href="#">점착메모지</a></li>
                                <li><a href="#">떡메모지</a></li>
                                <li><a href="#">수첩</a></li>
                    	</ul>      
                    </div>
                    <div  class="subMenuItem"  id="subMenuItem3">
                    	<ul>   
                                <li><a href="#"><b>스티커</b></a></li>                
                                <li><a href="#">데코스티커</a></li>
                                <li><a href="#">인스</a></li>
                                <li><a href="#">도무송</a></li>
                    	</ul>
                    </div>
                    <div  class="subMenuItem"  id="subMenuItem4">
                    	<ul>   
                                <li><a href="#">노트</a></li>                
                                <li><a href="#">베이직노트</a></li>
                                <li><a href="#">스프링노트</a></li>
                                <li><a href="#">미니노트</a></li>
                    	</ul>   
                    </div> 
                    <div  class="subMenuItem"  id="subMenuItem5">
                    	<ul>   
                                <li><a href="#"><b>디자인문구</b></a></li>                
                                <li><a href="#">랩핑지</a></li>
                                <li><a href="#">엽서</a></li>
                                <li><a href="#">마스킹테이프</a></li>
                    	</ul>
                    </div>
<!--                     <div  class="subMenuItem"  id="subMenuItem6">
                    	<ul>   
                                <li><a href="#">subMenuItem6-1</a></li>                
                                <li><a href="#">subMenuItem6-2</a></li>
                                <li><a href="#">subMenuItem6-3</a></li>
                                <li><a href="#">subMenuItem6-4</a></li>
                    	</ul>   
                    </div>    -->             
                
                </div>                
            </nav>
		
	</body>
</html>
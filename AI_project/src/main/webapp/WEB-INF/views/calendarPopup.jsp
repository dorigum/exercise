<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>운동 추가</title>

<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js">
</script>
<script src="//code.jquery.com/jquery-3.2.1.min.js"></script>
<!-- datepicker -->
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<!-- custom -->

 <script type="text/javascript">
    $(function(){
    	$.datepicker.setDefaults({
    		dateFormat :'yy-mm-dd',
    		showOtherMonths : true,
    		showMonthAfterYear : true,
    		changeYear : true,
    		changeMonth : true,
    	yearSuffix:"년",
    	monthNamesShort:
    		['1','2','3','4','5','6','7','8','9','10','11','12'],
    		monthNames:['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
    		dayNamesMin:['일','월','화','수','목','금','토'],
    		dayNames:['일요일','월요일','화요일','수요일','목요일','금요일','토요일']
    	});
    	$("#startDate").datepicker();
    	$("#endDate").datepicker();
    	
    	$("#startDate").datepicker('setDate','today');
    	$("#endDate").datepicker('setDate','today');
    
    });
    
    </script>

</head>
<body>
<div class="group" id="popupGroup">
		<div class ="group-head">
			<h1 class ="zTree-h1">운동 이름</h1>
		</div>
		<div class="group-body">
		<form id="scheduleData">
			<div class="top">
				<input class="subject" id ="subject" type="text" name="subject" placeholder="오늘한 운동을 입력해주세요">
			</div>
		<div class ="domin">
				<h3 class="zTree-h3">시작</h3>
		</div>
		<div class="domain">
			<input class ="date" id ="startDate" type="text" name="startDate" id="startDate">
			</div>
		<div class ="domin">
				<h3 class="zTree-h3">종료</h3>
		</div>
			<input class ="date" id ="endDate" type="text" name="endDate" id="endDate">
			</div>
		<div class="domain">
				<h3 class="zTree-h3">운동 부위</h3>
		</div>
		<div class="domain">
		 <select class="domain" id="memo" name="memo">
								<option value="전신">전신</option>
								<option value="상체">상체</option>
								<option value="하체">하체</option>
							
		</div><br>
		<div class="domain">
				<h3 class="zTree-h3">아무것도 아님</h3>
		</div>
		<div class="domain">
			<textarea class ="memo" id="memo" name="memo" rows="1" cols="2" placeholder="100글자까지 입력가능합니다">
			</textarea>
		</div>
		<div class="domain">
				<h3 class="zTree-h3">운동 시간</h3>
		</div>
		<div class="domain">
		<textarea class ="memo" id="memo" name="memo" rows="1" cols="5" placeholder="숫자 입력">
			</textarea>시간
		<textarea class ="memo" id="memo" name="memo" rows="1" cols="5" placeholder="숫자 입력">
			</textarea>분
		<div class="domain">
				<h3 class="zTree-h3">운동 횟수</h3>
		</div>
		<div class="domain">
		<textarea class ="memo" id="memo" name="memo" rows="1" cols="5" placeholder="숫자 입력">
			</textarea>세트
			<textarea class ="memo" id="memo" name="memo" rows="1" cols="5" placeholder="숫자 입력">
			</textarea>회
		<h3 class="zTree-h3">운동 코멘트</h3>
		</div>
		<div class="domain">
			<textarea class ="memo" id="memo" name="memo" rows="3" cols="20" placeholder="100글자까지 입력가능합니다">
			</textarea>
		</div>
		</form>
			<button class="ok-button" type="button" onclick="click_ok();">확인</button>
</div>

</body>
</html>
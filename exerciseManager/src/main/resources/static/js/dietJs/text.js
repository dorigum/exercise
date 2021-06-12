/**
 *  text.js
 */

 
 $(function(){

	$('#searchForm').on('submit', function(event){
		event.preventDefault();  // submit 위에 reload 안되게
		
		var conditionData = {};
		conditionData['search_option'] = document.getElementById('search_option').value.trim();
		conditionData['keyword'] = document.getElementById('keyword').value.trim();
		
		$("#byDateDietTable").empty();
		////////////////////////////////////////////////////
		$.ajax({
			type: "post",
			data: conditionData,
			url: "dietSearchText",
/*			processData:false,  // 필수
			contentType:false,  // 필수*/
			success:function(arrayListOfFoodVO){
				
				var htmlStr = 
					"<table border='1'>" +		            	
						"<tr>" +
		            		"<th>시간</th>" +
	            			"<th>음식명</th>" +
		            		"<th>섭취량<br>(ml/g)</th>" +
		            		"<th>칼로리<br>(Kcal)</th>" +
		            	"</tr>";
					            	
				htmlStr += "<tr>";
				for (var i=0; i<arrayListOfFoodVO.length; i++){
					var calVo = arrayListOfFoodVO[i];
					htmlStr += 
						"<tr>" +
							"<td>" + calVo.eTime + "</td>" + 
							"<td>" + calVo.foodVO.fName + "</td>" +
							"<td>" + calVo.eAmt + "</td>" + 
							"<td>" + 
								(calVo.eAmt * calVo.foodVO.kcal / calVo.foodVO.servings).toFixed(2) + 
								/* 사용자의 섭취량에 따른 칼로리, doubleObj.toFixed(n) -> n자리까지 표현 */
							"</td>" + 
						"</tr>";
						
				}
				htmlStr += "</table>";
				$("#byDateDietTable").append(htmlStr);
			},
			error:function(e) {
				alert("subMenu.js에서 오류 발생 :<\n" + "e");
			}
		});
		
		
		
		// 만약에 숫자가 겹쳐서 안들어가면 alert("다시 시도해주세요 :)")
	});
	
	
	
	
	// food에 넣기
	$('#searchResultForm').on('submit', function(event){
		event.preventDefault();  // submit 위에 reload 안되게
		
		var randNum = Math.floor(Math.random() * 10000000);
 		var tempStrYYYYMM = $("#yearmonth").text();
		var tempStrMMDD = $("#clickDay2").text();
		
		var currYear = tempStrYYYYMM.slice(0, tempStrYYYYMM.indexOf('.')).trim();
		var currMonth = tempStrYYYYMM.slice(tempStrYYYYMM.indexOf('.') + 1).trim();
		var currDate = tempStrMMDD.slice(tempStrMMDD.indexOf('월') + 1, tempStrMMDD.indexOf('일')).trim();
		
		
		
		
		var foodConditionData = {};
		foodConditionData['condFCode'] = "Z" + randNum;
		foodConditionData['condFName'] = document.getElementById('prodName').value.trim();
		foodConditionData['condF_category'] = "사용자 입력";
		foodConditionData['condServings'] = document.getElementById('unitAmount').value.trim();
		foodConditionData['condKcal'] = document.getElementById('unitCalories').value.trim();
		foodConditionData['condKcal_per_100'] =  
			(Number(document.getElementById('unitCalories').value.trim()) * 100 /
				Number(document.getElementById('unitAmount').value.trim())).toFixed(2);
				
		var calendarConditionData = {};
		// id 는 session 으로 받아온다
		calendarConditionData['condFCode'] = "Z" + randNum;
		calendarConditionData['condEYear'] = currYear.trim();
		calendarConditionData['condEMonth'] = currMonth.trim();
		calendarConditionData['condEDate'] = currDate.trim();
		calendarConditionData['condEAmt'] = document.getElementById('intake').value.trim();
		calendarConditionData['condETime'] = $("#clickTime2").text().trim();

		// food 부터 넣자 
		$.ajax({
			type:"post",
			async: false, // 이거 설정 안해주면 calendar 데이터가 먼저 들어가서 fCode 없다고 난리침
			data: foodConditionData,
			url: "insertFoodData",
			success:function() {
				alert("음식 데이터를 성공적으로 저장했습니다 :>");
			},
			error:function(e) {
				alert("음식 데이터를 저장하지 못했습니다 :<\n" + e);
			}
			
		});
		
		// calendar 차례 
		$.ajax({
			type:"post",
			async: false, // 이거 설정 안해주면 calendar 데이터가 먼저 들어가서 fCode 없다고 난리침
			data: calendarConditionData,
			url: "insertCalendarData",
			success:function() {
				alert("식단 데이터를 성공적으로 저장했습니다 :>");
			},
			error:function(e) {
				alert("식단 데이터를 저장하지 못했습니다 :<\n" + e);
			}
			
		});
		
		
		
		// 만약에 숫자가 겹쳐서 안들어가면 alert("다시 시도해주세요 :)")
	});
});
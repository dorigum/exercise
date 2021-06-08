$(document).ready(function() {

	$(document).on('click', '.flip-card', function(){

		var tempStrYYYYMM = $("#yearmonth").text();
		var tempStrMMDD = $(this).find('.front').text();
		
		var currYear = tempStrYYYYMM.slice(0, tempStrYYYYMM.indexOf('.')).trim();
		var currMonth = tempStrYYYYMM.slice(tempStrYYYYMM.indexOf('.') + 1).trim();
		var currDate = tempStrMMDD.slice(tempStrMMDD.indexOf('.') + 1).trim();
		
		var conditionData = {};
		conditionData['condYear'] = currYear;
		conditionData['condMonth'] = currMonth;
		conditionData['condDate'] = currDate;
		
		$("#byDateDietTable").empty();
		
		$.ajax({
			type: "post",
			data: conditionData,
			url: "byDateDietList",
/*			processData:false,  // 필수
			contentType:false,  // 필수*/
			success:function(arrayListOfCalendarVO){
				
				var htmlStr = 
					"<table border='1'>" +		            	
						"<tr>" +
		            		"<th>시간</th>" +
	            			"<th>음식명</th>" +
		            		"<th>섭취량(ml/g)</th>" +
		            		"<th>칼로리(Kcal)</th>" +
		            	"</tr>";
					            	
				htmlStr += "<tr>";
				for (var i=0; i<arrayListOfCalendarVO.length; i++){
					var calVo = arrayListOfCalendarVO[i];
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
		
		event.preventDefault();
		
		monthday.innerHTML = currMonth + " 월 " + currDate + " 일  식단";
		clickDay1.innerHTML = currMonth + " 월  " + currDate + " 일";
		clickDay2.innerHTML = currMonth + " 월  " + currDate + " 일";
		
		document.querySelector('.menuwrap').classList.add('on');
	    let div = document.createElement('div');
	    div.id = 'dimmed';
	    document.body.append(div);
	
	    //페이지 스크롤 락  모바일 이벤트 차단
	    document.querySelector('#dimmed').addEventListener('scroll touchmove touchend mousewheel', function(e){
	        e.preventDefault();
	        e.stopPropagation();
	        return false;
	    });
        document.querySelector('#dimmed').addEventListener('click', function(e){
            if ( document.querySelector('.menuwrap').classList.contains('on') && 
			    document.querySelector('.OCRSearchMenuwrap').classList.contains('on') ){	
				document.querySelector('.OCRSearchMenuwrap').classList.remove('on');
            } else if ( document.querySelector('.menuwrap').classList.contains('on') && 
			    document.querySelector('.textSearchMenuwrap').classList.contains('on') ){	
				document.querySelector('.textSearchMenuwrap').classList.remove('on');
			} else if ( document.querySelector('.menuwrap').classList.contains('on') ){
	            document.querySelector('.menuwrap').classList.remove('on');
	            document.querySelector('.textSearchMenuwrap').classList.remove('on');
	            document.querySelector('#dimmed').remove();
	            document.querySelector('.textSearchMenuwrap').classList.remove('on');
	        } else {
	            document.querySelector('.menuwrap').classList.add('on');
			}
        });             

	});
	
	$(document).on('click', '#textSearch', function(){
		if ( document.querySelector('.textSearchMenuwrap').classList.contains('on') ){
			document.querySelector('.textSearchMenuwrap').classList.remove('on');
		} else {
			if (document.querySelector('.OCRSearchMenuwrap').classList.contains('on')){
				document.querySelector('.OCRSearchMenuwrap').classList.remove('on');
				document.querySelector('.textSearchMenuwrap').classList.add('on');
			} else {
				document.querySelector('.textSearchMenuwrap').classList.add('on');
			}
		}
	});
	
	$(document).on('click', '#OCRSearch', function(){
		if ( document.querySelector('.OCRSearchMenuwrap').classList.contains('on') ){
			document.querySelector('.OCRSearchMenuwrap').classList.remove('on');
		} else {
			if (document.querySelector('.textSearchMenuwrap').classList.contains('on')){
				document.querySelector('.textSearchMenuwrap').classList.remove('on');
				document.querySelector('.OCRSearchMenuwrap').classList.add('on');
			} else {
				document.querySelector('.OCRSearchMenuwrap').classList.add('on');
			}
		}
	});
	
}); //$(function() 끝

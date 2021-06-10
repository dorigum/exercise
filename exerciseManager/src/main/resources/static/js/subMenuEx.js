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
		
		$("#byexerciseTable").empty();
		alert("나누기1");
		$.ajax({
			type: "post",
			data: conditionData,
			url: "byExerciseList",
/*			processData:false,  // 필수
			contentType:false,  // 필수*/
			
			success:function(arrayListOfdayExerciseVO){
				alert("나누기2");
				var htmlStr = 
					"<table border='1'>" +		            	
						"<tr>" +
		            		"<th>시간</th>" +
	            			"<th>운동이름</th>" +
		            		"<th>운동무게(ml/g)</th>" +
		            		"<th>횟수(Kcal)</th>" +
		            	"</tr>";
					            	
				htmlStr += "<tr>";
				for (var i=0; i<arrayListOfdayExerciseVO.length; i++){
					var exVo = arrayListOfdayExerciseVO[i];
					htmlStr += 
						"<tr>" +
							"<td>" + exVo.eTime + "</td>" + 
							"<td>" + exVo.foodVO.fName + "</td>" +
							"<td>" + exVo.eAmt + "</td>" + 
							"<td>" + 
								(exVo.eAmt * exVo.foodVO.kcal / exVo.foodVO.servings).toFixed(2) + 
								/*사용자의 섭취량에 따른 칼로리, doubleObj.toFixed(n) -> n자리까지 표현 */
							"</td>" + 
						"</tr>";
						
				}
				htmlStr += "</table>";
				$("#byDateDietTable").append(htmlStr);
			},
			error:function(e) {
				alert("subMenuEx.js에서 오류 발생 :<\n" + "e");
			} 
		});
		
		event.preventDefault();
		
		monthday.innerHTML = currMonth + " 월 " + currDate + " 일  운동";
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

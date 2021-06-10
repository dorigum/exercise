/**
 * 
 */
 
    var today = new Date(); // 오늘 날짜
    var date = new Date();
 
	function beforem() { //이전 달을 today에 값을 저장
        today = new Date(today.getFullYear(), today.getMonth() - 1, today.getDate());
        build(); //만들기
    }
    
    function nextm() {  //다음 달을 today에 저장
        today = new Date(today.getFullYear(), today.getMonth() + 1, today.getDate());
        build();
    }
    
    function build() {
        var nMonth = new Date(today.getFullYear(), today.getMonth(), 1); //현재달의 첫째 날
        var lastDate = new Date(today.getFullYear(), today.getMonth() + 1, 0); //현재 달의 마지막 날
        var tbcal = document.getElementById("calendar"); // 테이블 달력을 만들 테이블
        var yearmonth = document.getElementById("yearmonth"); //  년도와 월 출력할곳
        var monthday = document.getElementById("monthday"); //  년도와 월 출력할곳
        
        yearmonth.innerHTML = today.getFullYear() + " . "+ (today.getMonth() + 1); //년도와 월 출력
        /*monthday.innerHTML = (today.getMonth() + 1) + " . " + today.getDate();*/ //년도와 월 출력
        before.innerHTML= "<i class='fas fa-caret-square-left'></i>";
        next.innerHTML= "<i class='fas fa-caret-square-right'></i>";
        
        // 남은 테이블 줄 삭제
        while (tbcal.rows.length > 2){
            tbcal.deleteRow(tbcal.rows.length - 1);
        }
        var row = null;
        row = tbcal.insertRow();
        var cnt = 0;
 
        // 1일 시작칸 찾기
        for (i = 0; i < nMonth.getDay(); i++) {
            cell = row.insertCell();
            cnt = cnt + 1;
        }
 
        // 달력 출력
        for (i = 1; i <= lastDate.getDate(); i++) { // 1일부터 마지막 일까지
        	
            cell = row.insertCell();
            var mon = (today.getMonth() + 1);
            var dat = i;

            
            cnt = cnt + 1;
            
            if (cnt % 7 == 0) { // 1주일이 7일 이므로 토요일 계산
                row = calendar.insertRow();// 줄 추가
            }
            /*font-weight:bold*/
            cell.innerHTML = 
            	" \
            		<div class='flip-card'> \
	            		<div class='flip-card-inner'> \
						    <div class='flip-card-front' id='flip-card-front" + i + "'> \
						        <h2 class='front'>" + 
						        mon + "." + dat + 
						        "</h2> \
						        <div class= 'cal' id='cal" + i + 
						        "' style='font-size:25px; text-align:center;'></div>" 
						         + "<p id='kcal" + i + "' style='font-size:15px;'>운동</p>" + 
						    "</div> \
						    <div class='flip-card-back'> \
						        <h2 style='color:white;'>" +
						        mon + "." + dat + 
						        "</h2> \
						        <div class= 'cal' id='backUserCal" + i + 
						        "' style='font-size:12.5px; text-align:center;'></div>" +
						        "<div class= 'cal' id='backRecommCal" + i + 
						        "' style='font-size:12.5px; text-align:center;'></div>" 
						    "</div> \
						</div> \
					</div> \
				"
            if (today.getFullYear()==date.getFullYear() && today.getMonth()==date.getMonth() && i==date.getDate()) {
                /*cell.bgColor = "#FCABB9";*/ // 오늘 색상 변경
                $('#flip-card-front' + i).css({"background-color":"#FCABB9"});
                // 기존 색상 변경
                	// <div class='flip-card-front' style='background-color:#FCABB9;'>
            }
            var tempStrYYYYMM = $("#yearmonth").text();
			var currYear = tempStrYYYYMM.slice(0, tempStrYYYYMM.indexOf('.')).trim();
			var currMonth = mon;
			var currDate = dat;
			
			var conditionData = {};  // ajax로 보낼 데이터 만들기
			conditionData['condYear'] = currYear;
			conditionData['condMonth'] = currMonth;
			conditionData['condDate'] = currDate;
			
			
			$.ajax({
				type: "post",
				data: conditionData,  // AIRestController로 보낼 데이터
				url: "/byExerciseList",  // AIRestController에서 받을 주소
				async: false,  // 설정 안하면 셀(플립카드)에 나타나지 않음
				success:function(arrayListOfExerciseVO){
					var secOperand =  1;
					var recommendCal =2;
					var exRecord =3;
					for (var idx=0; idx<arrayListOfExerciseVO.length; idx++) {
						var calVo = arrayListOfExerciseVO[idx];
						var singleDietCal = 4;
						totalCalPerDay += singleDietCal;
					}
					
					var goalRecord = "목표횟수: " + 2 + "회";
					var realRecord = "수행횟수: " + 3 + " Kcal";
					
					$('#backUserCal' + i).append(goalRecord);
					$('#backRecommCal' + i).append(realRecord);
					if (exRecord >= 0) $('#cal' + i).append("+");
					
					// 운동을 했느냐로 셀의 색상을 바꾸고 싶을 때는 ln.122 ~ 129 대신
					
					if (exRecord > 5) {
						$('#flip-card-front' + i).css({"background-color":"red"});
					} else if (exRecord > 3) {
						$('#flip-card-front' + i).css({"background-color":"#FCABB9"});
					} else {
						$('#flip-card-front' + i).css({"background-color":"blue"});
					} 
					
					
				},
				error:function(e) {
					alert("simpleCalendar.js에서 오류 발생 :<\n" + "e");
				}
			});  // ajax 종료
      }
}
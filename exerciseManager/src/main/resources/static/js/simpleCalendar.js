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
            cell = row.insertCell();{
            var mon = (today.getMonth() + 1);
            var dat = i;
            cell.innerHTML = 
            	" \
            		<div class='flip-card'> \
	            		<div class='flip-card-inner'> \
						    <div class='flip-card-front'> \
						        <h3 class='front'>" + 
						        mon + "." + dat + 
						        "</h3> \
						        <h1 id='cal' style='color:#1c1e26;'> 0 <br> Kcal</h1> \
						    </div> \
						    <div class='flip-card-back'> \
						        <h3>" +
						        (today.getMonth() + 1) + "." + i + 
						        "</h3> \
						        <p>권장: 0 Kcal</p> \
						        <p>섭취: 0 Kcal</p> \
						    </div> \
						</div> \
					</div> \
				"
	            
            cnt = cnt + 1;
            
            if (cnt % 7 == 0) { // 1주일이 7일 이므로 토요일 계산
                row = calendar.insertRow();// 줄 추가
            }
            
            if(today.getFullYear()==date.getFullYear()&&today.getMonth()==date.getMonth()&&i==date.getDate()) {
                // cell.bgColor = "#BCF1B1"; //오늘날짜배경색 #EE64AE
	            cell.innerHTML = 
	            	" \
	            		<div class='flip-card'> \
		            		<div class='flip-card-inner'> \
							    <div class='flip-card-front' style='background-color:#FCABB9;'> \
							        <h3 class='front'>" + 
							        (today.getMonth() + 1) + "." + i + 
							        "</h3> \
							        <h1 id='cal' style='color:#1c1e26;'> 0 <br> Kcal</h1> \
							    </div> \
							    <div class='flip-card-back'> \
							        <h3>" +
							        (today.getMonth() + 1) + "." + i + 
							        "</h3> \
							        <p>권장: 0 Kcal</p> \
							        <p>섭취: 0 Kcal</p> \
							    </div> \
							</div> \
						</div> \
					"
            }
        }
 }
 }
    
/**
 *  idCheck.js
 */
 
 $(function(){
	$('#idCheck').on('click', function(){

		$.ajax({
			url: "idCheck",
			method: "post",
			data: {"id":$('#memId').val()},
			success:function(result, textStatus){
				if(result > 0) alert("사용할 수 없는 ID입니다. ");
				else alert("사용 가능한 ID입니다.");
			},
			error:function(data, textStatus){
				alert("에러가 발생했습니다.");
			},
			complete:function(data, textStatus){				
			}			
		});		
	});	

});


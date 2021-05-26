/**
 *  idCheck.js
 */
 
 $(function(){
	$('#idCheck').on('click', function(){

		$.ajax({
			url: "idCheck",
			method: "post",
			data: {"id":$('#Id').val()},
			success:function(result, textStatus){
				if(result > 0) {
					alert("사용할 수 없는 ID입니다. ");
					$('#checktype').attr('class','modal-content panel-success');
				}
				else{
					alert("사용 가능한 ID입니다.");
					$('#checktype').attr('class','modal-content panel-waring');
				} 
				$('#checkModal').modal("show");
			},
			error:function(data, textStatus){
				alert("에러가 발생했습니다.");
			},
			complete:function(data, textStatus){				
			}			
		});		
	});	

});




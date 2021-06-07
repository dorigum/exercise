/**
 *  ocr.js
 */
 
 $(function(){
	$('#ocrForm').on('submit', function(event){
		event.preventDefault();  // submit 위에 reload 안되게
		var formData = new FormData($('#ocrForm')[0]);
		
		$.ajax({
			type:"post",
			enctype:"multipart/form-data",
			url:"dietOCR",
			data:formData,
			processData:false,  // 필수
			contentType:false,  // 필수
			success:function(nfvo){
				/*var jsonNfvo = JSON.parse(nfvo)*/
/*				alert(nfvo.amountUnit);
				console.log(nfvo);*/
				/*$('#resultDiv').html(nfvo.getUnitAmount());*/
				$('#totalAmount').val(nfvo.totalAmount);
				$('.amountUnit').text(nfvo.amountUnit);
				$("#totalAmount").css({"background":"#AAB2BD"});
				
				$('#unitAmount').val(nfvo.unitAmount);
				$("#unitAmount").css({"background":"#AAB2BD"});
				
				$('#unitCalories').val(nfvo.unitcalories);
				$("#unitCalories").css({"background":"#AAB2BD"});
				
			},
			
			/*NutriFactVO [totalAmount=90.0, amountUnit=g, unitAmount=90.0, unitcalories=465.0]*/
			
			error:function(e){
				alert("에러 발생!! : " + e);
			}
		});
	});
});
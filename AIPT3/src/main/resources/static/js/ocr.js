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
			url:"clovaOCR",
			data:formData,
			processData:false,  // 필수
			contentType:false,  // 필수
			success:function(result){
				$('#resultDiv').text(result);
			},
			error:function(e){
				alert("에러 발생!! : " + e);
			}
		});
	});
});
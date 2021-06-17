/*insertDietOCR*/
$(document).ready(function(){
		$('#imageIndicator').on('mouseover', function(){
			$('#imageIndicator').css({'cursor': 'pointer'}); 
			$('#OCRImage').show();
			var src = $('#uploadFile').val().split("\\").pop();
			$('#OCRImage').prop("src", '/fileupload/' + src);
		}); 
		$('#imageIndicator').on('mouseout', function(){
			$('#OCRImage').hide();
		});
	
});




$(document).ready(function() {

	$(document).on('click', '.flip-card', function(){

		monthday.innerHTML = $(this).find('.front').text();
		clickDay1.innerHTML = $(this).find('.front').text();
		clickDay2.innerHTML = $(this).find('.front').text();
		
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

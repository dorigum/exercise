/**
 * 
 */
/* 
$(document).ready(function(){
	
	$('ul.tabs li').click(function(){
		var tab_id = $(this).attr('data-tab');

		$('ul.tabs li').removeClass('current');
		$('.tab-content').removeClass('current');

		$(this).addClass('current');
		$("#"+tab_id).addClass('current');
	})

})*/

$(document).ready(function(e){

	
/*	$('ul.tabs li').click(function(){

		$('ul.tabs li').removeClass('current');
		$(this).addClass('current');
		// sql 문에서 eTime에 해당하는 부분 
	})*/
	
	$(".breakfastBtn").click(function(){
		clickTime1.innerHTML = $(this).text();
		clickTime2.innerHTML = $(this).text();
		$('ul.tabs li').removeClass('current');
		$(this).addClass('current');
		$('.content').css('border-color', '#d3e9dc');
		// sql 문에서 eTime에 해당하는 부분 

	});
	
	$(".lunchBtn").click(function(){
		clickTime1.innerHTML = $(this).text();
		clickTime2.innerHTML = $(this).text();
		
		$('ul.tabs li').removeClass('current');
		$(this).addClass('current');
		$('.content').css('border-color', '#72b4ce');
	});
	
	$(".dinnerBtn").click(function(){
		clickTime1.innerHTML = $(this).text();
		clickTime2.innerHTML = $(this).text();
		$('ul.tabs li').removeClass('current');
		$(this).addClass('current');
		$('.content').css('border-color', '#af9cbc');
	});
	
	$(".nightBtn").click(function(){
		clickTime1.innerHTML = $(this).text();
		clickTime2.innerHTML = $(this).text();
		$('ul.tabs li').removeClass('current');
		$(this).addClass('current');
		$('.content').css('border-color', '#4a578e');
	});
	
	$(".snackBtn").click(function(){
		clickTime1.innerHTML = $(this).text();
		clickTime2.innerHTML = $(this).text();
		$('ul.tabs li').removeClass('current');
		$(this).addClass('current');
		$('.content').css('border-color', '#F080A8');
	});
	


})
 
 
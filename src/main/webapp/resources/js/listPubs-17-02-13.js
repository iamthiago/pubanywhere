$(document).ready(function() {
	
	$('ul#ul-list').easyPaginate({
		step:10
	});
	
	$('.star-list').each(function() {
		$(this).raty({
			path: '/resources/imgs',
			readOnly : true,
			halfShow: false,
			score : $(this).attr('data-number')
		});
	});
});
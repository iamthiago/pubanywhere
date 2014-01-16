$(document).ready(function() {

	var str = $('#pageUrl').val();
	var getPage = parseInt($('#pageNum').val());
	var pageNum = (getPage + 1);
	var maxPages = ($('#maxPages').val());
	var showPages = (maxPages == 1 ? false : true);
	
	var options = {
		alignment : 'center',
		size : 'mini',
		currentPage : pageNum,
		totalPages : maxPages,
		shouldShowPage : showPages,
		onPageClicked : function(e, originalEvent, type, page) {
			console.log("page " + (page - 1));
			location.href = str + '?page=' + (page - 1);
		}
	}

	$('.customPagination').bootstrapPaginator(options);
	
});
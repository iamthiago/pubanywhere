$(document).ready(function() {

	var str = $('#pageUrl').val();
	var pageNum = $('#pageNum').val();
	var maxPages = $('#maxPages').val();
	var showPages = (maxPages == 1 ? false : true);

	var options = {
		alignment : 'center',
		size : 'mini',
		currentPage : pageNum,
		totalPages : maxPages,
		shouldShowPage : showPages,
		onPageClicked : function(e, originalEvent, type, page) {
			location.href = str + '?page=' + page;
		}
	}

	$('.customPagination').bootstrapPaginator(options);
	
});
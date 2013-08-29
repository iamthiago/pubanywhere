$(document).ready(function() {

	var str = $('#pageUrl').val();
	var newStr = str.replace(/(\d+)(?!.*\d)/g, '');
	var num = str.match(/(\d+)(?!.*\d)/g);

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
			location.href = newStr + page;
		}
	}

	$('.customPagination').bootstrapPaginator(options);

});
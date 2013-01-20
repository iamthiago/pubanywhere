$(document).ready(function() {
	$.extend(true, $.fn.dataTable.defaults, {
		"bPaginate" : true,
		"bLengthChange" : true,
		"bInfo" : true,
		"bJQueryUI" : true
	});
});
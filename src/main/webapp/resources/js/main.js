$(document).ready(function() {
	
	$('#btnSearch').button({
		icons : {
			primary : 'ui-icon ui-icon-search'
		},
		text : false
	
	}).click(function() {
		$('#form').submit();
	});
	
	// toolbar
	$('#signin, #listYourPub, #insertPub').button();
	
	$('#pubTable').dataTable();
});

$(document).ready(function() {
	
	$('#btnSearch').button({
		icons : {
			primary : 'ui-icon ui-icon-search'
		},
		text : false
	
	}).click(function() {
		$('#form').submit();
	});
	
	$('#btnHome').button({
		icons : {
			primary : 'ui-icon ui-icon-home'
		},
		text: false
	});
	
	// toolbar
	$('#signin, #listYourPub, #insertPub, #btnContact, #sendMail').button();
});
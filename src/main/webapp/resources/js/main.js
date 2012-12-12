$(document).ready(function() {
	
	$('#btnHome').button({
		icons : {
			primary : 'ui-icon ui-icon-home'
		},
		text: false
	});
	
	// toolbar
	$('#listYourPub, #insertPub, #btnContact, #sendMail').button();
});
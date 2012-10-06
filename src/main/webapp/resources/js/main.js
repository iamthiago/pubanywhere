$(document).ready(function() {
	
	$('#btnSearch').button({
		icons : {
			primary : 'ui-icon ui-icon-search'
		},
		text : false
	});
	
	//toolbar
	$('#signin, #insertPub').button();
	
	$('#config').button({
		icons : {
			primary : 'ui-icon-wrench'
		},
		text : false
	});
	
	$('#logout').button({
		icons : {
			primary : 'ui-icon-circle-close'
		},
		text : false
	});
});

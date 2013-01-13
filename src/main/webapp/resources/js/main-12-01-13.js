$(document).ready(function() {
	
	$('#btnHome').button({
		icons : {
			primary : 'ui-icon ui-icon-home'
		},
		text: false
	});
	
	// toolbar
	$('#listYourPub, #insertPub, #btnHelp, #sendMail, #btnEditPub').button();
	
	//help divs
	$('#about').show();
	$('#howItWorks').hide();
	$('#help').hide();
	
	$('#btnHowItWorks').click(function(){
		$('#about').hide();
		$('#howItWorks').show();
		$('#help').hide();
	});
	
	$('#btnAbout').click(function(){
		$('#about').show();
		$('#howItWorks').hide();
		$('#help').hide();
	});
	
	$('#btnHelpPage').click(function(){
		$('#about').hide();
		$('#howItWorks').hide();
		$('#help').show();
	});
});
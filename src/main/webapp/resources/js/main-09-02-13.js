$(document).ready(function() {
	
	$('#btnHome').button({
		icons : {
			primary : 'ui-icon ui-icon-home'
		},
		text: false
	});
	
	// toolbar
	$('#listYourPub, #insertPub, #btnHelp, #btnLogin, #btnLogout, #sendMail, #btnEditPub, #top100').button();
	
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
	
	$('#btnEditPub').click(function(e){
		e.preventDefault();
		if ($('#facebook').val().match('facebook') || $('#twitter').val().match('twitter')) {
			$('#editError').show();
		} else {
			$(this).parents('form:first').submit();
		}
	});
});
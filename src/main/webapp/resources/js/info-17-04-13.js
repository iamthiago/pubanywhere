$(document).ready(function() {
	
	showDivHideOther('infoAbout', 'titlePub');
	
	//accodrion
	$("#accordion").accordion({
		active: false,
		collapsible: true,
		heightStyle : "content"
	});
	
	$('#sendMail').click(function(e){
		e.preventDefault();
		showLoading();
		$.post("/contact", $("form#contactAjaxForm").serialize())
			.done(function(data) {
				hideLoading();
				resultMessageModal(data);
				$('form#contactAjaxForm')[0].reset();
			});
	});
	
	if(window.location.hash == ('#about')){
		$('#accordion').accordion("option", "active", 0);
		showDivHideOther('infoAbout', 'titleAbout');
	}
	
	if(window.location.hash == ('#team')){
		$('#accordion').accordion("option", "active", 0);
		showDivHideOther('infoTeam', 'titleTeam');
	}
	
	if(window.location.hash == ('#story')){
		$('#accordion').accordion("option", "active", 0);
		showDivHideOther('infoStory', 'titleStory');
	}
	
	if(window.location.hash == ('#help')){
		$('#accordion').accordion("option", "active", 1);
		showDivHideOther('infoHelp', 'titleHelp');	
	}
	
	if(window.location.hash == ('#howItWorks')){
		$('#accordion').accordion("option", "active", 1);
		showDivHideOther('infoHowItWorks', 'titleHowItWorks');
	}
	
	if(window.location.hash == ('#feedback')){
		$('#accordion').accordion("option", "active", 2);
		showDivHideOther('infoContact', 'titleContact');
	}
	
	$('.btnAbout').click(function(){
		showDivHideOther('infoAbout', 'titleAbout');
	});
	
	$('.btnTeam').click(function(){
		showDivHideOther('infoTeam', 'titleTeam');
	});
	
	$('.btnStory').click(function(){
		showDivHideOther('infoStory', 'titleStory');
	});
	
	$('.btnHelp').click(function(){
		showDivHideOther('infoHelp', 'titleHelp');
	});
	
	$('.btnHowItWorks').click(function(){
		showDivHideOther('infoHowItWorks', 'titleHowItWorks');
	});
	
	$('.btnFeedback').click(function(){
		showDivHideOther('infoContact', 'titleContact');
	});
});

function showDivHideOther(id, title) {
	$('#infoMainDiv > div').each(function(){
	    if (this.id == id) {
			$(this).show();
		} else {
			$(this).hide();
		}
	});
	
	$('#infoMenus > div').each(function(){
	    if (this.id == title) {
			$(this).show();
		} else {
			$(this).hide();
		}
	});
}
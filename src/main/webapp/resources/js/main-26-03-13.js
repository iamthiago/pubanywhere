$(document).ready(function() {
	
	//loading dialog
	$('#loading').dialog({ autoOpen: false });
	
	//tooltips
	$(document).tooltip();
	
	// toolbar
	$('#listYourPub, #sendMail, #writeReview, #btnInsertPubAjax').button();
	
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
	
	$('#btnInsertPubAjax').click(function(e){
		e.preventDefault()
		showLoading();
		
		if ($('#image').val() == "") {
			$.post("/pubs/registerPub", $("form#pubForm").serialize())
				.done(function(data) {
					hideLoading();
					resultMessageModal(data);
					$('form#pubForm')[0].reset();
				});
		} else {
			var options = {
				url : '/pubs/registerPub',
				success : function(data) {
					hideLoading();
					resultMessageModal(data);
					$('form#pubForm')[0].reset();
				}
			};
			
			$("form#pubForm").ajaxSubmit(options);
		}
	});
});

//function resultMessageModal (modal padrão para mensagem de retorno do controller do tipo ResultMessage.class)
function resultMessageModal(data) {
	$('#resultMessageModal').empty();
	$('#resultMessageModal').append('<div>'+ data[1].value +'</div>');
	
	$('#resultMessageModal').dialog({
		dialogClass: "no-close",
		autoOpen: false,
		modal: true,
		draggable: false,
		resizable: false,
		height: 150,
		width: 550,
		title: data[0].value,
		 buttons : [{
			text : "Ok",
			click : function() {
				$(this).dialog("close");
			}
		}]
	}).dialog('open');
}

function verifyUserProfileImg() {
	$('.userImgProfile').each(function(i){
		var url = $(this).attr('src');
		$(this).remove();
		$.ajax({
			url : url,
			cache : false,
			complete : function() {
				$('#user-pic-span').append('<img src="'+ url +'?'+ new Date().getTime() +'" id="user-pic-img" class="userImgProfile"/>');
				hideLoading();
			}
		});
	});
}

function showLoading() {
	$('#loading').dialog({
		dialogClass: "no-close",
		closeOnEscape: false,
		autoOpen: false,
		modal: true,
		draggable: false,
		resizable: false,
		height: 250,
		width: 550
	}).dialog('open');
}

function hideLoading() {
	$('#loading').dialog("destroy");
	$('#loading').dialog({ autoOpen: false });
}
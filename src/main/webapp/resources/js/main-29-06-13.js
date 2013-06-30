$(document).ready(function() {
	
	$('#leftTabs, #rightTabs').tabs();
	
	//loading dialog
	$('#loading').dialog({ autoOpen: false });
	
	//tooltips
	$(document).tooltip();
	
	// toolbar
	$('#listYourPub, #sendMail, #writeReview, #btnInsertPubAjax').button();
	
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
	
	$('.star-list').each(function() {
		$(this).raty({
			hints: ['', '', '', '', ''],
			path: '/resources/imgs',
			readOnly : true,
			halfShow: false,
			score : $(this).attr('data-number')
		});
	});
	
	//mapSearch	
	$('#nav-location').keydown(function() {
		getMap('nav-location', '#navForm', '#navlat', '#navlng');
	});
	
	$('#location_new').keydown(function() {
		getMap('location_new', '#pubForm', '#lat', '#lng');
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
		var url = $(this).attr('src') + '?' + new Date().getTime();
		$(this).remove();
		$.ajax({
			url : url,
			complete : function() {
				$('.user-pic-span').append('<img src="'+ url +'" id="user-pic-img" class="userImgProfile"/>');
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
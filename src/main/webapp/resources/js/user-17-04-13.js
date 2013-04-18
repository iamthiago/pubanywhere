$(document).ready(function() {
	
	var emailHash = $('#emailHash').val();
	
	$('#profilePicture').dialog({autoOpen: false});
	
	$('#btnEditUserProfile, #btnUpload').button();
	
	$('ul#ul-list-favorites').easyPaginate({
		step:6
	});
		
	$('#btnEditUserProfile').click(function(e){
		e.preventDefault();
		showLoading();
		$.post("/user/saveUserProfile", $("#editUserProfileForm").serialize())
			.done(function(data) {
				hideLoading();
				resultMessageModal(data);
			});
	});
	
	/*onload da tela*/
	$('#userMenuLastReviews').show();
	$('#userMenuEditProfile').hide();
	$('#userMenuFavorites').hide();
	$('#userMenuWishList').hide();
	
	/*botão edit profile*/
	$('#btnUserEditProfile').click(function(e){
		e.preventDefault();
		$('#userMenuLastReviews').hide();
		$('#userMenuEditProfile').show();
		$('#userMenuFavorites').hide();
		$('#userMenuWishList').hide();
	});
	
	/*botão last reviews*/
	$('#btnUserLastReviews').click(function(e){
		e.preventDefault();
		$('#userMenuLastReviews').show();
		$('#userMenuEditProfile').hide();
		$('#userMenuFavorites').hide();
		$('#userMenuWishList').hide();
	});
	
	/*botão favorite*/
	$('#btnUserFavorites').click(function(e){
		e.preventDefault();
		$('#userMenuLastReviews').hide();
		$('#userMenuEditProfile').hide();
		$('#userMenuFavorites').show();
		$('#userMenuWishList').hide();
		
		$('#userMenuFavorites').load("/user/getFavoriteOrWishListPub/FAVORITE/"+emailHash);
	});
	
	/*botão wishlist*/
	$('#btnUserWishList').click(function(e){
		e.preventDefault();
		$('#userMenuLastReviews').hide();
		$('#userMenuEditProfile').hide();
		$('#userMenuFavorites').hide();
		$('#userMenuWishList').show();
		
		$('#userMenuWishList').load("/user/getFavoriteOrWishListPub/WISH_LIST/"+emailHash);
	});
	
	/*profile picture*/	
	$('#btnChangePicture').click(function(e){
		e.preventDefault();
		clearFields();
		$('#profilePicture').show();
		$('#profilePicture').dialog({
			dialogClass: "no-close",
			autoOpen: false,
			modal: true,
			draggable: false,
			resizable: false,
			height: 100,
			width: 550		
		}).dialog('open');
	});
	
	$('#btnUpload').click(function(){
	    $('#file').click();
	});
	
	$('#file').change(function(){
    	$('#fileDesc').append($('#file').val());
    });
	
	$('#btnSendUpload').click(function(e){
		e.preventDefault()
		showLoading();
		
		var img = $('.userImgProfile');
		var src = $(img).attr('src');

		var options = {
			target : img,
			url : '/user/uploadProfilePicture',
			success : function(data) {
				if (data == "") {
					verifyUserProfileImg();
				} else {
					hideLoading();
					resultMessageModal(data);
				}
			}
		};
		
		$("form#uploadForm").ajaxSubmit(options);
    	$('#profilePicture').dialog("destroy");
    	$('#profilePicture').hide();
	});
	
	$('#btnCancelUpload').click(function(e){
		$('#profilePicture').dialog("destroy");
		$('#profilePicture').hide();
	});
	
	function clearFields(){
		$('form#uploadForm')[0].reset();
		$('#fileDesc').empty();
	}
});
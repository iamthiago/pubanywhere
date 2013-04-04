$(document).ready(function() {
	
	$('#shareReview').button();
	
	$('#insertMessage').dialog({ autoOpen: false });
	
	$('#writeReview').click(function(e){
		e.preventDefault();
		clearFields();
		$('#insertMessage').dialog({
			dialogClass: "no-close",
			autoOpen: false,
			modal: true,
			draggable: false,
			resizable: false,
			height: 300,
			width: 550		
		}).dialog('open');
	});
	
	$('#shareReview').click(function(e){
		e.preventDefault();
		showLoading();
		$.post("/user/postPubReview", $("#reviewForm").serialize())
			.done(function(data) {
				$('#insertMessage').dialog('destroy');
				$('#divUserReview').load("/user/getPubReviewsAjax/" + $('#pubId').val());
				$('#insertMessage').hide();
				hideLoading();
			});
	});
	
	$('#btnAddFavorite').click(function(e){
		e.preventDefault();
		$.post("/user/addFavoriteOrWishListPub/" + $('#pubId').val() + "/FAVORITE")
			.done(function(data) {
				checkFavWishButton(data);
				resultMessageModal(data);
			});
	});
	
	$('#btnAddWishList').click(function(e){
		e.preventDefault();
		$.post("/user/addFavoriteOrWishListPub/" + $('#pubId').val() + "/WISH_LIST")
			.done(function(data) {
				checkFavWishButton(data);
				resultMessageModal(data);
			});
	});
	
	$('#star-modal').raty({
		hints: ['', '', '', '', ''],
		path: '/resources/imgs',
		click: function(score, evt) {
			$('#setRating').val(score);
		}
	});
	
	$('#star-pub').each(function() {
		$(this).raty({
			hints: ['', '', '', '', ''],
			path: '/resources/imgs',
			readOnly : true,
			halfShow: false,
			score : $(this).attr('data-number')
		});
	});
	
	function clearFields(){
		$('#reviewForm')[0].reset();
		$('#star-modal').raty('score', 0);
	}	
});

function checkFavWishButton(data) {
	if (data[2].key == 'ADD') {
		if (data[2].value == 'FAVORITE') {
			$('#favorite').addClass('title-h3-checked');
		} else if (data[2].value == 'WISH_LIST') {
			$('#wishList').addClass('title-h3-checked');
		}
	} else if (data[2].key == 'REMOVE') {
		if (data[2].value == 'FAVORITE') {
			$('#favorite').removeClass('title-h3-checked');
		} else if (data[2].value == 'WISH_LIST') {
			$('#wishList').removeClass('title-h3-checked');
		}
	}
}

function getMap(field, form, lat, lng) {
	
	var autocomplete;
	var input = null;
	
	if(document.getElementById(field) != null) {
		input = document.getElementById(field);
		input.focus();
	}
	
	autocomplete = new google.maps.places.Autocomplete(input);
	
	$(window).keydown(function(e){
		if(e.keyCode == 13) {
			e.preventDefault();
			return false;
		}
	});
	
	google.maps.event.addListener(autocomplete, 'place_changed', function() {
		$(form).submit();
	});
	
	$(form).submit(function(e) {
		var place = autocomplete.getPlace();
		if (place == null || place.geometry == null) {
			//e.preventDefault();
			return;
		} else {
			$(lat).val(place.geometry.location.lat());
			$(lng).val(place.geometry.location.lng());
		}
	});
}

var autocomplete;

$(document).ready(function(){

	var input = null;
	
	if(document.getElementById('location_new') != null) {
		input = document.getElementById('location_new');
	}
	
    autocomplete = new google.maps.places.Autocomplete(input);
	
    $(window).keydown(function(e){
		if(e.keyCode == 13) {
			e.preventDefault();
			return false;
		}
	});
    
    google.maps.event.addListener(autocomplete, 'place_changed', function() {
		$('#pubForm').submit();
	});
	
	$('#pubForm').submit(function(e) {
		var place = autocomplete.getPlace();
	    if (place == null || place.geometry == null) {
	      e.preventDefault();
	      return;
	    } else {	    	
	    	$('#lat').val(place.geometry.location.lat());
	    	$('#lng').val(place.geometry.location.lng());
	    }
	});
    
	/*$('#pubForm').submit(function(e) {
		var place = autocomplete.getPlace();
	    if (!place) {
	    	if (document.getElementById('location_new') != null) {
	    		newAutocomplete = new google.maps.places.Autocomplete(document.getElementById('location_new'));
	    		place = newAutocomplete.getPlace();
			} else {
				e.preventDefault();
				return;
			}
	    }
	    
	    $('#lat').val(place.geometry.location.lat());
    	$('#lng').val(place.geometry.location.lng());
	});*/
});
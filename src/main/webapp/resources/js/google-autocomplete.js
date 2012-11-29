var autocomplete;

$(document).ready(function(){
	
	/**
	* autocomplete
	*/
	var input = null;
	
	if(document.getElementById('location') != null) {
		input = document.getElementById('location');
		input.focus();
	} else {
		document.getElementById('pubs-name').focus();
		input = document.getElementById('location_new');
	}
	
    autocomplete = new google.maps.places.Autocomplete(input);

	google.maps.event.addListener(autocomplete, 'place_changed', function() {
		$('#mainForm').submit();
	});
	
	$('#mainForm, #pubForm').submit(function(e) {
		var place = autocomplete.getPlace();
	    if (!place) {
	      e.preventDefault();
	      return;
	    } else {	    	
	    	$('#lat').val(place.geometry.location.lat());
	    	$('#lng').val(place.geometry.location.lng());
	    }
	});
});
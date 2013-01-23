var autocomplete;

$(document).ready(function(){
	
	/**
	* autocomplete
	*/
	var input = null;
	
	if(document.getElementById('location') != null) {
		input = document.getElementById('location');
		input.focus();
	}
	
    autocomplete = new google.maps.places.Autocomplete(input);

	google.maps.event.addListener(autocomplete, 'place_changed', function() {
		$('#mainForm').submit();
	});
	
	$('#mainForm').submit(function(e) {
		var place = autocomplete.getPlace();
	    if (!place.geometry) {
	    	var firstResult = $(".pac-container .pac-item:first").text();
	    	e.preventDefault();
	    	return;
	    } else {	    	
	    	$('#lat').val(place.geometry.location.lat());
	    	$('#lng').val(place.geometry.location.lng());
	    }
	});	
});
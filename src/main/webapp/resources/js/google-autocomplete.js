var autocomplete;

$(document).ready(function(){
	
	/**
	* autocomplete
	*/
	var input = document.getElementById('location');
	input.focus();
    autocomplete = new google.maps.places.Autocomplete(input);
	
	$('#form').submit(function(e) {
		var place = autocomplete.getPlace();
	    if (!place) {
	      input.className = 'notfound';
	      e.preventDefault();
	      return;
	    } else {	    	
	    	$('#lat').val(place.geometry.location.lat());
	    	$('#lng').val(place.geometry.location.lng());
	    }
	});

	google.maps.event.addListener(autocomplete, 'place_changed', function() {
		$('#form').submit();
	});
});
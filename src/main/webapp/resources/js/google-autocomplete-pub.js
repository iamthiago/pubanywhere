var autocomplete;

$(document).ready(function(){
	
	/**
	* autocomplete
	*/
	var input = null;
	
	if(document.getElementById('pubs-name') != null) {
		input = document.getElementById('location_new');
		input.focus();
	}
	
    autocomplete = new google.maps.places.Autocomplete(input);
	
    $(window).keydown(function(e){
		if(e.keyCode == 13) {
			e.preventDefault();
			return false;
		}
	});
    
	$('#pubForm').submit(function(e) {		
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
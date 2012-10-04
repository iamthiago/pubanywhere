$(document).ready(function(){
	
	/**
	 * autocomplete
	 */
	var $location = $('#location');
    $location.focus();

    var autocomplete = new google.maps.places.Autocomplete(
    		$location[0], {types: ["geocode"]});    
});
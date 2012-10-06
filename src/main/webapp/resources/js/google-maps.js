var map;
function initialize() {
    
	var position = new google.maps.LatLng($('#lat').val(), $('#lng').val());
	
	var mapOptions = {
      center: position,
      zoom: 13,
      mapTypeId: google.maps.MapTypeId.ROADMAP
    };
    
    map = new google.maps.Map(document.getElementById('map_canvas'), mapOptions);
    
    var marker = new google.maps.Marker({
        position: position,
        map: map
    });
}
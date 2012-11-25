var map;
function initialize() {
    
	var positionSearch = new google.maps.LatLng($('#lat').val(), $('#lng').val());
	
	var mapOptions = {
      center: positionSearch,
      zoom: 13,
      mapTypeId: google.maps.MapTypeId.ROADMAP
    };
    
    map = new google.maps.Map(document.getElementById('map_canvas'), mapOptions);
    
    var marker1 = new google.maps.Marker({
        position: positionSearch,
        map: map,
        title: "Your Current Search",
        icon: "http://maps.google.com/intl/en_us/mapfiles/ms/micons/blue-dot.png"
    });
	
	var infowindow = new google.maps.InfoWindow();

    var marker;
    
    $.getJSON('praias', function(data) {
    	var i=0;
    	for(i = 0; i < data.length; i++) {
    		marker = new google.maps.Marker({
        		position: new google.maps.LatLng(data[i].lat, data[i].lng),
        		map: map
        	});
    		
    		google.maps.event.addListener(marker, 'click', (function(marker, i) {
        		return function() {
        			infowindow.setContent(String(data[i].nome));
        			infowindow.open(map, marker);
        		}
        	})(marker, i));
    	}
    });
}
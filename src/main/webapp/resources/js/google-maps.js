var map;
function initialize() {
    
	var positionSearch = new google.maps.LatLng($('#lat').val(), $('#lng').val());
	
	var mapOptions = {
      center: positionSearch,
      zoom: 15,
      mapTypeId: google.maps.MapTypeId.ROADMAP
    };
    
    map = new google.maps.Map(document.getElementById('map_canvas'), mapOptions);
    
    var marker1 = new google.maps.Marker({
        position: positionSearch,
        map: map,
        title: "Your Current Search Location"
    });
	
	var infowindow = new google.maps.InfoWindow();

    var marker;
    
    $.post('listNearPubs', {lat:$('#lat').val(), lng:$('#lng').val()}, function(data) {
    	var i=0;
    	for(i = 0; i < data.length; i++) {
    		marker = new google.maps.Marker({
        		position: new google.maps.LatLng(data[i].lat, data[i].lng),
        		map: map,
        		icon: "../resources/imgs/bar.png"
        	});
    		
    		google.maps.event.addListener(marker, 'click', (function(marker, i) {
        		return function() {
        			infowindow.setContent(
        					String(data[i].nome) + '<br>' + 
        					'website: <a href="'+ String(data[i].website) +'" target="_blank">'+ String(data[i].website) +'</a>' + '<br>' +
        					'phone: ' + String(data[i].phone));
        			infowindow.open(map, marker);
        		}
        	})(marker, i));
    	}
    }, "json");
}
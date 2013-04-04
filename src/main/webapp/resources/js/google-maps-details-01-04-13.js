var map;
function initialize() {
	
	var positionSearch = new google.maps.LatLng($('#pubLat').val(), $('#pubLng').val());
	
	var mapOptions = {
      center: positionSearch,
      zoom: 15,
      mapTypeId: google.maps.MapTypeId.ROADMAP
    };
    
    map = new google.maps.Map(document.getElementById('pubMap'), mapOptions);
    
    var marker1 = new google.maps.Marker({
        position: positionSearch,
        map: map,
        title: $('#pubName').val()
    });
}
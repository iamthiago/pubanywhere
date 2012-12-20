var map;
function initialize() {
	
	var legend = document.getElementById('legend');
	
	var positionSearch = new google.maps.LatLng($('#lat').val(), $('#lng').val());
	
	var mapOptions = {
      center: positionSearch,
      zoom: 15,
      mapTypeId: google.maps.MapTypeId.ROADMAP
    };
    
    map = new google.maps.Map(document.getElementById('map_canvas'), mapOptions);
    
    map.controls[google.maps.ControlPosition.RIGHT_BOTTOM].push(legend);
    
    var marker1 = new google.maps.Marker({
        position: positionSearch,
        map: map,
        title: "Your Current Search Location"
    });
	
	var infowindow = new google.maps.InfoWindow();

    var marker;
    
    function getWebsite(data, i){
    	var website;
    	
    	if (data[i].website == null || data[i].website == '') {
    		website = '';
		} else {
			website = '<img border="0" align="left" src="../resources/imgs/laptop.png">&nbsp; <a href="'+ String(data[i].website) +'" target="_blank">'+ String(data[i].website) +'</a>' + '<br>';
		}
    	
    	return website;
    }
    
    function getPhone(data, i){
    	var phone;
    	
    	if (data[i].phone == null || data[i].phone == '') {
    		phone = '';
		} else {
			phone = '<img border="0" align="left" src="../resources/imgs/phone.png">&nbsp;' + String(data[i].phone) + '<br>';
		}
    	
    	return phone;
    }
    
    function getEmail(data, i){
    	var email;
    	
    	if (data[i].email == null || data[i].email == '') {
    		email = '';
		} else {
			email = '<img border="0" align="left" src="../resources/imgs/mail.png">&nbsp; <a href="mailto:' + String(data[i].email) + '?subject=Info">' + String(data[i].email) + '</a>';
		}
    	
    	return email;
    }
    
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
        					'<center>' + String(data[i].nome) + '&nbsp <a href="' + location.host +'pubs/'+ String(data[i].pubId) + '"><img border="0" align="center" src="../resources/imgs/detail.png"></a></center>' +
        					getWebsite(data, i) + 
        					getPhone(data, i) + 
        					getEmail(data, i));
        			
        			infowindow.open(map, marker);
        		}
        	})(marker, i));
    	}
    }, "json");
}
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<html>
	<head>
		<script type="text/javascript" src="<c:url value='/resources/js/jquery-1.8.0.min.js' />"></script>
		
		<script src="https://maps.googleapis.com/maps/api/js?sensor=false&libraries=places"></script>
		
		<script type="text/javascript">
			function initialize() {
			    var geocoder = new google.maps.Geocoder();
			    var latlng = new google.maps.LatLng(-34.397, 150.644);
			    var mapOptions = {
			      zoom: 8,
			      center: latlng,
			      mapTypeId: google.maps.MapTypeId.ROADMAP
			    }
			    var map = new google.maps.Map(document.getElementById('map_canvas'), mapOptions);
			}
			  
	
			function codeAddress() {
			  var address = document.getElementById('address').value;
			  geocoder.geocode( { 'address': address}, function(results, status) {
			    if (status == google.maps.GeocoderStatus.OK) {
			      map.setCenter(results[0].geometry.location);
			      var marker = new google.maps.Marker({
			          map: map,
			          position: results[0].geometry.location
			      });
			    } else {
			      alert('Geocode was not successful for the following reason: ' + status);
			    }
			  });
			}
		</script>
	</head>
	<body onload="initialize()">
		<div>
			<input id="address" type="textbox" value="Sydney, NSW">
			<input type="button" value="Geocode" onclick="codeAddress()">
		</div>
		<div id="map_canvas" style="height:90%;top:30px"></div>
	</body>
</html>
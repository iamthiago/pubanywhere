<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<jsp:include page="includes/header-maps.jsp"/>
	
	<body onload="initialize()">
		<input type="hidden" id="lat" name="lat" value="${param.lat}">
    	<input type="hidden" id="lng" name="lng" value="${param.lng}">

		<div style="width: 400px; height: 400px;" id="map_canvas"></div>
	</body>
</html>
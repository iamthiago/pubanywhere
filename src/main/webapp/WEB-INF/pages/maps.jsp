<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<jsp:include page="includes/header-maps.jsp"/>
	
	<body onload="initialize()" style="overflow: hidden;">
	
		<jsp:include page="includes/navigator.jsp"/>
	
		<input type="hidden" id="lat" name="lat" value="${param.lat}">
    	<input type="hidden" id="lng" name="lng" value="${param.lng}">

		<div style="width: auto; height: 500px;" id="map_canvas"></div>
		<div id="legend">
			<h3>
				<div style="text-align: center;"><spring:message code="map.legend.title"/></div><br>
				<img src="<c:url value='/resources/imgs/detail.png'/>">&nbsp;
					<span>
						<spring:message code="map.legend.details"/>
					</span>
				<br>
				
				<img src="<c:url value='/resources/imgs/laptop.png'/>">&nbsp;
				<span>
					Website
				</span>
				<br>
				
				<img src="<c:url value='/resources/imgs/phone.png'/>">&nbsp;
				<span>
					<spring:message code="map.legend.phone"/>
				</span>
				<br>
				
				<img src="<c:url value='/resources/imgs/mail.png'/>">&nbsp;
				<span>
					<spring:message code="map.legend.mail"/>
				</span>
			</h3>
		</div>
	</body>
</html>
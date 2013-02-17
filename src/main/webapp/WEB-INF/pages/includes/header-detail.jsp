<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
		
		<title>Pub Anywhere - ${pub.name}</title>
		
		<jsp:include page="default.jsp"/>
		<jsp:include page="social.jsp"/>
		
		<script type="text/javascript" src="<c:url value='/resources/js/google-maps-details-16-02-13.js' />"></script>
		<script src="https://maps.googleapis.com/maps/api/js?sensor=false&libraries=places"></script>
				
	</head>
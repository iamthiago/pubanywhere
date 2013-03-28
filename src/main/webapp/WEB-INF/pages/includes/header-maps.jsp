<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<link type="text/css" href="<c:url value='/resources/css/main-27-03-13.css' />" rel="stylesheet" />
		<link type="text/css" href="<c:url value='/resources/css/footer-27-03-13.css' />" rel="stylesheet" />
		
		<link type="text/css" href="<c:url value='/resources/css/black-tie/jquery-ui-1.10.2.custom.css' />" rel="stylesheet" />
		
		<script type="text/javascript" src="<c:url value='/resources/js/jquery/jquery-1.9.1.js' />"></script>
	    <script type="text/javascript" src="<c:url value='/resources/js/jquery/jquery-ui-1.10.2.custom.js' />"></script>
		
		<script type="text/javascript" src="<c:url value='/resources/js/main-27-03-13.js' />"></script>
		<script type="text/javascript" src="<c:url value='/resources/js/google-maps-27-03-13.js' />"></script>
		
		<script src="https://maps.googleapis.com/maps/api/js?sensor=false&libraries=places"></script>
		<title><spring:message code="window.main"/></title>
	</head>
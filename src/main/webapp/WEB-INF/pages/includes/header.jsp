<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
	<head>
	    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	    <title>Pub Anywhere</title>
	    <link type="text/css" href="<c:url value='/resources/css/main.css' />" rel="stylesheet" />
	    <link type="text/css" href="<c:url value='/resources/css/pubs.css' />" rel="stylesheet" />
	    <link type="text/css" href="<c:url value='/resources/css/black-tie/jquery-ui-1.8.23.custom.css' />" rel="stylesheet" />
	    
	    <script type="text/javascript" src="<c:url value='/resources/js/jquery-1.8.0.min.js' />"></script>
	    <script type="text/javascript" src="<c:url value='/resources/js/jquery-ui-1.8.23.custom.min.js' />"></script>
		<script type="text/javascript" src="<c:url value='/resources/js/jquery.dataTables.min.js' />"></script>
		
		<script type="text/javascript" src="<c:url value='/resources/js/dataTablesDefault.js' />"></script>
		<script type="text/javascript" src="<c:url value='/resources/js/main.js' />"></script>
		
		<script src="https://maps.googleapis.com/maps/api/js?sensor=false&libraries=places"></script>
		<script type="text/javascript" src="<c:url value='/resources/js/google-autocomplete.js' />"></script>
		<script type="text/javascript" src="<c:url value='/resources/js/google-maps.js' />"></script>
	</head>
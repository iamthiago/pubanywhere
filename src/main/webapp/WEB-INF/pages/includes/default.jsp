<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<html>
	<head>
		<title><spring:message code="window.main"/></title>
		
	    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	    <link type="text/css" href="<c:url value='/resources/css/main-29-06-13.css' />" rel="stylesheet" />
	    <link type="text/css" href="<c:url value='/resources/css/detail-29-06-13.css' />" rel="stylesheet" />
	    <link type="text/css" href="<c:url value='/resources/css/registerPub-29-06-13.css' />" rel="stylesheet" />
	    <link type="text/css" href="<c:url value='/resources/css/footer-29-06-13.css' />" rel="stylesheet" />
	    <link type="text/css" href="<c:url value='/resources/css/help-29-06-13.css' />" rel="stylesheet" />
	    <link type="text/css" href="<c:url value='/resources/css/backoffice-29-06-13.css' />" rel="stylesheet" />
	    <link type="text/css" href="<c:url value='/resources/css/listPubs-29-06-13.css' />" rel="stylesheet" />
	    <link type="text/css" href="<c:url value='/resources/css/login-29-06-13.css' />" rel="stylesheet" />
	    <link type="text/css" href="<c:url value='/resources/css/user-29-06-13.css' />" rel="stylesheet" />
	    <link type="text/css" href="<c:url value='/resources/css/dataTablesCustom.css' />" rel="stylesheet" />
	    
	    <link type="text/css" href="<c:url value='/resources/css/black-tie/jquery-ui-1.10.2.custom.css' />" rel="stylesheet" />
	    <link type="text/css" href="<c:url value='/resources/css/datatables/css/jquery.dataTables.css' />" rel="stylesheet" />
	    <link type="text/css" href="<c:url value='/resources/css/datatables/css/jquery.dataTables_themeroller.css' />" rel="stylesheet" />
	    
	    <script type="text/javascript" src="<c:url value='/resources/js/jquery/jquery-1.9.1.js' />"></script>
	    <script type="text/javascript" src="<c:url value='/resources/js/jquery/jquery-ui-1.10.2.custom.js' />"></script>
		<script type="text/javascript" src="<c:url value='/resources/js/jquery/jquery.dataTables.min.js' />"></script>
		
	    <script type="text/javascript" src="<c:url value='/resources/js/jquery/jquery.easyPaginate.js' />"></script>
		<script type="text/javascript" src="<c:url value='/resources/js/jquery/jquery.lazyload.js' />"></script>
	    <script type="text/javascript" src="<c:url value='/resources/js/jquery/jquery.form.js' />"></script>
		
		<script type="text/javascript" src="<c:url value='/resources/js/dataTablesDefault.js' />"></script>
		<script type="text/javascript" src="<c:url value='/resources/js/main-29-06-13.js' />"></script>
		<script type="text/javascript" src="<c:url value='/resources/js/info-29-06-13.js' />"></script>
		
		<script type="text/javascript" src="<c:url value='/resources/js/google-autocomplete.js' />"></script>
		<script src="https://maps.googleapis.com/maps/api/js?sensor=false&libraries=places"></script>
		
		<script language="javascript" src="<c:url value='/resources/js/jquery/jquery.maxlenght.min.js' />"></script>
	    <script type="text/javascript">
		    jQuery(document).ready(function($) {
	             //Set maxlength of all the textarea (call plugin)
	             $().maxlength();
		    })
		</script>
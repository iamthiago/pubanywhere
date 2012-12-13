<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
	<head>
	    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	    <title>Pub Anywhere</title>
	    <link type="text/css" href="<c:url value='/resources/css/main.css' />" rel="stylesheet" />
	    <link type="text/css" href="<c:url value='/resources/css/registerPub.css' />" rel="stylesheet" />
	    <link type="text/css" href="<c:url value='/resources/css/footer.css' />" rel="stylesheet" />
	    <link type="text/css" href="<c:url value='/resources/css/dataTablesCustom.css' />" rel="stylesheet" />
	    
	    <link type="text/css" href="<c:url value='/resources/css/black-tie/jquery-ui-1.8.23.custom.css' />" rel="stylesheet" />
	    <link type="text/css" href="<c:url value='/resources/css/datatables/css/jquery.dataTables.css' />" rel="stylesheet" />
	    <link type="text/css" href="<c:url value='/resources/css/datatables/css/jquery.dataTables_themeroller.css' />" rel="stylesheet" />
	    
	    <script type="text/javascript" src="<c:url value='/resources/js/jquery-1.8.0.min.js' />"></script>
	    <script type="text/javascript" src="<c:url value='/resources/js/jquery-ui-1.8.23.custom.min.js' />"></script>
		<script type="text/javascript" src="<c:url value='/resources/js/jquery.dataTables.min.js' />"></script>
		
		<script type="text/javascript" src="<c:url value='/resources/js/dataTablesDefault.js' />"></script>
		<script type="text/javascript" src="<c:url value='/resources/js/main.js' />"></script>		
		
		<script src="https://maps.googleapis.com/maps/api/js?sensor=false&libraries=places"></script>
		<script type="text/javascript" src="https://apis.google.com/js/plusone.js"></script>
		
		<div id="fb-root"></div>
		<script>(function(d, s, id) {
		  var js, fjs = d.getElementsByTagName(s)[0];
		  if (d.getElementById(id)) return;
		  js = d.createElement(s); js.id = id;
		  js.src = "//connect.facebook.net/pt_BR/all.js#xfbml=1";
		  fjs.parentNode.insertBefore(js, fjs);
		}(document, 'script', 'facebook-jssdk'));</script>

		<script>!function(d,s,id){var js,fjs=d.getElementsByTagName(s)[0];if(!d.getElementById(id)){js=d.createElement(s);js.id=id;js.src="//platform.twitter.com/widgets.js";fjs.parentNode.insertBefore(js,fjs);}}(document,"script","twitter-wjs");</script>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

		<title><spring:message code="window.register"/></title>
		
	    <jsp:include page="default.jsp"/>
		
		<script type="text/javascript" src="<c:url value='/resources/js/google-autocomplete-pub-17-02-13.js' />"></script>
		<script src="https://maps.googleapis.com/maps/api/js?sensor=false&libraries=places"></script>
	    
	    <script language="javascript" src="<c:url value='/resources/js/jquery/jquery.maxlenght.min.js' />"></script>
	    <script type="text/javascript">
		    jQuery(document).ready(function($) {
	             //Set maxlength of all the textarea (call plugin)
	             $().maxlength();
		    })
		</script>
	</head>
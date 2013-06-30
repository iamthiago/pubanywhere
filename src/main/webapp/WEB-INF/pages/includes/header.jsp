<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<html>
	<head>
		<title><spring:message code="window.main"/></title>
		
		<jsp:include page="default.jsp"/>
		<jsp:include page="social.jsp"/>
		
		<link rel="image_src" href="https://s3.amazonaws.com/pubanywhere/pub-logo.png" />
		<meta name="description" content="Pub Anywhere brings to you all bars/pubs in the world!" />
		
		<meta property="og:title" content="Pub Anywhere" />
		<meta property="og:url" content="http://www.pubanywhere.com/" />
		<meta property="og:image" content="https://s3.amazonaws.com/pubanywhere/pub-logo.png" />
		<meta property="og:site_name" content="Pub Anywhere" />
		<meta property="og:description" content="Pub Anywhere brings to you all bars/pubs in the world!"/>
		
		<script type="text/javascript" src="<c:url value='/resources/js/jquery/jquery.raty.js' />"></script>
	</head>
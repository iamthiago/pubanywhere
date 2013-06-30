<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		
		<jsp:include page="default.jsp"/>
		
		<script type="text/javascript" src="<c:url value='/resources/js/google-maps-29-06-13.js' />"></script>
		
		<title><spring:message code="window.main"/></title>
	</head>
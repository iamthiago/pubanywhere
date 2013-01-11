<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<div id="div-navigator" class="navigator">
	
	<div id="left-buttons">
		<c:url value="/" var="home"></c:url>
		<a href="${home}" id="btnHome" class="icons"/>
	</div>
	
	<div id="right-buttons">
		<%-- <c:url value="/pubs" var="pubs"></c:url>
		<a href="${pubs}" id="listYourPub" class="nav-buttons"><spring:message code="nav.button.place"/></a> --%>
		
		<c:url value="/help" var="help"></c:url>
		<a href="${help}" id="btnHelp" class="nav-buttons"><spring:message code="nav.button.help"/></a>
	</div>
</div>
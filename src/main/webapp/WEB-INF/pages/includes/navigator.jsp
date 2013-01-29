<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<div id="div-navigator" class="navigator">
	
	<div id="left-buttons">
		<c:url value="/" var="home"></c:url>
		<a href="${home}" id="btnHome" class="icons"/>
	</div>
	
	<div id="right-buttons">
		<c:url value="/pubs/top100World" var="top100"></c:url>
		<%-- <a href="${top100}" id="top100" title="Top 100">
			<img src="<c:url value='/resources/imgs/podium.png'/>" alt="Top 100" title="Top 100">
		</a> --%>
		
		<a href="${top100}" id="top100" class="nav-buttons">Top 100</a>
		
		<c:url value="/backoffice" var="backoffice"></c:url>
		<a href="${backoffice}" id="btnLogin" class="nav-buttons"><spring:message code="nav.button.login"/></a>
		
		<c:url value="/help" var="help"></c:url>
		<a href="${help}" id="btnHelp" class="nav-buttons"><spring:message code="nav.button.help"/></a>
	</div>
</div>
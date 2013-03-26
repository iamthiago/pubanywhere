<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<div id="div-navigator" class="navigator">
	<div>
		<div id="nav-inside" class="gradient">
			<div id="left-buttons">
				<c:url value="/" var="home"></c:url>
				<a href="${home}" id="btnHome" class="nav-buttons" title="<spring:message code="window.main.pubanywhere"/>">Pub Anywhere</a>				
			</div>
			
			<div id="right-buttons">
				<sec:authorize access="!hasRole('ROLE_USER')">
					<c:url value="/login" var="login"></c:url>
					<a href="${login}" id="navLogin" class="nav-buttons"><spring:message code="login.signin"/></a>
				</sec:authorize>
				
				<c:url value="/pubs/top100World" var="top100"></c:url>		
				<a href="${top100}" id="top100" class="nav-buttons">Top 100</a>
				
				<c:url value="/help" var="help"></c:url>
				<a href="${help}" id="btnHelp" class="nav-buttons"><spring:message code="nav.button.help"/></a>
				
				<c:url value="/pubs/registerPub" var="register"></c:url>
				<a href="${register}" id="listYourPub" class="nav-buttons"><spring:message code="form.pub.title"/></a>
				
				<sec:authorize access="hasRole('ROLE_USER')">
					<c:url value="/me" var="userProfile"></c:url>
					<a href="${userProfile}" id="myProfileName" title="<spring:message code="window.userpage"/>">${loggedUser.pubUser.name}</a>
				</sec:authorize>
			</div>
		</div>
	</div>
</div>
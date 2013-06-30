<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<div id="div-navigator" class="navigator">
	<div>
		<div id="nav-inside" class="gradient">
			<div id="left-buttons">
				<c:url value="/" var="home"></c:url>
				<a href="${home}" id="btnHome" class="nav-buttons">Pub Anywhere</a>
				
				<div id="searchNav">
					<form action="/pubs/maps" method='POST' id="navForm">
						<input type="hidden" id="navlat" name="lat">
		    			<input type="hidden" id="navlng" name="lng">
		    			
						<span class="nav-input-box">
							<small id="small-glass"></small>
							<input type='text' id="nav-location" name="nav-location" placeholder="<spring:message code="main.search"/>" autocomplete="off" class="location">
						</span>
					</form>
				</div>
			</div>
			
			<div id="right-buttons">
				<sec:authorize access="!hasRole('ROLE_USER')">
					<c:url value="/login" var="login"></c:url>
					<a href="${login}" id="navLogin" class="nav-buttons"><spring:message code="login.signin"/></a>
				</sec:authorize>
				
				<c:url value="/pubs/top100World" var="top100"></c:url>		
				<a href="${top100}" id="top100" class="nav-buttons">Top 100</a>
				
				<c:url value="/info#help" var="info"></c:url>
				<a href="${info}" id="btnNavHelp" class="nav-buttons"><spring:message code="nav.button.help"/></a>
				
				<c:url value="/pubs/registerPub" var="register"></c:url>
				<a href="${register}" id="listYourPub" class="nav-buttons"><spring:message code="form.pub.title"/></a>
				
				<sec:authorize access="hasRole('ROLE_USER')">
					<c:url value="/me" var="userProfile"></c:url>
					<a href="${userProfile}" id="myProfileName">${loggedUser.pubUser.name}</a>
				</sec:authorize>
				
				<a href="?lang=en_US" class="marginLeft20px">
					<img src="<c:url value='/resources/imgs/usa.png'/>">&nbsp;
				</a>
				<a href="?lang=pt_BR">
					<img src="<c:url value='/resources/imgs/brazil.png'/>">&nbsp;
				</a>
			</div>
		</div>
	</div>
</div>
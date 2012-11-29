<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<div id="div-navigator">
	
	<div id="left-buttons">
		<c:url value="/" var="home"></c:url>
		<a href="${home}" id="btnHome" class="icons"/>
	</div>
	
	<div id="right-buttons">
		<c:url value="/pubs" var="pubs"></c:url>
		<a href="${pubs}" id="listYourPub" class="nav-buttons">List your place</a>
	</div>
</div>
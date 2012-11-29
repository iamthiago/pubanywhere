<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<div id="div-navigator">
	<div id="right-buttons">
		<c:url value="/pubs" var="pubs"></c:url>
		
		<a href="${pubs}" id="listYourPub" class="nav-buttons">List your place</a>
		<a href="${pubs}" id="signin" class="nav-buttons">Sign In</a>
	</div>
</div>
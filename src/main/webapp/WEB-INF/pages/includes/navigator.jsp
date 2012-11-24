<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<div id="div-navigator">
	<div id="right-buttons">
		<c:url value="/registerPub" var="registerPub"></c:url>
		
		<a href="${registerPub}" id="listYourPub" class="nav-buttons">List your place</a>
		<a href="${registerPub}" id="signin" class="nav-buttons">Sign In</a>
	</div>
</div>
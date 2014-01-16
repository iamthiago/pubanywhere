<form:form action="" method='POST' id="reviewForm" commandName="messageForm" acceptCharset="UTF-8">
	<form:hidden path="pubId" value="${pub.pubId}"/>
	<form:hidden path="rating" id="setRating"/>
	
	<div class="star-user star phone"></div>
</form:form>
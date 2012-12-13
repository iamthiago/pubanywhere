<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<div id="div-navigator">
	
	<div id="left-buttons">
		<c:url value="/" var="home"></c:url>
		<a href="${home}" id="btnHome" class="icons"/>
	</div>
	
	<div id="socialPlugins">
		<div id="googleOne">
			<div class="g-plusone"></div>
		</div>
		
		<div id="facebookLike">
			<div 
				class="fb-like" 
				data-href="http://www.facebook.com/pubanywhere" 
				data-send="false" 
				data-layout="button_count" 
				data-width="450" 
				data-show-faces="false" 
				data-font="arial" 
				data-colorscheme="light">
			</div>
		</div>
		
		<div id="twitterFollow">
			<a href="https://twitter.com/pubanywhere" class="twitter-follow-button" data-show-count="true" data-show-screen-name="false">Follow @pubanywhere</a>
		</div>
	</div>
	
	<div id="right-buttons">
		<c:url value="/pubs" var="pubs"></c:url>
		<a href="${pubs}" id="listYourPub" class="nav-buttons"><spring:message code="nav.button.place"/></a>
		
		<c:url value="/contact" var="contact"></c:url>
		<a href="${contact}" id="btnContact" class="nav-buttons"><spring:message code="nav.button.contact"/></a>
	</div>
</div>
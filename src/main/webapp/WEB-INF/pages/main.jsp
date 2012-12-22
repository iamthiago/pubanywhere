<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<jsp:include page="includes/header.jsp"/>

<body class="overflow">
	
	<jsp:include page="includes/navigator.jsp"/>
	
	<div id="main_content">
		<div class="div-pub-image">
			<img src="<c:url value='/resources/imgs/pub-full-logo-beta.png'/>">
		</div>
		<div class="div-search-bar">
			<form action="/pubs/maps" method='POST' id="mainForm">
			
				<input type="hidden" id="lat" name="lat">
    			<input type="hidden" id="lng" name="lng">
    			
				<div class="input-box">
					<input type='text' id="location" name="location" placeholder="<spring:message code="main.search"/>" autocomplete="off" class="location">
				</div>
			</form>
		</div>		
	</div>
	
	<div id="socialPlugins">
		<div id="googleOne">
			<div class="g-plusone"></div>
		</div>
		
		<div id="facebookLike">
			<div
				class="fb-like-box"
				data-href="http://www.facebook.com/pubanywhere"
				data-width="292"
				data-show-faces="false"
				data-stream="false"
				data-header="false">
			</div>
		</div>
		
		<div id="twitterFollow">
			<a href="https://twitter.com/pubanywhere" class="twitter-follow-button" data-show-count="true" data-show-screen-name="false">Follow @pubanywhere</a>
		</div>
	</div>
	
	<script type="text/javascript">

	  var _gaq = _gaq || [];
	  _gaq.push(['_setAccount', 'UA-36976376-1']);
	  _gaq.push(['_trackPageview']);
	
	  (function() {
	    var ga = document.createElement('script'); ga.type = 'text/javascript'; ga.async = true;
	    ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';
	    var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(ga, s);
	  })();
	
	</script>	
</body>
</html>
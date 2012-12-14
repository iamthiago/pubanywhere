<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<jsp:include page="includes/header.jsp"/>

<body style="overflow: hidden;">
	
	<jsp:include page="includes/navigator.jsp"/>
	
	<div id="main_content">
		<div class="div-pub-image">
			<img src="<c:url value='/resources/imgs/pub-full-logo-beta.png'/>">
		</div>
		<div class="div-search-bar">
			<form action="pubs/maps" method='POST' id="mainForm">
			
				<input type="hidden" id="lat" name="lat">
    			<input type="hidden" id="lng" name="lng">
    			
				<div class="input-box">
					<input type='text' id="location" name="location" placeholder="<spring:message code="main.search"/>" autocomplete="off" class="location">
				</div>
			</form>
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
	
	<div class="footerDown">
		<jsp:include page="includes/footer.jsp"/>
	</div>
	
</body>
</html>
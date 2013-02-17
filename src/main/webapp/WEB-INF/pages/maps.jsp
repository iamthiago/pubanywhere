<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<jsp:include page="includes/header-maps.jsp"/>
	
	<body id="mapsBody" onload="initialize()" class="degrade">
	
		<jsp:include page="includes/navigator.jsp"/>
	
		<input type="hidden" id="lat" name="lat" value="${param.lat}">
    	<input type="hidden" id="lng" name="lng" value="${param.lng}">

		<div style="width: auto; height: 500px;" id="map_canvas"></div>
		<div id="legend">
			<h3>
				<div style="text-align: center;"><spring:message code="map.legend.title"/></div><br>
				<img src="<c:url value='/resources/imgs/detail.png'/>">&nbsp;
					<span>
						<spring:message code="map.legend.details"/>
					</span>
				<br>
				
				<img src="<c:url value='/resources/imgs/laptop.png'/>">&nbsp;
				<span>
					Website
				</span>
				<br>
				
				<img src="<c:url value='/resources/imgs/phone.png'/>">&nbsp;
				<span>
					<spring:message code="map.legend.phone"/>
				</span>
				<br>
				
				<img src="<c:url value='/resources/imgs/mail.png'/>">&nbsp;
				<span>
					<spring:message code="map.legend.mail"/>
				</span>
			</h3>
		</div>
		
		<div id="adsMaps">
			<div id="adsLeft" class="adsPicsLeftRight">
				<script type="text/javascript"><!--
					google_ad_client = "ca-pub-9435637599979561";
					/* Maps - Left */
					google_ad_slot = "3923394892";
					google_ad_width = 468;
					google_ad_height = 60;
					//-->
				</script>
				<script type="text/javascript"
					src="http://pagead2.googlesyndication.com/pagead/show_ads.js">
				</script>
			</div>
			
			<div id="adsRight" class="adsPicsLeftRight">
				<script type="text/javascript"><!--
					google_ad_client = "ca-pub-9435637599979561";
					/* Maps - Right */
					google_ad_slot = "6876861293";
					google_ad_width = 468;
					google_ad_height = 60;
					//-->
				</script>
				<script type="text/javascript"
					src="http://pagead2.googlesyndication.com/pagead/show_ads.js">
				</script>
			</div>
		</div>
		
		<jsp:include page="includes/footer.jsp"/>
		
	</body>
</html>
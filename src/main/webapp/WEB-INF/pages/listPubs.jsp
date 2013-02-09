<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<jsp:include page="includes/header-listPubs.jsp"/>

<body>
	
	<jsp:include page="includes/navigator.jsp"/>

	<div id="main-pubs-list">
		<div id="listHeader">
			<h1>${listTitle}</h1>
		</div>
		
		<div id="div-table">
			<ul id="ul-list">
				<c:forEach items="${pubs}" var="pub">
					<c:url value="/pubs/${pub.pubId}" var="pubDetails"></c:url>
						<li class="li-pub-item">
							<a href="${pubDetails}">
								<div class="navigator div-img">
									<img src="https://s3.amazonaws.com/pubanywhere/${pub.pubId}"/>
								</div>
								<div class="nav_white">
									<div id="pubName">
										${pub.name}
									</div>
									<div id="pubCity">
										${pub.city}
									</div>
									<div id="pubCountry">
										${pub.country}
									</div>
									<%-- <div id="views">
										${pub.pubViews}
									</div> --%>
								</div>
							</a>
						</li>
				</c:forEach>
			</ul>
		</div>
		
		<div id="adsTop100">
			<div id="adsLeftTop100">
				<script type="text/javascript"><!--
					google_ad_client = "ca-pub-9435637599979561";
					/* top100 - left */
					google_ad_slot = "7421918091";
					google_ad_width = 120;
					google_ad_height = 600;
					//-->
				</script>
				<script type="text/javascript"
					src="http://pagead2.googlesyndication.com/pagead/show_ads.js">
				</script>
			</div>
			
			<div id="adsRightTop100">
				<script type="text/javascript"><!--
					google_ad_client = "ca-pub-9435637599979561";
					/* top100 - right */
					google_ad_slot = "8898651298";
					google_ad_width = 120;
					google_ad_height = 600;
					//-->
				</script>
				<script type="text/javascript"
					src="http://pagead2.googlesyndication.com/pagead/show_ads.js">
				</script>
			</div>
		</div>
	</div>
	
	<jsp:include page="includes/footer.jsp"/>
	
</body>
</html>
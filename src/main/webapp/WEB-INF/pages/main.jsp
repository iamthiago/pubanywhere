<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<jsp:include page="includes/header.jsp"/>

<body class="overflow">
	
	<jsp:include page="includes/navigator.jsp"/>
	
	<div>
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
					<div id="ie">
						<spring:message code="main.ie"/>
					</div>
				</form>
			</div>
		</div>
	</div>
	
	<div id="socialPlugins">
		<div id="googleOne">
			<div class="g-plusone" data-width="300"></div>
		</div>
		
		<div id="twitterFollow">
			<a href="https://twitter.com/pubanywhere" class="twitter-follow-button" data-show-count="true" data-show-screen-name="false">Follow @pubanywhere</a>
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
	</div>
	
	<div id="adsPics">
		<div id="adsLeft" class="adsPicsLeftRight">
			<script type="text/javascript"><!--
				google_ad_client = "ca-pub-9435637599979561";
				/* main - pics - left */
				google_ad_slot = "1514985299";
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
				/* main - pics - right */
				google_ad_slot = "2991718495";
				google_ad_width = 468;
				google_ad_height = 60;
				//-->
			</script>
			<script type="text/javascript"
				src="http://pagead2.googlesyndication.com/pagead/show_ads.js">
			</script>
		</div>
	</div>
	
	<div id="divCountrys">
		<div class="navigator">
		</div>
		<div id="postalPics">
			<table>
				<tbody>
					<tr>
						<td>
							<a href="<c:url value="/pubs/country/Brazil"></c:url>">
								<div class="navigator">
									<img src="<c:url value='/resources/imgs/flags/brazil.jpg'/>">
								</div>
								<div class="nav_white">
									<spring:message code="country.brazil"/>
								</div>
							</a>
						</td>
						<td>
							<a href="<c:url value="/pubs/country/United States"></c:url>">
								<div class="navigator">
									<img src="<c:url value='/resources/imgs/flags/united_states.jpg'/>">
								</div>
								<div class="nav_white">
									<spring:message code="country.unitedstates"/>
								</div>
							</a>
						</td>
						<td>
							<a href="<c:url value="/pubs/country/Argentina"></c:url>">
								<div class="navigator">
									<img src="<c:url value='/resources/imgs/flags/argentina.jpg'/>">
								</div>
								<div class="nav_white">
									<spring:message code="country.argentina"/>
								</div>
							</a>
						</td>
					</tr>
					<%-- <tr>
						<td>
							<a href="${listPubsPerCountry}/Germany">
								<div class="navigator">
									<img src="<c:url value='/resources/imgs/flags/germany.jpg'/>">
								</div>
								<div class="nav_white">
									<spring:message code="country.germany"/>
								</div>
							</a>
						</td>
						<td>
							<a href="${listPubsPerCountry}/England">
								<div class="navigator">
									<img src="<c:url value='/resources/imgs/flags/england.jpg'/>">
								</div>
								<div class="nav_white">
									<spring:message code="country.england"/>
								</div>
							</a>
						</td>
						<td>
							<a href="${listPubsPerCountry}/Ireland">
								<div class="navigator">
									<img src="<c:url value='/resources/imgs/flags/ireland.jpg'/>">
								</div>
								<div class="nav_white">
									<spring:message code="country.ireland"/>
								</div>
							</a>
						</td>
					</tr> --%>
				</tbody>
			</table>
		</div>
		
		<jsp:include page="includes/footer.jsp"/>
		
	</div>
	
</body>
</html>
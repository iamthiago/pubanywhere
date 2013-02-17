<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<jsp:include page="includes/header.jsp"/>

<body>
	<div id="principal">
		<jsp:include page="includes/navigator.jsp"/>
		<div id="content" class="degrade">
			<div>
				<div class="back_content">
					<div>
						<div id="searchPub">
							<h1><spring:message code="main.title"/></h1>
							<div id="searchInput">
								<form action="/pubs/maps" method='POST' id="mainForm">
				
								<input type="hidden" id="lat" name="lat">
				    			<input type="hidden" id="lng" name="lng">
				    			
								<span class="input-box">
									<small id="glass"></small>
									<input type='text' id="location" name="location" placeholder="<spring:message code="main.search"/>" autocomplete="off" class="location">
								</span>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div id="mainCountry">
				<div>
					<h2><spring:message code="main.country"/></h2>
					<div id="countryPics">
						<div id="country-inner">
							<div id="slides">
					            <div class="slides_container">
					                <div id="slide1">
					                	<div id="usa">
						                    <a href="<c:url value="/pubs/country/United States"></c:url>">
												<img src="<c:url value='/resources/imgs/flags/united_states.jpg'/>">
												<small>
													<spring:message code="country.unitedstates"/>
												</small>
											</a>
						                </div>
						                <div id="ireland">
						                    <a href="<c:url value="/pubs/country/Ireland"></c:url>">
												<img src="<c:url value='/resources/imgs/flags/ireland.jpg'/>">
												<small>
													<spring:message code="country.ireland"/>
												</small>
											</a>
						                </div>
						                <div id="england">
						                    <a href="<c:url value="/pubs/country/England"></c:url>">
												<img src="<c:url value='/resources/imgs/flags/england.jpg'/>">
												<small>
													<spring:message code="country.england"/>
												</small>
											</a>
					                	</div>
					                </div>
					                <div id="slide2">
					                	<div id="germany">
						                    <a href="<c:url value="/pubs/country/Germany"></c:url>">
												<img src="<c:url value='/resources/imgs/flags/germany.jpg'/>">
												<small>
													<spring:message code="country.germany"/>
												</small>
											</a>
					                	</div>
					                	<div id="brazil">
						                    <a href="<c:url value="/pubs/country/Brazil"></c:url>">
												<img src="<c:url value='/resources/imgs/flags/brazil.jpg'/>">
												<small>
													<spring:message code="country.brazil"/>
												</small>
											</a>
					                	</div>
					                	<div id="argentina">
						                    <a href="<c:url value="/pubs/country/Argentina"></c:url>">
												<img src="<c:url value='/resources/imgs/flags/argentina.jpg'/>">
												<small>
													<spring:message code="country.argentina"/>
												</small>
											</a>
					                	</div>
					                </div>
					            </div>
					        </div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<jsp:include page="includes/footer.jsp"/>
	</div>
</body>
</html>
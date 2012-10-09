<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<jsp:include page="includes/header.jsp"/>

<body style="overflow: hidden;">
	
	<jsp:include page="includes/navigator.jsp"/>
	
	<div id="main_content">
		<div class="div-pub-image">
			<img alt="Pub Anywhere" src="<c:url value='/resources/imgs/pub-full-logo.png'/>">
		</div>
		<div class="div-search-bar">
			<form action="maps" method='POST' id="form">
			
				<input type="hidden" id="lat" name="lat">
    			<input type="hidden" id="lng" name="lng">
			
				<div class="input-box">
					<input type='text' id="location" name="location" placeholder="Search for pubs in cities, streets etc" autocomplete="off" class="location">
					<span class="search">
						<button type="submit" id="btnSearch" class="icons">
					</span>
				</div>
			</form>
		</div>
	</div>
</body>
</html>
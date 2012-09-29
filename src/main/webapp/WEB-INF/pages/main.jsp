<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<jsp:include page="includes/header.jsp" />

<body>
	<div id="div-navigator">
		<span>
			<button id="signin" class="buttons">Sign In</button>
		</span>
	</div>
	<div id="main_content">
		<div class="div-pub-image">
			<img alt="Pub Anywhere" src="<c:url value='/resources/imgs/pub-full-logo.png'/>">
		</div>
		<div class="div-search-bar">
			<form action="#" method='POST'>
				<div class="input-box">
					<input type='text'>
					<span class="search">
						<button id="btnSearch" class="icons"></button>
					</span>
				</div>
			</form>
		</div>
	</div>
</body>
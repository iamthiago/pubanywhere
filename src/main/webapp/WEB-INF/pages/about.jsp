<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<jsp:include page="includes/header.jsp"/>

<body>
	
	<jsp:include page="includes/navigator.jsp"/>

	<div id="main-large">
		<div id="left">
			<div id="control-title">
				<h1>
					Pub Anywhere
				</h1>
				<h3>
					<spring:message code="about.pubanywhere.message"></spring:message>
				</h3>
			</div>
			
			<div id="control-title">
				<h1>
					<spring:message code="about.whoweare.title"></spring:message>
				</h1>
				<h3>
					<spring:message code="about.whoweare.message"></spring:message>
				</h3>
			</div>
			
			<div id="control-title">
				<h1>
					<spring:message code="about.story.title"></spring:message>
				</h1>
				<h3>
					<spring:message code="about.story.message"></spring:message>
				</h3>
			</div>
		</div>
	</div>
	<div id="right">

	</div>
	
	<jsp:include page="includes/footer.jsp"/>
	
</body>
</html>
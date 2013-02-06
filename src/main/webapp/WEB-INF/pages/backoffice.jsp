<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<jsp:include page="includes/default.jsp"/>
<script type="text/javascript" src="<c:url value='/resources/js/backoffice-05-02-13.js' />"></script>

<body>
	<jsp:include page="includes/navigator.jsp"/>
	
	<div id="backoffice">
		<div id="left">
			<div id="pubHeader">
				<h1>
					<spring:message code="backoffice.title"/>
					<div id="div-logout">
						<c:url value="/logout" var="logout"></c:url>
						<a href="${logout}" id="btnLogout" class="nav-buttons"><spring:message code="nav.button.logout"/></a>
					</div>
				</h1>
				<div id="control-title-description">
					<h3>
						<spring:message code="backoffice.description"/>
					</h3>
				</div>
			</div>
			<div class="pubPanel panelLeft">
				<div id="backoffice-table">
					<table id="tbListPubs" class="data-table">
						<thead>
							<tr>
								<th><spring:message code="backoffice.table.pubid"/></th>
								<th><spring:message code="backoffice.table.name"/></th>
								<th><spring:message code="backoffice.table.city"/></th>
								<th><spring:message code="backoffice.table.country"/></th>
								<th><spring:message code="backoffice.table.enabled"/></th>
								<th><spring:message code="backoffice.table.pubviews"/></th>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${pubList}" var="pub">
								<tr id="<c:out value="${pub.pubId}"/>">
									<td><c:out value="${pub.pubId}" /></td>
									<td><c:out value="${pub.name}" /></td>
									<td><c:out value="${pub.city}" /></td>
									<td><c:out value="${pub.country}" /></td>
									<td><c:out value="${pub.enabled}" /></td>
									<td><c:out value="${pub.pubViews}" /></td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
			</div>
			<div id="right" class="pubPanel">
				<div id="backoffice-buttons">
					<a href="" id="btnChangePassword"><spring:message code="backoffice.changePassword"/></a>
				</div>
			</div>
		</div>
	</div>
	
	<div id="passwordModal" title="<spring:message code="backoffice.changePassword"/>">
		<form:form action="/backoffice/changePassword" method="POST" id="passwordForm" commandName="userForm" acceptCharset="UTF-8" enctype="multipart/form-data">
			<form:hidden path="username" value="${username}" />
			<div class="passwordClass">
				<spring:message code="backoffice.password"/> <br>
				<form:password path="senha" cssClass="inputs"/>
			</div>
			<div class="passwordClass">
				<spring:message code="backoffice.confirmPassword"/> <br>
				<form:password path="confirmarSenha" cssClass="inputs"/>
			</div>
			<input type="button" id="save" value="<spring:message code="backoffice.save"/>"/>
			<form:errors path="*" />
		</form:form>
		<div id="passError">
			<spring:message code="backoffice.invalidPassword"/>
		</div>
	</div>
	
	<jsp:include page="includes/footer.jsp"/>
	
</body>
</html>
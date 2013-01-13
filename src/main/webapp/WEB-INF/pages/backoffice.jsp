<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<jsp:include page="includes/default.jsp"/>
<script type="text/javascript" src="<c:url value='/resources/js/backoffice-12-01-13.js' />"></script>

<body>
	<jsp:include page="includes/navigator.jsp"/>
	
	<div id="backoffice">
		<div id="left">
			<div id="pubHeader">
				<h1>
					Back-Office
				</h1>
				<div id="control-title-description">
					<h3>
						Suitable tools for your pub
					</h3>
				</div>
			</div>
			<div class="pubPanel panelLeft">
				<div id="backoffice-table">
					<table id="tbListPubs" class="data-table">
						<thead>
							<tr>
								<th>PUB_ID</th>
								<th>NAME</th>
								<th>CITY</th>
								<th>COUNTRY</th>
								<th>ENABLED</th>
								<th>PUB VIEWS</th>
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
					<a href="#" id="btnListBackofficePubs">My Pubs</a>
				</div>
			</div>
		</div>
	</div>
	
	<jsp:include page="includes/footer.jsp"/>
	
</body>
</html>
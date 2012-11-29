<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<jsp:include page="includes/header-maps.jsp"/>
	
	<body onload="initialize()">
		<input type="hidden" id="lat" name="lat" value="${param.lat}">
    	<input type="hidden" id="lng" name="lng" value="${param.lng}">

		<div style="width: 400px; height: 400px;" id="map_canvas"></div>
		
		<div id="listPubDiv">
			<table id="pubTable" class="data-table">
				<thead>
					<tr>
						<th>Pub's Name</th>
						<th>Location</th>
						<th>Description</th>
						<th>Phone</th>
						<th>Email</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${listPubs}" var="pb">
						<tr>
							<td>${pb.nome}</td>
							<td>${pb.local}</td>
							<td>${pb.descricao}</td>
							<td>${pb.phone}</td>
							<td>${pb.email}</td>
						</tr>
					</c:forEach>	
				</tbody>
			</table>
		</div>
	</body>
</html>
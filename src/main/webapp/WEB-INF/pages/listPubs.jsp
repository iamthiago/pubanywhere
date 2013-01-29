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
									<div id="views">
										${pub.pubViews}
									</div>
								</div>
							</a>
						</li>
				</c:forEach>
			</ul>
		</div>
	</div>
	
	<jsp:include page="includes/footer.jsp"/>
	
</body>
</html>
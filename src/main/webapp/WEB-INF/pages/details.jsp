<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<jsp:include page="includes/header-contact.jsp"/>

<body>
	
	<jsp:include page="includes/navigator.jsp"/>

	<div class="borderAll">
		<div id="left">
			<div id="pubName">
				<h1>
					${pub.nome}
				</h1>
				<div id="control-title-description">
					<h3>
						${pub.local}
					</h3>
				</div>
			</div>
			<div class="pubPanel panelLeft">
				<div class="title">
					<h3><spring:message code="form.pub.description"/></h3>
				</div>
				<div id="pubDescription" class="margin15px">
					${pub.descricao}
				</div>
			</div>
			<div id="right" class="pubPanel">
				<div class="margin15px">
				
					<div style="text-align: center;">
						<h3>
							<spring:message code="nav.button.contact"/>
						</h3>
					</div>
					
					<img src="<c:url value='/resources/imgs/laptop.png'/>">&nbsp;
					<span>
						${pub.website}
					</span>
					<br>
					
					<img src="<c:url value='/resources/imgs/phone.png'/>">&nbsp;
					<span>
						${pub.phone}
					</span>
					<br>
					
					<img src="<c:url value='/resources/imgs/mail.png'/>">&nbsp;
					<span>
						${pub.email}
					</span>
				</div>
			</div>
		</div>
	</div>
	
	<jsp:include page="includes/footer.jsp"/>
	
</body>
</html>
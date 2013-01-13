<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<jsp:include page="includes/header-edit.jsp"/>

<body>
	
	<jsp:include page="includes/navigator.jsp"/>

	<div class="borderAll">
		<form:form action="/pubs/savePub" method='POST' modelAttribute="pub" acceptCharset="UTF-8" enctype="multipart/form-data">
		
		<form:hidden path="pubId"/>
		<form:hidden path="city"/>
		<form:hidden path="state"/>
		<form:hidden path="country"/>
		<form:hidden path="lat"/>
		<form:hidden path="lng"/>
		<form:hidden path="enabled"/>
		<form:hidden path="pubViews"/>
		<form:hidden path="pubRating"/>
		<form:hidden path="desde"/>
		
			
			<div id="left">
				<div id="pubHeader">
					<h1>
						<form:input path="name" cssClass="edit_inputs" maxlength="100" id="edit-name"/>
					</h1>
					<div id="control-title-description">
						<h3>
							<form:input path="local" cssClass="edit_inputs" id="edit-local"/>
						</h3>
					</div>
				</div>
				<div class="pubPanel panelLeft">
					<div id="divImg" class="padding">
						<img src="https://s3.amazonaws.com/pubanywhere/${pub.pubId}"/>
					</div>
					<div class="title padding">
						<h3><spring:message code="form.pub.description"/></h3>
					</div>
					<div id="pubDescription" class="margin15px">
						<form:textarea path="descricao" rows="20" cols="40" cssClass="text-area-input" tabindex="3" maxlength="3000"/>
					</div>
				</div>
				<div id="right" class="pubPanel">
					<div>
						<div class="margin15px center">
							<h3>
								<spring:message code="details.contact"/>
							</h3>
						</div>
						
						<div class="margin15px">
							<img src="<c:url value='/resources/imgs/laptop.png'/>">&nbsp;
							<span>
								<c:if test="${pub.website != ''}">
									<form:input path="website" cssClass="edit_inputs" maxlength="100"/>
								</c:if>
							</span>
							<br>
							
							<img src="<c:url value='/resources/imgs/phone.png'/>">&nbsp;
							<span>
								<c:if test="${pub.phone != ''}">
									<form:input path="phone" cssClass="edit_inputs" maxlength="100"/>
								</c:if>
							</span>
							<br>
							
							<img src="<c:url value='/resources/imgs/mail.png'/>">&nbsp;
							<span>
								<c:if test="${pub.email != ''}">
									<form:input path="email" cssClass="edit_inputs" maxlength="100"/>
								</c:if>
							</span>
							<br>
							
							<img src="<c:url value='/resources/imgs/facebook.png'/>">&nbsp;
							<span>
								<c:if test="${pub.facebook != ''}">
									<form:input path="facebook" cssClass="edit_inputs" maxlength="100"/>
								</c:if>
							</span>
							<br>
							
							<img src="<c:url value='/resources/imgs/twitter.png'/>">&nbsp;
							<span>
								<c:if test="${pub.twitter != ''}">
									<form:input path="twitter" cssClass="edit_inputs" maxlength="100"/>
								</c:if>
							</span>
						</div>
						<div class="title center">
							<h3>
								<input type="submit" value="Save" id="btnEditPub">
							</h3>
						</div>
					</div>
				</div>
			</div>
		</form:form>
	</div>
	
	<jsp:include page="includes/footer.jsp"/>
	
</body>
</html>
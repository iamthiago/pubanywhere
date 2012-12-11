<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<jsp:include page="includes/header-pub.jsp"/>

<body>
	
	<jsp:include page="includes/navigator.jsp"/>

	<div id="main">
		<form:form action="pubs/registerPub" method='POST' id="pubForm" commandName="pubForm" acceptCharset="UTF-8">
		
			<form:hidden path="lat" id="lat"/>
			<form:hidden path="lng" id="lng"/>
			
			<div id="left">
				<div id="control-title">
					<h1>
						<spring:message code="form.pub.title"/>
					</h1>
					<div id="control-title-description">
						<h3>
							<spring:message code="form.pub.title.description"/>
						</h3>
					</div>
				</div>
				<div id="control-panel">
					<div class="title">
						<h3><spring:message code="form.pub.panel.title"/></h3>
						<p>
							<span class="messageAlert"><c:out value="${pubSuccess}"/></span>
						</p>
					</div>
					<fieldset class="padtop">
						<div class="control-main">
							<div class="control-group">
								<label for="pubs-name" class="control-label">
									<spring:message code="form.pub.name"/>
								</label>
								<div class="controls">
									<form:input path="nome" id="pubs-name" cssClass="inputs" tabindex="1" maxlength="100"/>
									<form:errors path="nome" element="div" cssClass="errors"/>
								</div>
							</div>
							<div class="control-group">
								<label for="location_new" class="control-label">
									<spring:message code="form.pub.location"/>
								</label>
								<div class="controls">
									<form:input path="local" id="location_new" cssClass="inputs" tabindex="2"/>
									<form:errors path="local" element="div" cssClass="errors"/>
								</div>
							</div>
							<div class="control-group">
								<label for="pubs-description" class="control-label">
									<spring:message code="form.pub.description"/>
								</label>
								<div class="controls">
									<form:textarea path="descricao" id="pubs-description" rows="20" cols="40" cssClass="text-area-input" tabindex="3"/>
									<form:errors path="descricao" element="div" cssClass="errors"/>
								</div>
							</div>
							<div class="control-group">
								<label for="pubs-phone" class="control-label">
									<spring:message code="form.pub.phone"/>
								</label>
								<div class="controls">
									<form:input path="phone" id="pubs-phone" cssClass="inputs" tabindex="4" maxlength="100"/>
									<form:errors path="phone" element="div" cssClass="errors"/>
								</div>
							</div>
							<div class="control-group">
								<label for="pubs-website" class="control-label">
									<spring:message code="form.pub.website"/>
								</label>
								<div class="controls">
									<form:input path="website" id="pubs-website" cssClass="inputs" tabindex="5" maxlength="100"/>
									<form:errors path="website" element="div" cssClass="errors"/>
								</div>
							</div>
							<div class="control-group">
								<label for="pubs-email" class="control-label">
									<spring:message code="form.pub.email"/>
								</label>
								<div class="controls">
									<form:input path="email" id="pubs-email" cssClass="inputs" tabindex="6" maxlength="100"/>
									<form:errors path="email" element="div" cssClass="errors"/>
								</div>
							</div>
							
							<div class="control-group">
								<span>
									<input id="insertPub" type="submit" name="submit" value="<spring:message code="form.pub.button.send"/>" class="buttons"/>
								</span>
							</div>
						</div>
					</fieldset>
				</div>
			</div>
			<div id="right">
				
			</div>
		</form:form>
	</div>
</body>
</html>
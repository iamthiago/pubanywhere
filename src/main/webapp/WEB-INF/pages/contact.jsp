<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<jsp:include page="includes/header-contact.jsp"/>

<body>
	
	<jsp:include page="includes/navigator.jsp"/>

	<div id="main">
		<form:form action="/contact" method='POST' id="contactForm" commandName="contactForm" acceptCharset="UTF-8">
			
			<div id="left">
				<div id="control-title">
					<h1>
						<spring:message code="form.contact.title"/>
					</h1>
					<div id="control-title-description">
						<h3>
							<spring:message code="form.contact.title.description"/>
						</h3>
					</div>
				</div>
				<div id="control-panel">
					<div class="title">
						<h3><spring:message code="form.contact.panel.title"/></h3>
						<p>
							<span class="messageAlert"><c:out value="${mailSuccess}"/></span>
						</p>
					</div>
					<fieldset class="padtop">
						<div class="control-main">
							<div class="control-group">
								<label for="contact-name" class="control-label">
									<spring:message code="form.contact.name"/>
								</label>
								<div class="controls">
									<form:input path="name" id="contact-name" cssClass="inputs" tabindex="1"/>
									<form:errors path="name" element="div" cssClass="errors"/>
								</div>
							</div>
							<div class="control-group">
								<label for="contact-email" class="control-label">
									<spring:message code="form.contact.email"/>
								</label>
								<div class="controls">
									<form:input path="email" id="contact-email" cssClass="inputs" tabindex="2"/>
									<form:errors path="email" element="div" cssClass="errors"/>
								</div>
							</div>
							<div class="control-group">
								<label for="contact-subject" class="control-label">
									<spring:message code="form.contact.subject"/>
								</label>
								<div class="controls">
									<form:input path="subject" id="contact-subject" cssClass="inputs" tabindex="3"/>
									<form:errors path="subject" element="div" cssClass="errors"/>
								</div>
							</div>
							<div class="control-group">
								<label for="contact-description" class="control-label">
									<spring:message code="form.contact.description"/>
								</label>
								<div class="controls">
									<form:textarea path="description" id="contact-description" rows="20" cols="40" cssClass="text-area-input" tabindex="4"/>
									<form:errors path="description" element="div" cssClass="errors"/>
								</div>
							</div>
							<div class="control-group">
								<span>
									<input id="sendMail" type="submit" name="submit" value="<spring:message code="form.contact.button.send"/>" class="buttons"/>
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
	
	<jsp:include page="includes/footer.jsp"/>
	
</body>
</html>
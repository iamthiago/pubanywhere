<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<div id="contactForm">
	<form:form action="#" method='POST' id="contactAjaxForm" commandName="contactForm" acceptCharset="UTF-8" enctype="multipart/form-data">
		<div>
			<div>
				<fieldset>
					<div>
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
								<form:input path="from" id="contact-email" cssClass="inputs" tabindex="2"/>
								<form:errors path="from" element="div" cssClass="errors"/>
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
								<a id="sendMail" class="buttons"><spring:message code="form.contact.button.send"/></a>
							</span>
						</div>
					</div>
				</fieldset>
			</div>
		</div>
	</form:form>
</div>
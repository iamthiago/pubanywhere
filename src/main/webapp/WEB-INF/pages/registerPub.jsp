<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

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
						List your place.
					</h1>
					<div id="control-title-description">
						<h3>
							Pub Anywhere make your bar, pub to be discovered in the entire world!
						</h3>
					</div>
				</div>
				<div id="control-panel">
					<div class="title">
						<h3>About your Pub</h3>
						<p>
							Tell us how great is the pub.
						</p>
					</div>
					<fieldset class="padtop">
						<div class="control-main">
							<div class="control-group">
								<label for="pubs-name" class="control-label">
									Pub's Name:
								</label>
								<div class="controls">
									<form:input path="nome" id="pubs-name" cssClass="inputs"/>
									<form:errors path="nome" element="div" cssClass="errors"/>
								</div>
							</div>
							<div class="control-group">
								<label for="location_new" class="control-label">
									Location:
								</label>
								<div class="controls">
									<form:input path="local" id="location_new" cssClass="inputs"/>
									<form:errors path="local" element="div" cssClass="errors"/>
								</div>
							</div>
							<div class="control-group">
								<label for="pubs-description" class="control-label">
									Description:
								</label>
								<div class="controls">
									<form:textarea path="descricao" id="pubs-description" rows="20" cols="40" cssClass="text-area-input"/>
									<form:errors path="descricao" element="div" cssClass="errors"/>
								</div>
							</div>
							<div class="control-group">
								<label for="pubs-phone" class="control-label">
									Phone:
								</label>
								<div class="controls">
									<form:input path="phone" id="pubs-phone" cssClass="inputs"/>
									<form:errors path="phone" element="div" cssClass="errors">Phone must be number</form:errors>
								</div>
							</div>
							<div class="control-group">
								<label for="pubs-website" class="control-label">
									Website:
								</label>
								<div class="controls">
									<form:input path="website" id="pubs-website" cssClass="inputs"/>
									<form:errors path="website" element="div" cssClass="errors"/>
								</div>
							</div>
							<div class="control-group">
								<label for="pubs-email" class="control-label">
									Email:
								</label>
								<div class="controls">
									<form:input path="email" id="pubs-email" cssClass="inputs"/>
									<form:errors path="email" element="div" cssClass="errors"/>
								</div>
							</div>
							
							<div class="control-group">
								<span>
									<input id="insertPub" type="submit" name="submit" value="Save Pub" class="buttons"/>
								</span>
							</div>
						</div>
					</fieldset>
				</div>
			</div>
			<div id="right">
				<h3>Question & Answer</h3>
				<div>
					<ul>
						<li>Why list your pub or bar on Pub Anywhere?</li>
					</ul>
				</div>
			</div>
		</form:form>
	</div>
</body>
</html>
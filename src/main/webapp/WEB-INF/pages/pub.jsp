<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<jsp:include page="includes/header.jsp"/>

<body>
	
	<jsp:include page="includes/navigator.jsp"/>

	<div id="main">
		<form action="#" method='POST'>
		
			<input type="hidden" id="lat" name="lat">
	    	<input type="hidden" id="lng" name="lng">
			
			<div id="left">
				<div id="control-title">
					<h1>
						List your place.
					</h1>
					<div id="control-title-description">
						<h3>
							Pub Anywhere make your pub to be discovered in the entire world!
						</h3>
					</div>
				</div>
				<div id="control-panel">
					<div class="title">
						<h3>About your Pub</h3>
						<p>
							Tell us how great is your pub.
						</p>
					</div>
					<fieldset class="padtop">
						<div class="control-main">
							<div class="control-group">
								<label for="name" class="control-label">
									Pub's Name:
								</label>
								<div class="controls">
									<input type='text' id="pubs-name" name="pubs-name" class="inputs">
								</div>
							</div>
							<div class="control-group">
								<label for="location_new" class="control-label">
									Location:
								</label>
								<div class="controls">
									<input id="location_new" name="location_new" type="text" placeholder="" class="inputs">
								</div>
							</div>
							<div class="control-group">
								<label for="pubs-description" class="control-label">
									Description:
								</label>
								<div class="controls">
									<textarea id="pubs-description" name="pubs-description" rows="20" cols="40" class="text-area-input"></textarea>
								</div>
							</div>
							<div class="control-group">
								<label for="pubs-phone" class="control-label">
									Phone:
								</label>
								<div class="controls">
									<input id="pubs-phone" name="pubs-phone" class="inputs">
								</div>
							</div>
							<div class="control-group">
								<label for="pubs-email" class="control-label">
									Email:
								</label>
								<div class="controls">
									<input id="pubs-email" name="pubs-email" class="inputs">
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
						<li>Is it free to list your pub?</li>
						<li>How does Pub Anywhere promote your pub?</li>
					</ul>
				</div>
			</div>
		</form>
	</div>
</body>
</html>
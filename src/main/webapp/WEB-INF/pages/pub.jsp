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
		
			<h2 class="h2">
				List Your Place
			</h2>
			<div>
				<div class="div-content">
					<label for="name">
						Name:
					</label>
					<input type='text' name='name' class="inputs">
				</div>
				<div class="div-content">
					<label for="location">
						Location:
					</label>
					<input id="location" name="location" type="text" placeholder="" class="inputs">
				</div>
				<div class="div-content">
					<span>
						<input id="btnCreate" type="submit" name="submit" value="Insert Pub" class="buttons"/>
					</span>
				</div>
			</div>
		</form>
	</div>
</body>
</html>
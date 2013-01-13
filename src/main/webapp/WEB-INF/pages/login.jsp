<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<jsp:include page="includes/header_login.jsp" />

<body onload='document.f.j_username.focus();' class="LoginBody">
	<div id="main_login">		
		<form name='f' action="<c:url value='j_spring_security_check' />" method='POST'>
			<h2 class="login_h2">
				Sign in
			</h2>
			<div>
				<div class="div_login_content">
					<label for="username">
						Username:
					</label>
					<input type='text' name='j_username' class="input_login">
				</div>
				<div class="div_login_content">
					<label for="password">
						Password:
					</label>
					<input type='password' name='j_password' class="input_login"/>
				</div>
				<div class="div_login_content">
					<span>
						<input id="btnLogin" type="submit" name="submit" value="Sign in" class="btnLoginButtons"/>
					</span>
				</div>
			</div>
		</form>
	</div>
	<c:if test="${not empty error}">
		<div class="errorblock">
			Login Failed.
		</div>
	</c:if>
</body>
</html>
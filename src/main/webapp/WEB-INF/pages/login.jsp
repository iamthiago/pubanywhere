<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<jsp:include page="includes/header-login.jsp"/>

<body onload='document.f.j_username.focus();' class="loginBody degrade" id="bodyLogin">

	<jsp:include page="includes/navigator.jsp"/>

	<div id="loginSize">
		<div id="main_login">
			
			
			<div id="div-signIn" class="whiteBorder">
				<form name='f' action="<c:url value='j_spring_security_check' />" method='POST' class="padding20px">
					<h2 class="login_h2">
						<spring:message code="login.signin"/>
					</h2>
					<div>
						<div class="div_login_content">
							<label for="username">
								email:
							</label>
							<input type='text' name='j_username' class="input_login">
						</div>
						<div class="div_login_content">
							<label for="password">
								<spring:message code="login.password"/>
							</label>
							<input type='password' name='j_password' class="input_login"/>
						</div>
						<div class="div_login_content">
							<span>
								<input id="btnLogin" type="submit" name="submit" value="<spring:message code="login.signin"/>"/>
							</span>
							<span class="signup">
								<spring:message code="login.newhere"/> <a href='#' id="btnSignUp" class="a_color"><spring:message code="login.signup"/></a><br>
								<a href='#' id="btnForgotPassword" class="a_color"><spring:message code="login.forgotten"/></a>
							</span>
						</div>
					</div>
				</form>
			</div>
			
			
			<div id="div-password" class="whiteBorder">
				<form:form action="#" id="passwordForm" method="POST" commandName="passwordForm" cssClass="padding20px">
					<h2 class="login_h2">
						<spring:message code="login.password.title"/>
					</h2>
					<div>
						<div class="div_login_content">
							<label for="username">
								Email
							</label>
							<form:input path="email" cssClass="input_login"/>
						</div>
						<div class="div_login_content">
							<span>
								<input id="btnSendPassword" type="submit" name="submit" value="<spring:message code="login.password.button"/>" />
							</span>
							<span class="signup">
								<a href='#' id="btnPassSignIn" class="a_color"><spring:message code="login.signin"/>!</a>
							</span>
						</div>
					</div>
				</form:form>
			</div>
			
			
			<div id="div-signUp" class="whiteBorder">
				<form:form action="#" id="userForm" method="POST" commandName="userForm" cssClass="padding20px">
					<h2 class="login_h2">
						<spring:message code="login.signup.title"/>
					</h2>
					<div>
						<div class="div_login_content float marginR">
							<label for="name">
								<spring:message code="login.signup.name"/>
							</label>
							<form:input path="name" cssClass="input_login" tabindex="1"/>
						</div>
						<div class="div_login_content">
							<label for="email">
								Email
							</label>
							<form:input path="email" cssClass="input_login" tabindex="2"/>
						</div>
					</div>
					<div>
						<div class="div_login_content float marginR">
							<label for="password">
								<spring:message code="login.signup.password"/>
							</label>
							<form:password path="password" cssClass="input_login" tabindex="3"/>
						</div>
						<div class="div_login_content">
							<label for="confirmPassword">
								<spring:message code="login.signup.confirmPassword"/>
							</label>
							<form:password path="confirmPassword" cssClass="input_login" tabindex="4"/>
						</div>
					</div>
					<div class="div_login_content">
						<span>
							<input id="btnCreateNewUser" type="submit" value="<spring:message code="login.signup.title"/>" class="btnLoginButtons">
						</span>
						<span class="signup">
							<a href='#' id="btnCreateSignIn" class="a_color"><spring:message code="login.signin"/>!</a>
						</span>
					</div>
				</form:form>
			</div>
			
			
		</div>
		<c:if test="${not empty error}">
			<div class="errorblock">
				<spring:message code="login.failed"/>
			</div>
		</c:if>
	</div>
	
	<jsp:include page="includes/footer.jsp"/>
	
</body>
</html>
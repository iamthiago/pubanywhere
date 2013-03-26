<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<div id="innerLeft" class="whiteBorder userInnerLeft marginBotton10px">
	<h3 class="title-h3"><spring:message code="user.main.editprofile"/></h3>
	<div class="innerDetails">
		<div id="userEditReview" class="padding10px">
			<form:form action="#" method='POST' modelAttribute="form" acceptCharset="UTF-8" id="editUserProfileForm">
				<div class="marginBotton10px">
					<label for="name" class="control-label width80px">
						<spring:message code="user.edit.username"/>
					</label>
					<div class="controlsLeft">
						<input type="text" value="${user.username}" class="inputs" disabled="disabled">
					</div>
				</div>
				<div>
					<div>
						<div class="marginBotton10px floatLeft45">
							<label for="name" class="control-label width80px">
								<spring:message code="user.edit.name"/>
							</label>
							<div class="controlsLeft">
								<form:input path="name" value="${user.pubUser.name}" cssClass="inputs"/>
							</div>
						</div>
						<div class="marginBotton10px">
							<label for="name" class="control-label width120px">
								<spring:message code="user.edit.email"/>
							</label>
							<div class="controlsRight">
								<form:input path="email" value="${user.pubUser.email}" cssClass="inputs"/>
							</div>
						</div>
					</div>
					<div>
						<div class="marginBotton10px floatLeft45">
							<label for="name" class="control-label width80px">
								<spring:message code="user.edit.password"/>
							</label>
							<div class="controlsLeft">
								<form:password path="password" value="${user.password}" cssClass="inputs"/>
							</div>
						</div>
						<div class="marginBotton10px">
							<label for="name" class="control-label width120px">
								<spring:message code="user.edit.confirmpassword"/>
							</label>
							<div class="controlsRight">
								<form:password path="confirmPassword" value="${user.password}" cssClass="inputs"/>
							</div>
						</div>
					</div>
					<div>
						<div>
							<div class="controlsLeft">
								<input id="btnEditUserProfile" type="submit" name="submit" value="<spring:message code="user.main.editprofile"/>" class="buttons"/>
							</div>
						</div>
					</div>
				</div>
			</form:form>
		</div>
	</div>
</div>
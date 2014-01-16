<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<!-- BREADCRUMB -->

<jsp:include page="social.jsp"/>

<div class="breadcrumb-wrapper">
	<div class="container">
		<div class="row">
			<div class="span12">
				<ul class="breadcrumb pull-left">
					<li><a href="/">Home</a></li>
				</ul>

				<div class="account pull-right">
					<ul class="nav nav-pills">
						<li><div class="fb-login-button" style="margin-left: 10px; margin-top: 2px;" data-width="200" autologoutlink="true" onlogin="FacebookLogin(true)" scope="email"></div></li>
					</ul>
				</div>
			</div>
		</div>
	</div>
</div>
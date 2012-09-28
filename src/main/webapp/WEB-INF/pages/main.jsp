<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<jsp:include page="includes/header.jsp" />

<body>
	<div id="nav_bar">
		<div id="pubName">
			Pub Anywhere
		</div>
		<div id="signIn">
			<a href="#" id="btnSignIn">Entrar</a>
		</div>
	</div>
	<div id="content">
		<div id="main_image">
			<div id="main_content">
				<div id="search_area">
					<form action="#" id="main_form">
						<input type="text" size="50" value="Pesquise aqui..." class="main_input">
					</form>
				</div>
			</div>
		</div>
	</div>
</body>
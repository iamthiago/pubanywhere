<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<jsp:include page="includes/header_login.jsp" />

<body class="LoginBody">
	<div id="newUser">
		<h2 class="login_h2">
			Sign Up
		</h2>
		<form:form action="createNewUser" id="userForm" method="POST" commandName="userForm">
			<table id="tbInserirUsers">
				<tr>
					<td class="td_left">
						<label for="nome">
							Name:
						</label>
					</td>
					<td>
						<form:input path="nome" cssClass="input_login" tabindex="1"/>
					</td>
				</tr>
				<tr>
					<td>
						<label for="sobrenome">
							Last Name:
						</label>
					</td>
					<td>
						<form:input path="sobrenome" cssClass="input_login" tabindex="2"/>
					</td>
				</tr>
				<tr>
					<td>
						<label for="email">
							Email:
						</label>
					</td>
					<td>
						<form:input path="email" cssClass="input_login" tabindex="3"/>
					</td>
				</tr>
				<tr>
					<td>
						<label for="email">
							Re-enter Email:
						</label>
					</td>
					<td>
						<form:input path="confirmarEmail" cssClass="input_login" tabindex="4"/>
					</td>
				</tr>
				<tr>
					<td>
						<label for="senha">
							Password:
						</label>
					</td>
					<td>
						<form:password path="senha" cssClass="input_login" tabindex="5"/>
					</td>
				</tr>
				<tr>
					<td>
						<label for="confirmarSenha">
							Re-enter Password:
						</label>
					</td>
					<td>
						<form:password path="confirmarSenha" cssClass="input_login" tabindex="6"/>
					</td>
				</tr>
				<tr>
					<td>
						<label for="sexo">
							I am:
						</label>
					</td>
					<td style="text-align: left">
						<form:select path="sexo" id="comboSexo">
							<form:options items="${listaSexo}"/>
						</form:select>
					</td>
				</tr>
				<tr>
					<td>
						<label for="dataNascimento">
							Birthday:
						</label>
					</td>
					<td style="text-align: left">
						<form:select path="month" cssClass="dataNascimento">
							<form:option value="-1" label="Month:" />
							<form:options items="${months}" itemValue="codigo" itemLabel="descricao"/>
						</form:select>
						<form:select path="day" cssClass="dataNascimento">
							<form:option value="-1" label="Day:" />
							<form:options items="${days}"/>
						</form:select>
						<form:select path="year" cssClass="dataNascimento">
							<form:option value="-1" label="Year:" />
							<form:options items="${years}"/>
						</form:select>
					</td>
				</tr>
			</table>
			<input id="createNewUser" type="submit" value="Sign Up" class="btnLoginButtons">
		</form:form>
	</div>
</body>
</html>
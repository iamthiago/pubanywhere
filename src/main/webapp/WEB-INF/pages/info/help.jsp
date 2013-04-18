<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<center>
	<img src="<c:url value="resources/imgs/big-help.png"></c:url>"/>
</center>

<div>
	<h1>
		<spring:message code="help.findpub.title"></spring:message>
	</h1>
	<h3 class="justify">
		<spring:message code="help.findpub.description"></spring:message>
	</h3>
</div>

<div>
	<h1>
		<spring:message code="help.cantseepubs.title"></spring:message>
	</h1>
	<h3 class="justify">
		<spring:message code="help.cantseepubs.description"></spring:message>
	</h3>
</div>

<div>
	<h1>
		<spring:message code="help.listmyplace.title"></spring:message>
	</h1>
	<h3 class="justify">
		<spring:message code="help.listmyplace.description"></spring:message>
	</h3>
</div>

<div>
	<h1>
		<spring:message code="help.free.title"></spring:message>
	</h1>
	<h3 class="justify">
		<spring:message code="help.free.description"></spring:message>
	</h3>
</div>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<div id="infoMenus">
	<div id="titlePub" class="topTitle h1">
		<h1>Pub Anywhere</h1>
	</div>
	
	<div id="titleAbout" class="topTitle h1">
		<h1><spring:message code="help.topics.about"/></h1>
	</div>
	
	<div id="titleTeam" class="topTitle h1">
		<h1><spring:message code="info.menu.team"/></h1>
	</div>
	
	<div id="titleStory" class="topTitle h1">
		<h1><spring:message code="info.menu.story"/></h1>
	</div>
	
	<div id="titleHelp" class="topTitle h1">
		<h1><spring:message code="help.center.title"/></h1>
	</div>
	
	<div id="titleHowItWorks" class="topTitle h1">
		<h1><spring:message code="howitworks.title"/></h1>
	</div>
	
	<div id="titleContact" class="topTitle h1">
		<h1><spring:message code="form.contact.title"/></h1>
	</div>
</div>
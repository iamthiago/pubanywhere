<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<div id="helpOptions">
	<div id="accordion">
		<h3 class="h3"><spring:message code="help.topics.about"/></h3>
		<div>
			<div>
				<img src="<c:url value='/resources/imgs/star-on.png'/>">&nbsp;
				<span>
					<a href="#about" class="btnAbout">
						<spring:message code="info.menu.about"/>
					</a>
				</span>
			</div>
			<div>
				<img src="<c:url value='/resources/imgs/user_group.png'/>">&nbsp;
				<span>
					<a href="#team" class="btnTeam">
						<spring:message code="info.menu.team"/>
					</a>
				</span>
			</div>
			<div>
				<img src="<c:url value='/resources/imgs/text_file.png'/>">&nbsp;
				<span>
					<a href="#story" class="btnStory">
						<spring:message code="info.menu.story"/>
					</a>
				</span>
			</div>
		</div>
		
		<h3 class="h3"><spring:message code="info.menu.help"/></h3>
		<div>
			<div>
				<img src="<c:url value='/resources/imgs/help.png'/>">&nbsp;
				<span>
					<a href="#help" class=btnHelp>
						<spring:message code="help.topics.help"/>
					</a>
				</span>
			</div>
			<%-- <div>
				<img src="<c:url value='/resources/imgs/work.png'/>">&nbsp;
				<span>
					<a href="#howItWorks" id=btnHowItWorks>
						<spring:message code="help.topics.howitworks"/>
					</a>
				</span>
			</div> --%>
		</div>
		
		<h3 class="h3">Feedback</h3>
		<div>
			<div>
				<img src="<c:url value='/resources/imgs/mail.png'/>">&nbsp;
				<span>
					<a href="#feedback" class="btnFeedback">
						<spring:message code="form.contact.title"/>
					</a>
				</span>
			</div>
		</div>
	</div>
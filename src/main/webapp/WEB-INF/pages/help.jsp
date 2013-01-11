<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<jsp:include page="includes/default.jsp"/>

<body>
	<jsp:include page="includes/navigator.jsp"/>
	
	<div id="helpAll">
		<div id="left">
			<div id="pubHeader">
				<h1>
					<spring:message code="help.center.title"></spring:message>
				</h1>
				<div id="control-title-description">
					<h3>
						<spring:message code="help.center.description"></spring:message>
					</h3>
				</div>
			</div>
			<div class="pubPanel panelLeft">
				<div class="help-margin-left-bottom">
					<div id="about">
						<div id="control-title">
							<h1>
								Pub Anywhere
							</h1>
							<h3>
								<spring:message code="about.pubanywhere.message"></spring:message>
							</h3>
						</div>
						
						<div id="control-title">
							<h1>
								<spring:message code="about.whoweare.title"></spring:message>
							</h1>
							<h3>
								<spring:message code="about.whoweare.message"></spring:message>
							</h3>
						</div>
						
						<div id="control-title">
							<h1>
								<spring:message code="about.story.title"></spring:message>
							</h1>
							<h3>
								<spring:message code="about.story.message"></spring:message>
							</h3>
						</div>
					</div>
					<div id="howItWorks">
						<div id="control-title">
							<h1>
								<spring:message code="howitworks.title"></spring:message>
							</h1>
							<h3>
								<spring:message code="howitworks.description"></spring:message>
							</h3>
						</div>
						<div id="control-title">
							<h1>
								<spring:message code="howitworks.connect.title"></spring:message>
							</h1>
							<h3>
								<spring:message code="howitworks.connect.description"></spring:message>
							</h3>
						</div>
						
					</div>
					<div id="help">
						<div id="control-title">
							<h1>
								<spring:message code="help.findpub.title"></spring:message>
							</h1>
							<h3>
								<spring:message code="help.findpub.description"></spring:message>
							</h3>
						</div>
						
						<div id="control-title">
							<h1>
								<spring:message code="help.cantseepubs.title"></spring:message>
							</h1>
							<h3>
								<spring:message code="help.cantseepubs.description"></spring:message>
							</h3>
						</div>
						
						<div id="control-title">
							<h1>
								<spring:message code="help.listmyplace.title"></spring:message>
							</h1>
							<h3>
								<spring:message code="help.listmyplace.description"></spring:message>
							</h3>
						</div>
						
						<div id="control-title">
							<h1>
								<spring:message code="help.free.title"></spring:message>
							</h1>
							<h3>
								<spring:message code="help.free.description"></spring:message>
							</h3>
						</div>
					</div>
				</div>
			</div>
			<div id="right" class="pubPanel">
				<div>
				
					<div class="margin15px center">
						<h3>Topics</h3>
					</div>
					<div class="margin15px">
						<img src="<c:url value='/resources/imgs/work.png'/>">&nbsp;
						<span>
							<a href="#" id="btnHowItWorks"><spring:message code="help.topics.howitworks"></spring:message></a>
						</span>
						<br>
						
						<img src="<c:url value='/resources/imgs/info.png'/>">&nbsp;
						<span>
							<a href="#" id="btnAbout"><spring:message code="help.topics.about"></spring:message></a>
						</span>
						<br>
						
						<img src="<c:url value='/resources/imgs/help.png'/>">&nbsp;
						<span>
							<a href="#" id=btnHelpPage><spring:message code="help.topics.help"></spring:message></a>
						</span>
						<br>
					</div>
				
					<div class="title center">
						<h3>
							<spring:message code="details.contact"/>
						</h3>
					</div>
					<div class="margin15px">					
						<img src="<c:url value='/resources/imgs/mail.png'/>">&nbsp;
						<span>
							<a href="mailto:'pubanywhere@gmail.com'">pubanywhere@gmail.com</a>
						</span>
						<br>
						
						<img src="<c:url value='/resources/imgs/facebook.png'/>">&nbsp;
						<span>
							<a href="http://www.facebook.com/pubanywhere" target="_blank">pubanywhere</a>
						</span>
						<br>
						
						<img src="<c:url value='/resources/imgs/twitter.png'/>">&nbsp;
						<span>
							<a href="http://www.twitter.com/pubanywhere" target="_blank">pubanywhere</a>
						</span>
						
						<br>		
						<br>						
						
						<img src="<c:url value='/resources/imgs/mail.png'/>">&nbsp;
						<span>
							<c:url value="/contact" var="contact"></c:url>
							<a href="${contact}">Contact Form</a>
						</span>
						
					</div>
					
					
				</div>
			</div>
		</div>
	</div>
	
	<jsp:include page="includes/footer.jsp"/>
	
</body>
</html>
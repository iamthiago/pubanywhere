<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<jsp:include page="includes/header-pub.jsp"/>

<body>
	<div id="principal" class="frameAll">
		<jsp:include page="includes/navigator.jsp"/>
		<div id="content" class="degrade marginList row">
			<div>
				<div id="topSection">
					<div class="topTitle h1">
						<h1><spring:message code="form.pub.title"/></h1>
						<h5>
							<spring:message code="form.pub.title.description"/>
						</h5>
					</div>
				</div>
				<div id="container" class="row">
					<div class="row">
						<div id="detailLeft">
							<div id="innerLeft" class="whiteBorder">
								<div class="innerDetails">
									<div id="pubForm">
										<form:form action="#" method='POST' id="pubForm" commandName="pubForm" acceptCharset="UTF-8" enctype="multipart/form-data">
										
											<form:hidden path="lat" id="lat"/>
											<form:hidden path="lng" id="lng"/>
										
											<div>
												<div>
													<div class="register-title">
														<p>
															<span class="errors"><c:out value="${pubSuccess}"/></span>
														</p>
													</div>
													<fieldset>
														<div>
															<div class="control-group">
																<label for="pubs-name" class="control-label">
																	<spring:message code="form.pub.name"/>
																</label>
																<div class="controls">
																	<form:input path="name" id="pubs-name" cssClass="inputs" tabindex="1" maxlength="30"/>
																	<form:errors path="name" element="div" cssClass="errors"/>
																</div>
															</div>
															<div class="control-group">
																<label for="location_new" class="control-label">
																	<spring:message code="form.pub.location"/>
																</label>
																<div class="controls">
																	<form:input path="local" id="location_new" cssClass="inputs" tabindex="2"/>
																	<form:errors path="local" element="div" cssClass="errors"/>
																</div>
															</div>
															<div class="control-group">
																<label for="pubs-description" class="control-label">
																	<spring:message code="form.pub.description"/>:
																</label>
																<div class="controls">
																	<form:textarea path="descricao" id="pubs-description" rows="20" cols="40" cssClass="text-area-input" tabindex="3" maxlength="3000"/>
																	<form:errors path="descricao" element="div" cssClass="errors"/>
																</div>
															</div>
															<div class="control-group">
																<label for="pubs-phone" class="control-label">
																	<spring:message code="form.pub.phone"/>
																</label>
																<div class="controls">
																	<form:input path="phone" id="pubs-phone" cssClass="inputs" tabindex="4" maxlength="100"/>
																	<form:errors path="phone" element="div" cssClass="errors"/>
																</div>
															</div>
															<div class="control-group">
																<label for="pubs-website" class="control-label">
																	<spring:message code="form.pub.website"/>
																</label>
																<div class="controls">
																	<form:input path="website" id="pubs-website" cssClass="inputs" tabindex="5" maxlength="100"/>
																	<form:errors path="website" element="div" cssClass="errors"/>
																</div>
															</div>
															<div class="control-group">
																<label for="pubs-email" class="control-label">
																	<spring:message code="form.pub.email"/>
																</label>
																<div class="controls">
																	<form:input path="email" id="pubs-email" cssClass="inputs" tabindex="6" maxlength="100"/>
																	<form:errors path="email" element="div" cssClass="errors"/>
																</div>
															</div>
															<div class="control-group">
																<label for="pubs-facebook" class="control-label">
																	<img src="<c:url value='/resources/imgs/facebook.png'/>">
																</label>
																<div class="controls">
																	<form:input path="facebook" id="pubs-facebook" cssClass="inputs" tabindex="6" maxlength="100"/>
																	<form:errors path="facebook" element="div" cssClass="errors"/>
																</div>
															</div>
															<div class="control-group">
																<label for="pubs-twitter" class="control-label">
																	<img src="<c:url value='/resources/imgs/twitter.png'/>">
																</label>
																<div class="controls">
																	<form:input path="twitter" id="pubs-twitter" cssClass="inputs" tabindex="6" maxlength="100"/>
																	<form:errors path="twitter" element="div" cssClass="errors"/>
																</div>
															</div>
															<div class="control-group">
																<label for="pub-id" class="control-label">
																	Pub Url:
																</label>
																<div class="controls">
																	<form:input path="pubId" id="pub-id" cssClass="inputs" tabindex="6" maxlength="100"/>
																	<form:errors path="pubId" element="div" cssClass="errors"/>
																</div>
															</div>
															<div class="control-group">
																<label for="file" class="control-label">
																	<spring:message code="form.pub.image"/>
																</label>
																<div class="controls">
																	<form:input path="file" id="image" type="file" />
																	<form:errors path="file" element="div" cssClass="errors"/>
																</div>
															</div>
															
															<div class="control-group">
																<span>
																	<a id="btnInsertPubAjax" class="buttons">
																		<spring:message code="form.pub.button.send"/>
																	</a>
																</span>
															</div>
														</div>
													</fieldset>
												</div>
											</div>
										</form:form>
									</div>
								</div>
							</div>
						</div>
						<div id="detailsRight">
							<div id="detailsInfo" class="whiteBorder fixedTips">
								<h3 class="title-h3"><spring:message code="form.pub.tips"/></h3>
								<div id="innerInfo">
									<div id="info-site">
										<div id="tipName">
											<span class="tipTitle">
												<spring:message code="form.pub.name"/>
											</span>
											<span class="tipDesc">
												<spring:message code="config.note.name"/>
											</span>
										</div>
										<div id="tipLocation">
											<span class="tipTitle">
												<spring:message code="form.pub.location"/>
											</span>
											<span class="tipDesc">
												<spring:message code="config.note.location"/>
											</span>
										</div>
										<div id="tipEmail">
											<span class="tipTitle">
												<spring:message code="form.pub.email"/>
											</span>
											<span class="tipDesc">
												<spring:message code="config.note.mail"/>
											</span>
										</div>
										<div id="tipUrl">
											<span class="tipTitle">
												Pub Url: 
											</span>
											<span class="tipDesc">
												<spring:message code="config.note.urlId"/>
											</span>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	
	<jsp:include page="includes/footer.jsp"/>
	
</body>
</html>
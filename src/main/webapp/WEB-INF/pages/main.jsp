<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<jsp:include page="includes/header.jsp"/>

<body>
	<div id="principal">
		<jsp:include page="includes/navigator.jsp"/>
		<div id="content" class="degrade">
			
			<div id="content" class="degrade marginList row">
				<div>
					<div id="container" class="row">
						<div class="row marginTop20px">							
							<div id="detailLeft" class="tabs tabLeft">
								<div id="leftTabs">
									<ul>
										<li><a href="#tabs-1"><spring:message code="main.rated"/></a></li>
										<li><a href="#tabs-2"><spring:message code="main.country"/></a></li>
									</ul>
									<div id="tabs-1">
										<div class="inner">
											<div class="innerDetails">
												<ul id="ul-list">
													<c:forEach items="${topPubs}" var="pub">
														<c:url value="/pubs/${pub.pubId}" var="pubDetails"></c:url>
														<li class="li-pub-item floatLeft">
															<div class="pub-item">
																<div id="pubMainPic">
																	<div id="pubPicInner">
																		<a href="${pubDetails}">
																			<span class="pubThumb">
																				<img src="https://s3.amazonaws.com/pubanywhere/${pub.pubId}" class="pubImgTopList"/>
																			</span>
																		</a>
																	</div>
																	<div class="pubInfo">
																		<div class="paddingMain countryName">
																			${pub.name}
																		</div>
																		<div class="paddingMain">
																			<div class="star-list" data-number="${pub.pubTotalRating}"></div>
																			<div class="ratingMainCount">
																				${pub.pubCountRating} reviews
																			</div>
																		</div>
																	</div>
																</div>
															</div>
														</li>
													</c:forEach>
												</ul>
											</div>
										</div>
									</div>
									<div id="tabs-2">
										<div class="inner">
											<div class="innerDetails">
												<ul id="ul-list">
													<c:forEach items="${countries}" var="c">
														<c:url value="/pubs/country/${c.name}" var="countryUrl"></c:url>
														<li class="li-pub-item floatLeft">
															<div class="pub-item">
																<div id="pubMainPic">
																	<div id="pubPicInner">
																		<a href="${countryUrl}">
																			<span class="pubThumb">
																				<img src="https://s3.amazonaws.com/pubanywhere/${c.imgName}" class="countryImg">
																			</span>
																		</a>
																	</div>
																	<div class="pubInfo marginTop25px">
																		<div class="paddingMain countryName">
																			<spring:message code="${c.springCode}"/>
																		</div>
																	</div>
																</div>
															</div>
														</li>
													</c:forEach>
												</ul>
											</div>
										</div>
									</div>
								</div>
							</div>
							
							<div id="detailsRight" class="tabs">
								<div id="rightTabs" class="tabRight">
									<ul>
										<li><a href="#tabs-1"><spring:message code="main.brewmaster"/></a></li>
									</ul>
									<div id="tabs-1">
										<div class="inner marginLeft20px">
											<div id="topUser">
												<ul id="ul-list">
													<c:forEach items="${topUser}" var="user">
														<c:url value="/user/${user.pubUser.emailHash}" var="userProfile"></c:url>
														<li class="li-pub-item floatLeft">
															<div class="pub-item width75px">
																<div>
																	<span class="user-pic-span">
																		<a href="${userProfile}" class="userProfileLink">
																			<img src="https://s3.amazonaws.com/pubanywhere/${user.pubUser.emailHash}" class="userImgProfile"/>
																		</a>
																	</span>
																</div>
																<div class="topUserInfo">
																	<div class="topUserName">
																		<a href="${userProfile}" class="userProfileLink">
																			${user.pubUser.name}
																		</a>
																	</div>
																</div>
															</div>
														</li>
													</c:forEach>
												</ul>
											</div>
										</div>										
									</div>
								</div>
								
								<div id="media" class="tabRight">
									<div class="fb-like-box" data-href="http://www.facebook.com/pubanywhere" data-width="292" data-show-faces="true" data-stream="false" data-header="false"></div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<jsp:include page="includes/footer.jsp"/>
	</div>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<jsp:include page="../includes/header-user.jsp"/>

<body>

	<input type="hidden" id="emailHash" value="${user.pubUser.emailHash}"/>
	<input type="hidden" id="username" value="${user.username}"/>

	<div id="principal" class="frameAll">
		<jsp:include page="../includes/navigator.jsp"/>
		<div id="content" class="degrade marginList row">
			<div>
				<div id="topUserSection">
					<div class="user-info">
						<div id="user-left">
							<div id="user-pic">
								<span id="user-pic-span">
									<img src="https://s3.amazonaws.com/pubanywhere/${user.pubUser.emailHash}" class="userImgProfile"/>
								</span>
							</div>
							<div id="user-welcome">
								<div id="big-username">
									<c:url value="/user/${user.pubUser.emailHash}" var="userProfile"></c:url>
									<a href="${userProfile}">
										${user.pubUser.name}
									</a>
								</div>
								<c:if test="${user.username eq loggedUser.username}">
									<sec:authorize access="hasRole('ROLE_USER')">
										<div>
											<c:url value="/user/${user.pubUser.emailHash}" var="userProfile"></c:url>
											<a id="btnChangePicture" href="${userProfile}">
												<spring:message code="user.main.pic"/>
											</a>
										</div>
									</sec:authorize>
								</c:if>
							</div>
						</div>
					</div>
				</div>
				<div id="container" class="row">
					<div class="row">
						<div id="userLeft">
							<c:if test="${user.username eq loggedUser.username}">
								<sec:authorize access="hasRole('ROLE_USER')">
									<div id="innerTopRightUserProfile" class="whiteBorder">
										<div class="innerUserDetails">
											<h3 class="title-h3">${user.pubUser.name}</h3>
											<div class="user-config-profile aBlack11px">
												<div>
													<img src="<c:url value='/resources/imgs/edit.png'/>">&nbsp;
													<span>
														<a id="btnUserEditProfile" href="">
															<spring:message code="user.main.editprofile"/>
														</a>
													</span>
												</div>
												<div>
													<img src="<c:url value='/resources/imgs/logout.png'/>">&nbsp;
													<span>
														<a>
															<a href="<c:url value="/logout"/>"><spring:message code="user.main.logout"/></a>
														</a>
													</span>
												</div>
											</div>
										</div>
									</div>
								</sec:authorize>
							</c:if>
							<div id="innerTopRightUserPubs" class="whiteBorder">
								<div class="innerUserDetails">
									<h3 class="title-h3"><spring:message code="user.main.manage"/></h3>
									<div class="user-config-profile aBlack11px">
										<%-- <c:if test="${user.username eq loggedUser.username}">
											<div>
												<img src="<c:url value='/resources/imgs/rss.png'/>">&nbsp;
												<span>
													<a>
														<spring:message code="user.main.feed"/>
													</a>
												</span>
											</div>
										</c:if> --%>
										<div>
											<img src="<c:url value='/resources/imgs/reviews.png'/>">&nbsp;
											<span>
												<a id="btnUserLastReviews" href="">
													<spring:message code="user.main.reviews"/>
												</a>
											</span>
										</div>
										<div>
											<img src="<c:url value='/resources/imgs/favorite.png'/>">&nbsp;
											<span>
												<a id="btnUserFavorites" href="">
													<spring:message code="user.main.favorite"/>
												</a>
											</span>
										</div>
										<div>
											<img src="<c:url value='/resources/imgs/wishlist.png'/>">&nbsp;
											<span>
												<a id="btnUserWishList" href="">
													<spring:message code="user.main.wishlist"/>
												</a>
											</span>
										</div>
									</div>
								</div>
							</div>
							<%-- <c:if test="${user.username eq loggedUser.username}">
								<sec:authorize access="hasRole('ROLE_USER')">
									<div id="innerTopRightUserProfile" class="whiteBorder">
										<div class="innerUserDetails">
											<h3 class="title-h3"><spring:message code="user.main.promotions"/></h3>
											<div class="user-config-profile aBlack11px">
												<div>
													<img src="<c:url value='/resources/imgs/voucher.png'/>">&nbsp;
													<span>
														<a>
															<spring:message code="user.main.promotions.vouchers"/>
														</a>
													</span>
												</div>
											</div>
										</div>
									</div>
								</sec:authorize>
							</c:if> --%>
						</div>
						<div id="userRight">
							<c:if test="${user.username eq loggedUser.username}">
								<sec:authorize access="hasRole('ROLE_USER')">
									<div id="userMenuEditProfile">
										<jsp:include page="userEditProfile.jsp"/>
									</div>
								</sec:authorize>
							</c:if>

							<div id="userMenuLastReviews">
								<jsp:include page="userLastReviews.jsp"/>
							</div>
							
							<div id="userMenuFavorites"></div>
							
							<div id="userMenuWishList"></div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	
	<div id="profilePicture" title="<spring:message code="user.edit.pic.title"/>">
		<form:form action="#" method='POST' id="uploadForm" commandName="uploadForm" acceptCharset="UTF-8" enctype="multipart/form-data">
			<form:input path="file" id="file" type="file" cssClass="fileUpload"/>
		
			<div class="padding10px">
				<a id="btnUpload"><spring:message code="user.edit.pic.choose"/></a>
				<div id="fileDesc"></div>
				<div class="floatRight">
					<a id="btnSendUpload">
						<img src="<c:url value='/resources/imgs/accept.png'/>">
					</a>
					&nbsp;
					<a id="btnCancelUpload">
						<img src="<c:url value='/resources/imgs/cancel.png'/>">
					</a>
				</div>
			</div>
		</form:form>
	</div>
	
	<jsp:include page="../includes/footer.jsp"/>
	
</body>
</html>
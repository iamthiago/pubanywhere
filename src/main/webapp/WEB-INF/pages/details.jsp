<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<jsp:include page="includes/header-detail.jsp"/>

<body onload="initialize()">
	
	<input type="hidden" value="${pub.pubId}" id="pubId"/>
	
	<input type="hidden" value="${pub.name}" id="pubName">
	<input type="hidden" value="${pub.lat}" id="pubLat">
	<input type="hidden" value="${pub.lng}" id="pubLng">
	
	<div id="principal" class="frameAll">
		<jsp:include page="includes/navigator.jsp"/>
		<div id="content" class="degrade marginList row">
			<div>
				<div id="topSection">
					<div class="topTitle h1">
						<h1>${pub.name}</h1>
					</div>
				</div>
				<div id="container" class="row">
					<div class="row">
						<div id="detailLeft">
							<div id="innerLeft" class="whiteBorder">
								<div class="innerDetails">
									<div id="address">
										<p>${pub.local}</p>
									</div>
									<div id="imageDiv">
										<div>
											<div id="pubImage">
												<img src="https://s3.amazonaws.com/pubanywhere/${pub.pubId}" class="pubImgDetails"/>
											</div>
										</div>
									</div>
								</div>
							</div>
							<div id="innerLeft-social" class="whiteBorder">
								<div id="twitterShare">
									<a href="https://twitter.com/share" class="twitter-share-button">Tweet</a>
									<script>
										!function(d,s,id){var js,fjs=d.getElementsByTagName(s)[0];
										if(!d.getElementById(id)){js=d.createElement(s);
										js.id=id;js.src="//platform.twitter.com/widgets.js";
										fjs.parentNode.insertBefore(js,fjs);}}(document,"script","twitter-wjs");
									</script>
								</div>
								
								<div id="googleOne">
									<div class="g-plusone" data-size="medium"></div>
								</div>
								
								<div id="facebookLike">
									<div class="fb-like" data-send="false" data-layout="button_count" data-width="450" data-show-faces="false" data-font="arial"></div>
								</div>
								
								<div id="pubViews">
									<div id="ratingCount">
										${pub.pubCountRating} <spring:message code="details.review"/>
									</div>
									<div id="star-pub" data-number="${pub.pubTotalRating}"></div>
								</div>
							</div>
							<div id="innerLeft-desc" class="whiteBorder">
								<div id="pub-desc">
									${pub.descricao}
								</div>
							</div>
							<div id="innerLeft-users-desc" class="whiteBorder">
								<div>
									<div class="action-review">
										<sec:authorize access="hasRole('ROLE_USER')">
											<a id="writeReview">
												<spring:message code="details.button.writeReview"/>
											</a>
										</sec:authorize>
									</div>
									<h3 class="title-h3"><spring:message code="details.review"/> (${pub.pubCountRating})</h3>
								</div>
								<div id="divUserReview">
									<jsp:include page="user/userPubReviews.jsp"/>
								</div>
							</div>
							<div id="innerLeft-ads">
								<div>
									<script type="text/javascript"><!--
										google_ad_client = "ca-pub-9435637599979561";
										/* new details bottom */
										google_ad_slot = "4853241291";
										google_ad_width = 728;
										google_ad_height = 90;
										//-->
									</script>
									<script type="text/javascript"
										src="http://pagead2.googlesyndication.com/pagead/show_ads.js">
									</script>
								</div>
							</div>
						</div>
						
						<div id="detailsRight">
							<sec:authorize access="hasRole('ROLE_USER')">
								<div id="pubAction">
									<h3 class="title-h3 action-h3">
										<a id="btnAddFavorite" href="">
											<div id="favorite" class="div-action ${favCheckedClass}">
												<spring:message code="details.button.addFavorite"/>
											</div>
										</a>
										<a id="btnAddWishList" href="">
											<div id="wishList" class="div-action ${wishCheckedClass}">
												<spring:message code="details.button.addWishList"/>
											</div>
										</a>
									</h3>
								</div>
							</sec:authorize>
							<div id="detailMap" class="whiteBorder">
								<div id="pubMap"></div>
							</div>
							<div id="detailsInfo" class="whiteBorder">
								<h3 class="title-h3">
									<spring:message code="details.contact"/>
								</h3>
								<div id="innerInfo">
									<div id="info-site">
										<img src="<c:url value='/resources/imgs/laptop.png'/>">&nbsp;
										<span>
											<c:if test="${pub.website != ''}">
												<a href="${pub.website}" target="_blank">${pub.website}</a>
											</c:if>
										</span>
									</div>
									<div id="info-phone">
										<img src="<c:url value='/resources/imgs/phone.png'/>">&nbsp;
										<span>
											<c:if test="${pub.phone != ''}">
												${pub.phone}
											</c:if>
										</span>
									</div>
									<div id="info-mail">
										<img src="<c:url value='/resources/imgs/mail.png'/>">&nbsp;
										<span>
											<c:if test="${pub.email != ''}">
												<a href="mailto:'${pub.email}'">${pub.email}</a>
											</c:if>
										</span>
									</div>
									<div id="info-social">
										<div id="info-facebook">
											<span>
												<c:if test="${pub.facebook != ''}">
													<a href="${pub.facebook}" target="_blank">
														<img src="<c:url value='/resources/imgs/facebook.png'/>" title="facebook">
													</a>
												</c:if>
											</span>
										</div>
										<div id="info-twitter">
											<span>
												<c:if test="${pub.twitter != ''}">
													<a href="${pub.twitter}" target="_blank">
														<img src="<c:url value='/resources/imgs/twitter.png'/>" title="twitter">
													</a>
												</c:if>
											</span>
										</div>
									</div>
								</div>
							</div>
							<div id="details-ads">
								<div id="innerAds">
									<script type="text/javascript"><!--
										google_ad_client = "ca-pub-9435637599979561";
										/* new details right */
										google_ad_slot = "7043154890";
										google_ad_width = 300;
										google_ad_height = 250;
										//-->
									</script>
									<script type="text/javascript"
										src="http://pagead2.googlesyndication.com/pagead/show_ads.js">
									</script>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	
	<div id="insertMessage" title="<spring:message code="details.button.writeReview"/>">
		<form:form action="" method='POST' id="reviewForm" commandName="messageForm" acceptCharset="UTF-8">
			<form:hidden path="pubId" value="${pub.pubId}"/>
			<form:hidden path="rating" id="setRating"/>
			
			<div>
				${erroPostReview}
			</div>
			<div>
				<h3>${pub.name}</h3>
			</div>
			<div id="star-modal"></div>
			<div>
				<form:textarea path="message" rows="20" cols="40" cssClass="text-area-detail" tabindex="1" maxlength="300"/>
			</div>
			<div>
				<input id="shareReview" type="submit" name="submit" value="<spring:message code="details.button.sharereview"/>" class="buttons"/>
			</div>
		</form:form>
	</div>

	<jsp:include page="includes/footer.jsp"/>
	
</body>
</html>
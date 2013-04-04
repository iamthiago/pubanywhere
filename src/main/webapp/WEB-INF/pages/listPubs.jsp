<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<jsp:include page="includes/header-listPubs.jsp"/>

<body>
	<div id="principal" class="frameAll">
		<jsp:include page="includes/navigator.jsp"/>
		<div id="content" class="degrade marginList row">
			<div>
				<div id="topSection">
					<div class="topTitle h1">
						<h1>${listTitle}</h1>
					</div>
				</div>
				<div id="container" class="row">
					<div class="row">
						<div id="top100AdsLeft">
							<div>
								<script type="text/javascript"><!--
									google_ad_client = "ca-pub-9435637599979561";
									/* new top100 left */
									google_ad_slot = "2032702493";
									google_ad_width = 160;
									google_ad_height = 600;
									//-->
								</script>
								<script type="text/javascript"
									src="http://pagead2.googlesyndication.com/pagead/show_ads.js">
								</script>
							</div>
						</div>
						<div id="top100Content">
							<ul id="ul-list">
								<c:forEach items="${pubs}" var="pub">
									<c:url value="/pubs/${pub.pubId}" var="pubDetails"></c:url>
									<li class="li-pub-item">
										<div class="pub-item">
											<div id="pubMainPic">
												<div id="pubPicInner">
													<a href="${pubDetails}">
														<span class="pubThumb">
															<img src="https://s3.amazonaws.com/pubanywhere/${pub.pubId}" class="pubImgTopList"/>
														</span>
													</a>
												</div>
											</div>
											<div id="pubMainInfo">
												<div id="pubName" class="h1">
													<a href="${pubDetails}">
														<div id="innerName">
															${pub.name}
														</div>
													</a>
												</div>
												<div id="list-rating">
													<div class="star-list space" data-number="${pub.pubTotalRating}"></div>
													<div>
														${pub.pubCountRating} reviews
													</div>
												</div>
												<div id="pubCity" class="space">${pub.city}</div>
												<div id="pubCountry" class="space">${pub.country}</div>
												<div id="pubDesc" class="space">
													<div id="innerDesc">
														${pub.descricao}
													</div>
												</div>
											</div>
										</div>
									</li>
								</c:forEach>
							</ul>
						</div>
						<div id="top100AdsBottom">
							<div>
								<script type="text/javascript"><!--
									google_ad_client = "ca-pub-9435637599979561";
									/* new top100 bottom */
									google_ad_slot = "6462902098";
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
				</div>
			</div>
		</div>
	</div>
	<jsp:include page="includes/footer.jsp"/>
</body>
</html>
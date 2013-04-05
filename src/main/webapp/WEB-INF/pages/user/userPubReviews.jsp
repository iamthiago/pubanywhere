<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<script type="text/javascript" src="<c:url value='/resources/js/jquery/jquery.raty.js' />"></script>

<script type="text/javascript">
	jQuery(document).ready(function($) {
		
		$('.star-user').each(function() {
			$(this).raty({
				path: '/resources/imgs',
				readOnly : true,
				score : $(this).attr('data-number')
			});
		});
	})
</script>

<ul class="ul-review">
	<c:forEach items="${pubReview}" var="review" varStatus="i">
		<c:choose>
			<c:when test="${i.count % 5 == 0}">
				<li>
					<div>
						<div class="user-review">
							<div class="user-rating-review">
								<div>
									<script type="text/javascript"><!--
										google_ad_client = "ca-pub-9435637599979561";
										/* new bottom inside comments */
										google_ad_slot = "7747721699";
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
				</li>
				<li>
					<div>
						<c:url value="/user/${review.users.pubUser.emailHash}" var="userProfile"></c:url>
						<div id="user-pic">
							<span class="user-pic-span">
								<a href="${userProfile}" class="userProfileLink">
									<img src="https://s3.amazonaws.com/pubanywhere/${review.users.pubUser.emailHash}" class="userImgProfile"/>
								</a>
							</span>
						</div>
						<div class="user-review">
							<div class="username-review">
								<a href="${userProfile}" class="userProfileLink">
									${review.users.pubUser.name}
								</a>
							</div>
							<div class="star-user" data-number="${review.messageRating}"></div>
							<div class="user-rating-review">
								${review.messageReview}
							</div>
						</div>
					</div>
				</li>
			</c:when>
			<c:otherwise>
				<li>
					<div>
						<c:url value="/user/${review.users.pubUser.emailHash}" var="userProfile"></c:url>
						<div id="user-pic">
							<span class="user-pic-span">
								<a href="${userProfile}" class="userProfileLink">
									<img src="https://s3.amazonaws.com/pubanywhere/${review.users.pubUser.emailHash}" class="userImgProfile"/>
								</a>
							</span>
						</div>
						<div class="user-review">
							<div class="username-review">
								<a href="${userProfile}" class="userProfileLink">
									${review.users.pubUser.name}
								</a>
							</div>
							<div class="star-user" data-number="${review.messageRating}"></div>
							<div class="user-rating-review">
								${review.messageReview}
							</div>
						</div>
					</div>
				</li>
			</c:otherwise>
		</c:choose>
	</c:forEach>
</ul>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<script type="text/javascript" src="<c:url value='/resources/js/jquery/jquery.raty.js' />"></script>

<script type="text/javascript">
	jQuery(document).ready(function($) {
		$('.star-user-inside').each(function() {
			$(this).raty({
				path: '/resources/imgs',
				readOnly : true,
				score : $(this).attr('data-number')
			});
		});
	})
</script>

<div id="innerLeft" class="whiteBorder userInnerLeft">
	<h3 class="title-h3"><spring:message code="user.main.reviews"/></h3>
	<div class="innerDetails">
		<div id="userLastReview">
			<ul class="ul-review">
				<c:forEach items="${lastReviews}" var="review">
					<li>
						<div>
							<c:url value="/pubs/${review.pub.pubId}" var="pubDetails"></c:url>
							<div id="pub-review-pic">
								<a href="${pubDetails}">
									<span class="pubThumb">
										<img src="https://s3.amazonaws.com/pubanywhere/${review.pub.pubId}"/>
									</span>
								</a>
							</div>
							<div id="user-pub-review">
								<div id="user-pub-review-title">
									<a id="review-pub-name" href="${pubDetails}">
										${review.pub.name}
									</a>
								</div>
								<div class="star-user-inside" data-number="${review.messageRating}"></div>
								<div>
									${review.messageReview}
								</div>
							</div>
						</div>
					</li>
				</c:forEach>
			</ul>
		</div>
	</div>
</div>
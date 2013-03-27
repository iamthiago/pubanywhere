<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<div id="innerLeft" class="whiteBorder userInnerLeft">
	<h3 class="title-h3">${favWishTitle}</h3>
	<div class="innerDetails">
		<div id="userFavoriteReview" class="padding10px">
			<ul id="ul-list-favorites">
			
				<div class="noPubs">
					${noPubs}
				</div>
			
				<c:forEach items="${favWishPubs}" var="f">
					<li>
						<div class="div-favorite">
							<c:url value="/pubs/${f.pub.pubId}" var="pubDetails"></c:url>
							<div class="favoriteName">
								<a href="${pubDetails}">
									${f.pub.name}
								</a>
							</div>
							<a href="${pubDetails}">
								<img src="https://s3.amazonaws.com/pubanywhere/${f.pub.pubId}"/>
							</a>
						</div>
					</li>
				</c:forEach>
			</ul>
		</div>
	</div>
</div>
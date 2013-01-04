<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<jsp:include page="includes/header-detail.jsp"/>

<body>
	
	<jsp:include page="includes/navigator.jsp"/>

	<div class="borderAll">
		<div id="left">
			<div id="pubHeader">
				<h1>
					${pub.nome}
				</h1>
				<div id="control-title-description">
					<h3>
						${pub.local}
					</h3>
				</div>
			</div>
			<div class="pubPanel panelLeft">
				<div class="title" id="divImg">
					<img src="https://s3.amazonaws.com/pubanywhere/${pub.imageName}"/>
				</div>
				<div class="title">
					<h3><spring:message code="form.pub.description"/></h3>
				</div>
				<div id="pubDescription" class="margin15px">
					${pub.descricao}
				</div>
				
				<div class="title">
					<h3><spring:message code="details.comments"/></h3>
				</div>
				<div id="fbComment">
					<div class="fb-comments" data-href="${fbUrlComments}" data-width="630" data-num-posts="2"></div>
				</div>
			</div>
			<div id="right" class="pubPanel">
				<div>
				
					<div class="margin15px center">
						<h3>
							<spring:message code="nav.button.contact"/>
						</h3>
					</div>
					
					<div class="margin15px">
						<img src="<c:url value='/resources/imgs/laptop.png'/>">&nbsp;
						<span>
							<c:if test="${pub.website != ''}">
								<a href="${pub.website}" target="_blank">${pub.website}</a>
							</c:if>
						</span>
						<br>
						
						<img src="<c:url value='/resources/imgs/phone.png'/>">&nbsp;
						<span>
							<c:if test="${pub.phone != ''}">
								${pub.phone}
							</c:if>
						</span>
						<br>
						
						<img src="<c:url value='/resources/imgs/mail.png'/>">&nbsp;
						<span>
							<c:if test="${pub.email != ''}">
								<a href="mailto:'${pub.email}'">${pub.email}</a>
							</c:if>
						</span>
						<br>
						
						<img src="<c:url value='/resources/imgs/facebook.png'/>">&nbsp;
						<span>
							<c:if test="${pub.facebook != ''}">
								<a href="http://www.facebook.com/${pub.facebook}" target="_blank">${pub.facebook}</a>
							</c:if>
						</span>
						<br>
						
						<img src="<c:url value='/resources/imgs/twitter.png'/>">&nbsp;
						<span>
							<c:if test="${pub.twitter != ''}">
								<a href="http://www.twitter.com/${pub.twitter}" target="_blank">${pub.twitter}</a>
							</c:if>
						</span>
					</div>
					
					<div class="title center">
						<h3><spring:message code="details.promote"/></h3>
					</div>
					<div class="margin15px center">
						<div id="googleOne">
							<div class="g-plusone"></div>
						</div>
						
						<div id="facebookLike">
							<div
								class="fb-like"
								data-send="false"
								data-layout="button_count"
								data-width="450"
								data-show-faces="true"
								data-action="recommend">
							</div>
						</div>
					</div>
					
					<div class="title center">
						<h3><spring:message code="details.advertising.title"/></h3>
					</div>
					<div id="advertising" class="title center">
						<spring:message code="details.advertising.detail"/>
					</div>
					
					<div class="title center">
						<h3><spring:message code="details.follow"/></h3>
					</div>
					<div id="fbLikeBox">
						<br>
						<div class="center">
							<a href="https://twitter.com/pubanywhere" class="twitter-follow-button" data-show-count="true" data-show-screen-name="false">Follow @pubanywhere</a>
						</div>
						<br>
						<div 
							class="fb-like-box" 
							data-href="http://www.facebook.com/pubanywhere" 
							data-width="292" 
							data-show-faces="true" 
							data-stream="false" 
							data-header="false">
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	
	<jsp:include page="includes/footer.jsp"/>
	
</body>
</html>
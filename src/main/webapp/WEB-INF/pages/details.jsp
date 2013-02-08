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
					${pub.name}
				</h1>
				<div id="control-title-description">
					<h3>
						${pub.local}
					</h3>
				</div>
			</div>
			<div class="pubPanel panelLeft">
				<div id="divImg" class="padding">
					<img src="https://s3.amazonaws.com/pubanywhere/${pub.pubId}"/>
				</div>
				
				<div id="socialDetail" class="padding">
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
				</div>
				
				<div id="descTitle" class="title padding">
					<h3><spring:message code="form.pub.description"/></h3>
				</div>				
				<div id="pubDescription" class="margin15px">
					${pub.descricao}
				</div>
				
				<div class="title padding">
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
							<spring:message code="details.contact"/>
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
	
	<div id="adsDetail">
		<div id="adsLeftDetail">
			<script type="text/javascript"><!--
				google_ad_client = "ca-pub-9435637599979561";
				/* Detail - Left */
				google_ad_slot = "5055377698";
				google_ad_width = 120;
				google_ad_height = 600;
				//-->
			</script>
			<script type="text/javascript"
				src="http://pagead2.googlesyndication.com/pagead/show_ads.js">
			</script>
		</div>
		
		<div id="adsRightDetail">
			<script type="text/javascript"><!--
				google_ad_client = "ca-pub-9435637599979561";
				/* Detail - Right */
				google_ad_slot = "6532110899";
				google_ad_width = 120;
				google_ad_height = 600;
				//-->
			</script>
			<script type="text/javascript"
				src="http://pagead2.googlesyndication.com/pagead/show_ads.js">
			</script>
		</div>
	</div>
	
	<jsp:include page="includes/footer.jsp"/>
	
</body>
</html>
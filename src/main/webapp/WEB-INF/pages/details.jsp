<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<jsp:include page="includes/header-contact.jsp"/>

<body>
	
	<div id="fb-root"></div>
	<script>(function(d, s, id) {
	  var js, fjs = d.getElementsByTagName(s)[0];
	  if (d.getElementById(id)) return;
	  js = d.createElement(s); js.id = id;
	  js.src = "//connect.facebook.net/pt_BR/all.js#xfbml=1";
	  fjs.parentNode.insertBefore(js, fjs);
	}(document, 'script', 'facebook-jssdk'));</script>
	
	<jsp:include page="includes/navigator.jsp"/>

	<div class="borderAll">
		<div id="left">
			<div id="pubName">
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
				
					<div style="text-align: center;" class="margin15px">
						<h3>
							<spring:message code="nav.button.contact"/>
						</h3>
					</div>
					
					<div class="margin15px">
						<img src="<c:url value='/resources/imgs/laptop.png'/>">&nbsp;
						<span>
							${pub.website}
						</span>
						<br>
						
						<img src="<c:url value='/resources/imgs/phone.png'/>">&nbsp;
						<span>
							${pub.phone}
						</span>
						<br>
						
						<img src="<c:url value='/resources/imgs/mail.png'/>">&nbsp;
						<span>
							${pub.email}
						</span>
					</div>
					
					<div class="title" style="text-align: center;">
						<h3><spring:message code="details.promote"/></h3>
					</div>
					<div id="socialDetails" class="margin15px">
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
				</div>
			</div>
		</div>
	</div>
	
	<jsp:include page="includes/footer.jsp"/>
	
</body>
</html>
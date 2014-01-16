<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<html lang="en-US">

<jsp:include page="includes/css-include.jsp"/>

<body>
<div id="wrapper-outer" >
    <div id="wrapper">
        <div id="wrapper-inner">
            
            <!-- BREADCRUMB -->
            <jsp:include page="includes/breadcrumb-include.jsp"/>

            <!-- HEADER -->
            <jsp:include page="includes/header-include.jsp"/>

            <!-- NAVIGATION -->
            <jsp:include page="includes/navigator-include.jsp"/>

            <!-- CONTENT -->
            <div id="content">

<div class="container">

    <div id="main">
        <div class="row">
            <div class="span9">
                <h1 class="page-header">${listTitle}</h1>

                <div class="properties-rows">
					<div class="row">
						<c:forEach items="${pubs}" var="pub">
							<c:url value="/pubs/${pub.pubId}" var="pubDetails"></c:url>
							
							<div class="property span9">
								<div class="row">
									<div class="image span3">
										<div class="content pubDiv200">
											<a href="${pubDetails}"></a>
											<%-- <img src="https://s3.amazonaws.com/pubanywhere/${pub.pubId}" class="pubImg270" alt=""/> --%>
										</div><!-- /.content -->
									</div><!-- /.image -->
		
									<div class="body span6">
										<div class="title-price row">
											<div class="title span4">
												<h2>
													<a href="${pubDetails}">${pub.name}</a>
												</h2>
											</div><!-- /.title -->
											<div class="price">
												<div class="star-list star" data-number="${pub.pubTotalRating}"></div>
											</div><!-- /.price -->
										</div><!-- /.title -->
										
										<div class="location">
											${pub.city} - ${pub.country}
										</div><!-- /.location -->
										
										<p class="ellipsis">
											${pub.descricao}
										</p>
									</div><!-- /.body -->
								</div><!-- /.property -->
							</div><!-- /.row -->
						</c:forEach>
					</div>
				</div><!-- /.properties-rows -->
				
				<!-- bootstrap pagination -->
				<jsp:include page="includes/pagination-include.jsp"/>

		</div>
            <div class="sidebar span3">
                <div class="ad widget">
				    <h2>Advertisements</h2>
				    <div class="content">
				        <a href="#"><img src="<c:url value='/resources/new/img/banner/1.gif'/>" alt="Banner"></a>
				        <a href="#"><img src="<c:url value='/resources/new/img/banner/2.gif'/>" alt="Banner"></a>
				        <a href="#"><img src="<c:url value='/resources/new/img/banner/3.gif'/>" alt="Banner"></a>
				        <a href="#"><img src="<c:url value='/resources/new/img/banner/4.gif'/>" alt="Banner"></a>
				    </div><!-- /.content -->
				</div><!-- /.ad -->
            </div>
        </div>
    </div>
</div>

    </div><!-- /#content -->
</div><!-- /#wrapper-inner -->

<jsp:include page="includes/footer-include.jsp"/>

</div><!-- /#wrapper -->
</div><!-- /#wrapper-outer -->

<jsp:include page="includes/js-include.jsp"/>

<script type="text/javascript" src="<c:url value='/resources/new/js/pub-list.js'/>"></script>

</body>
</html>
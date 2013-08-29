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
            <div id="content"><div class="container">
            
            <input type="hidden" value="${pub.lat}" id="pubLat">
			<input type="hidden" value="${pub.lng}" id="pubLng">
            
    <div id="main">
        <div class="row">
            <div class="span8">
                <h1 class="page-header">${pub.local}</h1>

                <div class="carousel property">
                    <div class="preview">
                        <img src="https://s3.amazonaws.com/pubanywhere/${pub.pubId}"/>
                    </div><!-- /.preview -->
                </div>
                <!-- /.carousel -->

                <div class="property-detail">
                    <div class="pull-left overview">
                        <div class="row">
                            <div class="span3">
                                <h2>Overview</h2>

                                <table>
                                    <tr>
                                        <th>Name:</th>
                                        <td>${pub.name}</td>
                                    </tr>
                                    <tr>
                                        <th>Location:</th>
                                        <td>${pub.city}</td>
                                    </tr>
                                    <tr>
                                        <th>Phone:</th>
                                        <td>${pub.phone}</td>
                                    </tr>
                                    <tr>
                                        <th>Email:</th>
                                        <td>${pub.email}</td>
                                    </tr>
                                    <tr>
                                        <th>Page:</th>
                                        <td>${pub.website}</td>
                                    </tr>
                                    <!-- <tr>
                                    	<th>Rate:</th>
                                    	<td><div id="star-pub" class="star"></div></td>
                                    </tr> -->
                                </table>
                            </div>
                        </div>
                    </div>

                    <p>${pub.descricao}</p>
					
					<form:form action="" method='POST' id="reviewForm" commandName="messageForm" acceptCharset="UTF-8">
						<form:hidden path="pubId" value="${pub.pubId}"/>
						<form:hidden path="rating" id="setRating"/>
					
						<div class="forceLeft width100">
							<h2>Comments</h2>
						</div>
						
						<div class="widget our-agents">	
						    <div class="content">
								<c:url value="/pubs/${pub.pubId}" var="commentUrl"></c:url>
								<div class="fb-comments" data-href="${commentUrl}" data-width="720" num_posts="10" order_by="reverse_time"></div>
						    </div>
						</div>
					</form:form>
                </div>

            </div>
            <div class="sidebar span4">
                <div class="widget our-agents">
				    <div class="title">
						<h2>
							Map
						</h2>
				    </div>
					<div class="property-detail">
						<div id="property-map"></div>
					</div>
				</div>
				
				<div class="widget our-agents">
				    <div class="title">
						<h2>
							Rate
						</h2>
				    </div>
				    <div class="content">
				    	<div class="agent">
				    		<div class="text-left">
				    			Your rating:&nbsp;<div class="star-detail star phone pull-right"></div>
				    		</div>
				    		<div class="text-left">
								Ratings: <div class="pull-right">${pub.pubTotalRating} / 5.0 from ${pub.pubCountRating} user(s)</div>
							</div>
				    	</div>
				    </div>
				</div>
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

</body>
</html>
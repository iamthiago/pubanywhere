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
            <div id="content"><div class="map-wrapper">
    <div class="map">
        <div class="map-inner back_content"></div><!-- /.map-inner -->

        <div class="container">
            <div class="row">
                <div class="span3 forceLeft">
                    <div class="property-filter pull-left noBackground">
                        <div class="content">
                        	<div class="control-group">
                        		<h2 style="color: white; font-weight: bold;">
	                        		<spring:message code="index.apps"/>
                        		</h2>
                        	</div>
                            <div id="apple" class="control-group">
                            	<img src="<c:url value='/resources/new/img/apple.png'/>"/>
                            </div>
                            
                            <div id="google" class="control-group">
                            	<img src="<c:url value='/resources/new/img/android.png'/>"/>
                            </div>
                        </div><!-- /.content -->
                    </div><!-- /.property-filter -->
                </div><!-- /.span3 -->
            </div><!-- /.row -->
        </div><!-- /.container -->
    </div><!-- /.map -->
</div><!-- /.map-wrapper -->
<div class="container">
    <div id="main">
        <div class="row">
            <div class="span9">
                <h1 class="page-header"><spring:message code="index.pubs"/></h1>
                <div class="properties-grid">
    <div class="row">
		<c:forEach items="${topPubs}" var="pub">
			<c:url value="/pubs/${pub.pubId}" var="pubDetails"></c:url>
	        
	        <div class="property span3">
	            <div class="image padding10px">
	                <div class="content">
	                    <a href="${pubDetails}"></a>
						<span class="pubThumb">
							<%-- <img src="https://s3.amazonaws.com/pubanywhere/${pub.pubId}" class="pubImgTopList"/> --%>
						</span>
	                </div><!-- /.content -->
	            </div><!-- /.image -->
	
	            <div class="title">
	                <h2><a href="detail.html">${pub.name}</a></h2>
	            </div><!-- /.title -->
	
	            <div class="location">${pub.country}</div><!-- /.location -->
	            <div class="location">
	                <div class="star-index star" data-number="${pub.pubTotalRating}"></div>
	            </div>
	        </div>
		</c:forEach>
    </div><!-- /.row -->
</div><!-- /.properties-grid -->
            </div>
            <div class="sidebar span3">
                <div class="widget our-agents">
    <div class="title">
        <h2><spring:message code="index.users"/></h2>
    </div><!-- /.title -->

    <div class="content">
    	<c:forEach items="${topUser}" var="user">
			<c:url value="/user/" var="userProfile"></c:url>
        
	        <div class="agent">
	            <div class="image userIndexImg">
	                <img src="https://graph.facebook.com/${user.facebookUser.facebookProfileId}/picture?type=normal"/>
	            </div><!-- /.image -->
	            <div class="name">${user.facebookUser.firstName}</div>
	            <div class="phone">
	            	Rank:&nbsp;
	            	<div class="phone pull-right">
	            		<div class="star-topuser star" data-number="${user.rank}"></div>
	            	</div>
	            </div>
	            <div class="phone">
	            	Reviews:&nbsp;
	            	<div class="phone pull-right">${user.reviews}</div>
	            </div>
	        </div><!-- /.agent -->
		</c:forEach>
    </div><!-- /.content -->
</div><!-- /.our-agents -->
            </div>
        </div>
        <div class="carousel">
    <h2 class="page-header"><spring:message code="index.country"/></h2>

    <div class="content">
        <a class="carousel-prev" href="detail.html">Previous</a>
        <a class="carousel-next" href="detail.html">Next</a>
        <ul>
            <li>
                <div class="image">
                    <a href="<c:url value='/pubs/country/United States'/>"></a>
					<img src="https://s3.amazonaws.com/pubanywhere/united_states.jpg" class="pubImg270" alt=""/>
                </div><!-- /.image -->
                <div class="title">
                    <h3><a href="<c:url value='/pubs/country/United States'/>"><spring:message code="country.unitedstates"/></a></h3>
                </div><!-- /.title -->
            </li>
            <li>
                <div class="image">
                    <a href="<c:url value='/pubs/country/Ireland'/>"></a>
                    <img src="https://s3.amazonaws.com/pubanywhere/ireland.jpg" class="pubImg270" alt=""/>
                </div><!-- /.image -->
                <div class="title">
                    <h3><a href="<c:url value='/pubs/country/Ireland'/>"><spring:message code="country.ireland"/></a></h3>
                </div><!-- /.title -->
            </li>

            <li>
                <div class="image">
                    <a href="<c:url value='/pubs/country/Germany'/>"></a>
                    <img src="https://s3.amazonaws.com/pubanywhere/germany.jpg" class="pubImg270" alt=""/>
                </div><!-- /.image -->
                <div class="title">
                    <h3><a href="<c:url value='/pubs/country/Germany'/>"><spring:message code="country.germany"/></a></h3>
                </div><!-- /.title -->
            </li>

            <li>
                <div class="image">
                    <a href="<c:url value='/pubs/country/United Kingdom'/>"></a>
                    <img src="https://s3.amazonaws.com/pubanywhere/england.jpg" class="pubImg270" alt=""/>
                </div><!-- /.image -->
                <div class="title">
                    <h3><a href="<c:url value='/pubs/country/United Kingdom'/>"><spring:message code="country.unitedkingdom"/></a></h3>
                </div><!-- /.title -->
            </li>

            <li>
                <div class="image">
                    <a href="<c:url value='/pubs/country/The Netherlands'/>"></a>
                    <img src="https://s3.amazonaws.com/pubanywhere/netherlands.jpg" class="pubImg270" alt=""/>
                </div><!-- /.image -->
                <div class="title">
                    <h3><a href="<c:url value='/pubs/country/The Netherlands'/>"><spring:message code="country.thenetherlands"/></a></h3>
                </div><!-- /.title -->
            </li>
            
            <li>
                <div class="image">
                    <a href="<c:url value='/pubs/country/Czech Republic'/>"></a>
                    <img src="https://s3.amazonaws.com/pubanywhere/praga.jpg" class="pubImg270" alt=""/>
                </div><!-- /.image -->
                <div class="title">
                    <h3><a href="<c:url value='/pubs/country/Czech Republic'/>"><spring:message code="country.czechrepublic"/></a></h3>
                </div><!-- /.title -->
            </li>
            
            <li>
                <div class="image">
                    <a href="<c:url value='/pubs/country/Brazil'/>"></a>
                    <img src="https://s3.amazonaws.com/pubanywhere/brazil.jpg" class="pubImg270" alt=""/>
                </div><!-- /.image -->
                <div class="title">
                    <h3><a href="<c:url value='/pubs/country/Brazil'/>"><spring:message code="country.brazil"/></a></h3>
                </div><!-- /.title -->
            </li>
            
            <li>
                <div class="image">
                    <a href="<c:url value='/pubs/country/Argentina'/>"></a>
                    <img src="https://s3.amazonaws.com/pubanywhere/argentina.jpg" class="pubImg270" alt=""/>
                </div><!-- /.image -->
                <div class="title">
                    <h3><a href="<c:url value='/pubs/country/Argentina'/>"><spring:message code="country.argentina"/></a></h3>
                </div><!-- /.title -->
            </li>
        </ul>
    </div><!-- /.content -->
</div><!-- /.carousel -->
<div class="features">
    <h2 class="page-header"><spring:message code="website.feature"/></h2>

    <div class="row">
        <div class="item span4">
            <div class="row">
                <div class="icon span1">
                    <img src="<c:url value='/resources/new/img/icons/features-seo.png'/>" alt="">
                </div><!-- /.icon -->

                <div class="text span3">
                    <h3><spring:message code="index.icon.find.title"/></h3>
                    <p><spring:message code="index.icon.find.desc"/></p>
                </div><!-- /.logo -->
            </div><!-- /.row -->
        </div><!-- /.item -->

        <div class="item span4">
            <div class="row">
                <div class="icon span1">
                    <img src="<c:url value='/resources/new/img/icons/features-retina.png'/>" alt="">
                </div><!-- /.icon -->

                <div class="text span3">
                    <h3><spring:message code="index.icon.rate.title"/></h3>
                    <p><spring:message code="index.icon.rate.desc"/></p>
                </div><!-- /.logo -->
            </div><!-- /.row -->
        </div><!-- /.item -->

        <div class="item span4">
            <div class="row">
                <div class="icon span1">
                    <img src="<c:url value='/resources/new/img/icons/features-custom-widgets.png'/>" alt="">
                </div><!-- /.icon -->

                <div class="text span3">
                    <h3><spring:message code="index.icon.puzzle.title"/></h3>
                    <p><spring:message code="index.icon.puzzle.desc"/></p>
                </div><!-- /.logo -->
            </div><!-- /.row -->
        </div><!-- /.item -->
    </div>
    <div class="row">
        <div class="item span4">
            <div class="row">
                <div class="icon span1">
                    <img src="<c:url value='/resources/new/img/icons/features-bootstrap.png'/>" alt="">
                </div><!-- /.icon -->

                <div class="text span3">
                    <h3><spring:message code="index.icon.config.title"/></h3>
                    <p><spring:message code="index.icon.config.desc"/></p>
                </div><!-- /.logo -->
            </div><!-- /.row -->
        </div><!-- /.item -->

        <div class="item span4">
            <div class="row">
                <div class="icon span1">
                    <img src="<c:url value='/resources/new/img/icons/features-pencil.png'/>" alt="">
                </div><!-- /.icon -->

                <div class="text span3">
                    <h3><spring:message code="index.icon.review.title"/></h3>
                    <p><spring:message code="index.icon.review.desc"/></p>
                </div><!-- /.logo -->
            </div><!-- /.row -->
        </div><!-- /.item -->

        <div class="item span4">
            <div class="row">
                <div class="icon span1">
                    <img src="<c:url value='/resources/new/img/icons/features-responsive.png'/>" alt="">
                </div><!-- /.icon -->

                <div class="text span3">
                    <h3><spring:message code="index.icon.mobile.title"/></h3>
                    <p><spring:message code="index.icon.mobile.desc"/></p>
                </div><!-- /.logo -->
            </div><!-- /.row -->
        </div><!-- /.item -->
    </div><!-- /.row -->
</div><!-- /.features -->
</div>
</div>

<div class="bottom-wrapper">
    <div class="bottom container">
        <div class="bottom-inner row">
            <div class="item span4">
                <div class="address decoration"></div>
                <h2><a><spring:message code="index.icon.list.title"/></a></h2>
                <p><spring:message code="index.icon.list.desc"/></p>
                <!-- <a href="#" class="btn btn-primary">Read more</a> -->
            </div><!-- /.item -->

            <div class="item span4">
                <div class="gps decoration"></div>
                <h2><a><spring:message code="index.icon.gps.title"/></a></h2>
                <p><spring:message code="index.icon.gps.desc"/></p>
                <!-- <a href="#" class="btn btn-primary">Read more</a> -->
            </div><!-- /.item -->

            <div class="item span4">
                <div class="key decoration"></div>
                <h2><a><spring:message code="index.icon.secure.title"/></a></h2>
                <p><spring:message code="index.icon.secure.desc"/></p>
                <!-- <a href="#" class="btn btn-primary">Read more</a> -->
            </div><!-- /.item -->
        </div><!-- /.bottom-inner -->
    </div><!-- /.bottom -->
</div><!-- /.bottom-wrapper -->    </div><!-- /#content -->
</div><!-- /#wrapper-inner -->

<jsp:include page="includes/footer-include.jsp"/>

</div><!-- /#wrapper -->
</div><!-- /#wrapper-outer -->

<jsp:include page="includes/js-include.jsp"/>

</body>
</html>
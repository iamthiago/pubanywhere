<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<html lang="en-US">

<jsp:include page="includes/css-include.jsp"/>

<body onload="initialize()">
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
	            <div class="map-wrapper">
				    <div class="map">
				    
					    <input type="hidden" id="lat" name="lat" value="${param.lat}">
	    				<input type="hidden" id="lng" name="lng" value="${param.lng}">
	    				
				        <div id="map" class="map-inner"></div><!-- /.map-inner -->
				
				        <div class="container">
				            <div class="row">
				                <div class="span3 forceLeft">
				                    <div class="property-filter pull-left noBackground">
				                        <div class="content">
				                        	
				                        </div><!-- /.content -->
				                    </div><!-- /.property-filter -->
				                </div><!-- /.span3 -->
				            </div><!-- /.row -->
				        </div><!-- /.container -->
				    </div><!-- /.map -->
				</div><!-- /.map-wrapper -->
			</div><!-- /#content -->
		</div><!-- /#wrapper-inner -->

<jsp:include page="includes/footer-include.jsp"/>

</div><!-- /#wrapper -->
</div><!-- /#wrapper-outer -->

<jsp:include page="includes/js-include.jsp"/>

</body>
</html>
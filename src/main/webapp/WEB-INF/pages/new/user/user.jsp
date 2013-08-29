<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<html lang="en-US">

<jsp:include page="../includes/css-include.jsp"/>

<body>
<div id="wrapper-outer" >
    <div id="wrapper">
        <div id="wrapper-inner">
            
            <!-- BREADCRUMB -->
            <jsp:include page="../includes/breadcrumb-include.jsp"/>

            <!-- HEADER -->
            <jsp:include page="../includes/header-include.jsp"/>

            <!-- NAVIGATION -->
            <jsp:include page="../includes/navigator-include.jsp"/>

            <!-- CONTENT -->
            <div id="content">
            	<div class="container">
			        <div id="main">
			            <div class="row">
			                <div class="span9">
			                    
								
			                </div>
			
			                <div class="sidebar span3">
			                    <div class="widget our-agents">
				                    <div class="title">
					                    <h2>My Account</h2>
				                    </div>
				                    <div class="content">
				                    	<div class="agent">
				                    		<div class="image userIndexImg">
					                    		<img src="https://graph.facebook.com/${user.facebookUser.facebookProfileId}/picture?type=normal"/>
				                    		</div>
				                    		<div class="name">${user.facebookUser.firstName}</div>
				                    		<div class="phone">12345</div>
				                    		<div class="email">&nbsp;</div><!-- /.email -->
				                    	</div>
				                    </div>
			                    </div>
			                    
			                    <!-- <div class="widget our-agents">
			                    	<div class="title">
			                    		<h2>Manage</h2>
			                    	</div>
			                    	<div class="content">
			                    		<div class="agent">
				                    		<div class="phone items lastReviews">Last Reviews</div>
				                    	</div>
			                    	</div>
			                    </div> -->
			                    
							</div>
			            </div>
			        </div>
   				</div>
    		</div><!-- /#content -->
		</div><!-- /#wrapper-inner -->

<jsp:include page="../includes/footer-include.jsp"/>

</div><!-- /#wrapper -->
</div><!-- /#wrapper-outer -->

<jsp:include page="../includes/js-include.jsp"/>

</body>
</html>
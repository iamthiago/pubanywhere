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
    <div>
        <div id="main">
			<div class="about-us">
			    <h2 class="page-header"><spring:message code="about.title"/></h2>
			</div>
            <hr>

            <div class="row">
                <div class="span6">
                    <h2>Pub Anywhere!</h2>
                    <p><spring:message code="about.pub"/></p>
                    <p><a href="/contact" class="btn btn-primary"><spring:message code="nav.contact"/></a>
                    </p></div>
                <div class="span6">
                    <h2><spring:message code="about.story.title"/></h2>
                    <p><spring:message code="about.story.desc"/></p>
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
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
            <div id="content">    <div class="container">
        <div id="main">
            <div class="row">
                <div class="span9">
                    <h1 class="page-header"><spring:message code="nav.contact"/></h1>
                        <h2><spring:message code="contact.desc"/></h2>

						<form:form action="#" method='POST' id="contactAjaxForm" commandName="contactForm" class="contact-form" acceptCharset="UTF-8" enctype="multipart/form-data">
                            <div class="name control-group">
                                <label class="control-label" for="contact-name">
                                    <spring:message code="form.name"/>
                                    <span class="form-required" title="This field is required.">*</span>
                                </label>
                                <div class="controls">
                                    <form:input path="name" id="contact-name" tabindex="1"/>
                                </div><!-- /.controls -->
                            </div><!-- /.control-group -->

                            <div class="email control-group">
                                <label class="control-label" for="contact-email">
                                    Email
                                    <span class="form-required" title="This field is required.">*</span>
                                </label>
                                <div class="controls">
                                    <form:input path="from" id="contact-email" tabindex="2"/>
                                </div><!-- /.controls -->
                            </div><!-- /.control-group -->

                            <div class="control-group">
                                <label class="control-label" for="contact-description">
                                    <spring:message code="form.message"/>
                                    <span class="form-required" title="This field is required.">*</span>
                                </label>

                                <div class="controls">
                                    <form:textarea path="description" id="contact-description" rows="20" cols="40" tabindex="3" maxlength="500"/>
                                </div><!-- /.controls -->
                            </div><!-- /.control-group -->

                            <div class="form-actions">
                                <input id="sendMail" type="submit" class="btn btn-primary arrow-right" value="<spring:message code="form.send"/>">
                            </div><!-- /.form-actions -->
                        </form:form>
                </div>

                <div class="sidebar span3">
                    
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
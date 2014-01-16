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
            <div class="list-your-property-form">
    <h2 class="page-header"><spring:message code="header.listPlace"/></h2>

    <div class="content">
        <div class="row">
            <div class="span8">
                <p>
                
                </p>
            </div><!-- /.span8 -->
        </div><!-- /.row -->

        <form:form action="#" method='POST' id="pubForm" commandName="pubForm" acceptCharset="UTF-8">
										
			<form:hidden path="lat" id="lat"/>
			<form:hidden path="lng" id="lng"/>
			
            <div class="row">
                <div class="span4">
                    <div class="control-group">
                        <label class="control-label" for="pubs-name">
                            <spring:message code="form.name"/>
                            <span class="form-required" title="This field is required.">*</span>
                        </label>
                        <div class="controls">
                            <form:input path="name" id="pubs-name" tabindex="1" maxlength="30"/>
                        </div><!-- /.controls -->
                    </div><!-- /.control-group -->

                    <div class="control-group">
                        <label class="control-label" for="pubs-website">
                            Website
                        </label>
                        <div class="controls">
                            <form:input path="website" id="pubs-website" tabindex="2" maxlength="100"/>
                        </div><!-- /.controls -->
                    </div><!-- /.control-group -->

                    <div class="control-group">
                        <label class="control-label" for="pubs-email">
                            Email
                        </label>
                        <div class="controls">
                            <form:input path="email" id="pubs-email" tabindex="3" maxlength="100"/>
                        </div><!-- /.controls -->
                    </div><!-- /.control-group -->

                    <div class="control-group">
                        <label class="control-label" for="pubs-phone">
                            <spring:message code="form.phone"/>
                        </label>
                        <div class="controls">
                            <form:input path="phone" id="pubs-phone" tabindex="4" maxlength="100"/>
                        </div><!-- /.controls -->
                    </div><!-- /.control-group -->
                </div><!-- /.span4 -->

                <div class="span4">
                    <div class="control-group">
                        <label class="control-label" for="location_new">
                            <spring:message code="form.location"/>
                            <span class="form-required" title="This field is required.">*</span>
                        </label>
                        <div class="controls">
                            <form:input path="local" id="location_new" tabindex="5"/>
                        </div><!-- /.controls -->
                    </div><!-- /.control-group -->
                    <div class="control-group">
                        <label class="control-label" for="pubs-description">
                            <spring:message code="form.description"/>
                            <span class="form-required" title="This field is required.">*</span>
                        </label>
                        <div class="controls">
                            <form:textarea path="descricao" id="pubs-description" rows="20" cols="40" tabindex="6" maxlength="3000"/>
                        </div><!-- /.controls -->
                    </div><!-- /.control-group -->
				</div><!-- /.span4 -->

                <div class="span4">
                    <%-- <div class="fileupload fileupload-new control-group" data-provides="fileupload">
                        <label class="control-label" for="inputPropertyPrice">
                            <spring:message code="form.image"/>
                        </label>

                        <div class="input-append">
                            <div class="uneditable-input">
                                <i class="icon-file fileupload-exists"></i>
                                <span class="fileupload-preview"></span>
                            </div>
                                                <span class="btn btn-file">
                                                    <span class="fileupload-new">Select file</span>
                                                    <span class="fileupload-exists">Change</span>
                                                    <form:input path="file" id="image" type="file" />
                                                </span>
                            <a href="#" class="btn fileupload-exists" data-dismiss="fileupload">Remove</a>
                        </div><!-- /.input-append -->
                    </div><!-- .fileupload --> --%>
                    <div class="control-group">
                        <label class="control-label" for="pubs-facebook">
                            Facebook
                        </label>
                        <div class="controls">
                            <form:input path="facebook" id="pubs-facebook" tabindex="7" maxlength="100"/>
                        </div><!-- /.controls -->
                    </div><!-- /.control-group -->
                    <div class="control-group">
                        <label class="control-label" for="pubs-twitter">
                            Twitter
                        </label>
                        <div class="controls">
                            <form:input path="twitter" id="pubs-twitter" tabindex="8" maxlength="100"/>
                        </div><!-- /.controls -->
                    </div><!-- /.control-group -->
                    
                    <div class="control-group">
                    	<label class="control-label">
							&nbsp;
                        </label>
                    	<div class="controls forceRight">
                    		<a class="btn btn-primary arrow-right" id="btnInsertPubAjax"><spring:message code="form.save"/></a>
                    	</div>
                    </div>
                </div><!-- /.span4 -->
            </div><!-- /.row -->
        </form:form>
    </div><!-- /.content -->
</div><!-- /.list-your-property-form -->        </div>
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
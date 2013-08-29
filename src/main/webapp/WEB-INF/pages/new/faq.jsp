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
            <div class="faq">
			    <h2 class="page-header">Frequently asked questions</h2>
			    <div class="content">
			        <div class="row">
			            <div class="span6">
			                <h2>Pub Anywhere</h2>
			
			                <div class="accordion" id="faq1">
			                    <div class="accordion-group">
			                        <div class="accordion-heading">
			                            <a class="accordion-toggle" data-toggle="collapse" data-parent="#faq1" href="#collapse1">
			                                <span class="sign"></span>
			                                <spring:message code="faq.place.1.title"/>
			                            </a>
			                        </div>
			
			                        <div id="collapse1" class="accordion-body collapse">
			                            <div class="accordion-inner">
			                                <spring:message code="faq.place.1.desc"/>
			                            </div>
			                        </div>
			                    </div>
			
			                    <div class="accordion-group">
			                        <div class="accordion-heading">
			                            <a class="accordion-toggle" data-toggle="collapse" data-parent="#faq1" href="#collapse2">
			                                <span class="sign"></span>
			                                <spring:message code="faq.place.2.title"/>
			                            </a>
			                        </div>
			
			                        <div id="collapse2" class="accordion-body collapse">
			                            <div class="accordion-inner">
			                                <spring:message code="faq.place.2.desc"/>
			                            </div>
			                        </div>
			                    </div>
			
			                    <div class="accordion-group">
			                        <div class="accordion-heading">
			                            <a class="accordion-toggle" data-toggle="collapse" data-parent="#faq1" href="#collapse3">
			                                <span class="sign"></span>
			                                <spring:message code="faq.place.3.title"/>
			                            </a>
			                        </div>
			
			                        <div id="collapse3" class="accordion-body collapse">
			                            <div class="accordion-inner">
			                                <spring:message code="faq.place.3.desc"/>
			                            </div>
			                        </div>
			                    </div>
			                </div>
			            </div>
			            <div class="span6">
			            	<h2>Facebook</h2>
			            	
			            	<div class="accordion" id="faq2">
			                    <div class="accordion-group">
			                        <div class="accordion-heading">
			                            <a class="accordion-toggle" data-toggle="collapse" data-parent="#faq1" href="#collapse1">
			                                <span class="sign"></span>
			                                <spring:message code="faq.facebook.1.title"/>
			                            </a>
			                        </div>
			
			                        <div id="collapse4" class="accordion-body collapse">
			                            <div class="accordion-inner">
			                                <spring:message code="faq.facebook.1.desc"/>
			                            </div>
			                        </div>
			                    </div>
			                    
			                    <div class="accordion-group">
			                        <div class="accordion-heading">
			                            <a class="accordion-toggle" data-toggle="collapse" data-parent="#faq1" href="#collapse1">
			                                <span class="sign"></span>
			                                <spring:message code="faq.facebook.2.title"/>
			                            </a>
			                        </div>
			
			                        <div id="collapse5" class="accordion-body collapse">
			                            <div class="accordion-inner">
			                                <spring:message code="faq.facebook.2.desc"/>
			                            </div>
			                        </div>
			                    </div>
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
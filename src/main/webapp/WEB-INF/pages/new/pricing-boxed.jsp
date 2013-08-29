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
            <div class="pricing boxed">
    <h2 class="page-header">Boxed pricing</h2>

    <div class="row">
        <div class="span4">
            <div class="column">
                <h2>Basic</h2>
                <div class="content">
                    <h3>Free</h3>
                    <h4>forever</h4>
                    <ul class="unstyled">
                        <li class="important">3 Properties</li>
                        <li>1 Agent</li>
                        <li>500 MB Free space</li>
                        <li class="unimportant">Featured Properties</li>
                    </ul>
                    <a href="#" class="btn btn-primary btn-large">Sign up</a>
                </div><!-- /.content -->
            </div><!-- /.column -->
        </div><!-- /.span4 -->

        <div class="span4">
            <div class="column promoted">
                <h2>Standard</h2>
                <div class="content">
                    <h3>$9,90</h3>
                    <h4>per month</h4>
                    <ul class="unstyled">
                        <li class="important">10 Properties</li>
                        <li>5 Agents</li>
                        <li>1,5 GB Free space</li>
                        <li>Featured Properties</li>
                    </ul>
                    <a href="#" class="btn btn-primary btn-large">Sign up</a>
                </div><!-- /.content -->
            </div><!-- /.column -->
        </div><!-- /.span4 -->

        <div class="span4">
            <div class="column">
                <h2>Premium</h2>
                <div class="content">
                    <h3>$49,99</h3>
                    <h4>per month</h4>
                    <ul class="unstyled">
                        <li class="important">Unlimited Properties</li>
                        <li>Unlimited Agents</li>
                        <li>5 GB Free space</li>
                        <li>Featured Properties</li>
                    </ul>
                    <a href="#" class="btn btn-primary btn-large">Sign up</a>
                </div><!-- /.content -->
            </div><!-- /.column -->
        </div><!-- /.span4 -->
    </div><!-- /.row -->
</div><!-- /.pricing -->        </div>
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
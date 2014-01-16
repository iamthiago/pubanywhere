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
            <div class="our-agents-large">
    <h2 class="page-header">Our agents</h2>

    <div class="content">
        <div class="agent">
            <div class="row">
                <div class="image span2">
                    <img src="<c:url value='/resources/new/img/photos/emma-large.png'/>" alt="Emma">
                </div><!-- /.image -->

                <div class="body span6">
                    <h3>Victoria Summer</h3>
                    <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec auctor diam in quam molestie ullamcorper. Praesent a tellus massa. Nulla laoreet tempus congue. Praesent ut ultrices nunc. Etiam at libero sed turpis tempor placerat in eget lectus. Curabitur pretium, ante vel aliquam lacinia, ipsum felis hendrerit leo, ut aliquet neque odio at nisl.</p>
                </div><!-- /.body -->

                <div class="info span4">
                    <div class="box">
                        <div class="phone">333-666-777 </div>
                        <div class="office">(800) 432-5540 </div>
                        <div class="email">victoria@example.com </div>
                    </div>
                </div><!-- /.info -->
            </div><!-- /.row -->
        </div><!-- /.agent -->

        <div class="agent">
            <div class="row">
                <div class="image span2">
                    <img src="<c:url value='/resources/new/img/photos/emma-large.png'/>" alt="Emma">
                </div><!-- /.image -->

                <div class="body span6">
                    <h3>Victoria Summer</h3>
                    <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec auctor diam in quam molestie ullamcorper. Praesent a tellus massa. Nulla laoreet tempus congue. Praesent ut ultrices nunc. Etiam at libero sed turpis tempor placerat in eget lectus. Curabitur pretium, ante vel aliquam lacinia, ipsum felis hendrerit leo, ut aliquet neque odio at nisl.</p>
                </div><!-- /.body -->

                <div class="info span4">
                    <div class="box">
                        <div class="phone">333-666-777 </div>
                        <div class="office">(800) 432-5540 </div>
                        <div class="email">victoria@example.com </div>
                    </div>
                </div><!-- /.info -->
            </div><!-- /.row -->
        </div><!-- /.agent -->

        <div class="agent">
            <div class="row">
                <div class="image span2">
                    <img src="<c:url value='/resources/new/img/photos/emma-large.png'/>" alt="Emma">
                </div><!-- /.image -->

                <div class="body span6">
                    <h3>Victoria Summer</h3>
                    <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec auctor diam in quam molestie ullamcorper. Praesent a tellus massa. Nulla laoreet tempus congue. Praesent ut ultrices nunc. Etiam at libero sed turpis tempor placerat in eget lectus. Curabitur pretium, ante vel aliquam lacinia, ipsum felis hendrerit leo, ut aliquet neque odio at nisl.</p>
                </div><!-- /.body -->

                <div class="info span4">
                    <div class="box">
                        <div class="phone">333-666-777 </div>
                        <div class="office">(800) 432-5540 </div>
                        <div class="email">victoria@example.com </div>
                    </div>
                </div><!-- /.info -->
            </div><!-- /.row -->
        </div><!-- /.agent -->

        <div class="agent">
            <div class="row">
                <div class="image span2">
                    <img src="<c:url value='/resources/new/img/photos/emma-large.png'/>" alt="Emma">
                </div><!-- /.image -->

                <div class="body span6">
                    <h3>Victoria Summer</h3>
                    <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec auctor diam in quam molestie ullamcorper. Praesent a tellus massa. Nulla laoreet tempus congue. Praesent ut ultrices nunc. Etiam at libero sed turpis tempor placerat in eget lectus. Curabitur pretium, ante vel aliquam lacinia, ipsum felis hendrerit leo, ut aliquet neque odio at nisl.</p>
                </div><!-- /.body -->

                <div class="info span4">
                    <div class="box">
                        <div class="phone">333-666-777 </div>
                        <div class="office">(800) 432-5540 </div>
                        <div class="email">victoria@example.com </div>
                    </div>
                </div><!-- /.info -->
            </div><!-- /.row -->
        </div><!-- /.agent -->
    </div><!-- /.content -->
</div><!-- /.our-agents -->        </div>
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
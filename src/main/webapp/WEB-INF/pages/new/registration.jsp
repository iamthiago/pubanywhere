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
            <h1 class="page-header">Registration</h1>
            <div class="login-register">
    <div class="row">
        <div class="span4">
            <ul class="tabs nav nav-tabs">
                <li><a href="#login">Login</a></li>
                <li class="active"><a href="#register">Register</a></li>
            </ul>
            <!-- /.nav -->

            <div class="tab-content">
                <div class="tab-pane" id="login">
                    <form method="post" action="?">
                        <div class="control-group">
                            <label class="control-label" for="inputLoginLogin">
                                Login
                                <span class="form-required" title="This field is required.">*</span>
                            </label>

                            <div class="controls">
                                <input type="text" id="inputLoginLogin">
                            </div>
                            <!-- /.controls -->
                        </div>
                        <!-- /.control-group -->

                        <div class="control-group">
                            <label class="control-label" for="inputLoginPassword">
                                Password
                                <span class="form-required" title="This field is required.">*</span>
                            </label>

                            <div class="controls">
                                <input type="password" id="inputLoginPassword">
                            </div>
                            <!-- /.controls -->
                        </div>
                        <!-- /.control-group -->

                        <div class="form-actions">
                            <input type="submit" value="Login" class="btn btn-primary arrow-right">
                        </div>
                        <!-- /.form-actions -->
                    </form>
                </div>
                <!-- /.tab-pane -->

                <div class="tab-pane active" id="register">
                    <form method="post" action="?">
                        <div class="control-group">
                            <label class="control-label" for="inputRegisterFirstName">
                                First name
                                <span class="form-required" title="This field is required.">*</span>
                            </label>

                            <div class="controls">
                                <input type="text" id="inputRegisterFirstName">
                            </div>
                            <!-- /.controls -->
                        </div>
                        <!-- /.control-group -->

                        <div class="control-group">
                            <label class="control-label" for="inputRegisterSurname">
                                Surname
                                <span class="form-required" title="This field is required.">*</span>
                            </label>

                            <div class="controls">
                                <input type="text" id="inputRegisterSurname">
                            </div>
                            <!-- /.controls -->
                        </div>
                        <!-- /.control-group -->

                        <div class="control-group">
                            <label class="control-label" for="inputRegisterEmail">
                                E-mail
                                <span class="form-required" title="This field is required.">*</span>
                            </label>

                            <div class="controls">
                                <input type="text" id="inputRegisterEmail">
                            </div>
                            <!-- /.controls -->
                        </div>
                        <!-- /.control-group -->

                        <div class="control-group">
                            <label class="control-label" for="inputRegisterPassword">
                                Password
                                <span class="form-required" title="This field is required.">*</span>
                            </label>

                            <div class="controls">
                                <input type="text" id="inputRegisterPassword">
                            </div>
                            <!-- /.controls -->
                        </div>
                        <!-- /.control-group -->

                        <div class="control-group">
                            <label class="control-label" for="inputRegisterRetype">
                                Retype
                                <span class="form-required" title="This field is required.">*</span>
                            </label>

                            <div class="controls">
                                <input type="text" id="inputRegisterRetype">
                            </div>
                            <!-- /.controls -->
                        </div>
                        <!-- /.control-group -->

                        <div class="form-actions">
                            <input type="submit" value="Register" class="btn btn-primary arrow-right">
                        </div>
                        <!-- /.form-actions -->
                    </form>
                </div>
                <!-- /.tab-pane -->
            </div>
            <!-- /.tab-content -->
        </div>
        <!-- /.span4-->

        <div class="span8">
            <h2 class="page-header">Why to work with us?</h2>

            <div class="images row">
                <div class="item span2">
                    <img src="<c:url value='/resources/new/img/icons/circle-dollar.png'/>" alt="">

                    <h3>Cheap services</h3>
                </div>
                <!-- /.item -->
                <div class="item span2">
                    <img src="<c:url value='/resources/new/img/icons/circle-search.png'/>" alt="">

                    <h3>Easy to find you</h3>
                </div>
                <!-- /.item -->
                <div class="item span2">
                    <img src="<c:url value='/resources/new/img/icons/circle-global.png'/>" alt="">

                    <h3>Act global or local</h3>
                </div>
                <!-- /.item -->
                <div class="item span2">
                    <img src="<c:url value='/resources/new/img/icons/circle-package.png'/>" alt="">

                    <h3>All in one package</h3>
                </div>
                <!-- /.item -->
            </div>
            <!-- /.row -->

            <hr class="dotted">

            <p>
                Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam ullamcorper libero sed ante auctor vel
                gravida nunc placerat. Suspendisse molestie posuere sem, in viverra dolor venenatis sit amet. Aliquam
                gravida nibh quis justo pulvinar luctus. Phasellus a malesuada massa.
            </p>

            <ul class="unstyled dotted">
                <li>
                                        <span class="inner">
                                            <strong>Lorem ipsum dolor sit amet</strong><br>
                                                Consectetur adipiscing elit. Proin aliquam lorem sed urna viverra
                                                accumsan. Aliquam sit amet dui et diam rutrum aliquet. Sed vulputate,
                                                arcu vitae aliquet facilisis, ligula sem posuere nisl, sit amet pretium
                                                ligula dolor
                                        </span>
                </li>

                <li>
                                        <span class="inner">
                                            <strong>Lorem ipsum dolor sit amet</strong><br>
                                                Consectetur adipiscing elit. Proin aliquam lorem sed urna viverra
                                                accumsan. Aliquam sit amet dui et diam rutrum aliquet. Sed vulputate,
                                                arcu vitae aliquet facilisis, ligula sem posuere nisl, sit amet pretium
                                                ligula dolor
                                        </span>
                </li>

                <li>
                                        <span class="inner">
                                            <strong>Lorem ipsum dolor sit amet</strong><br>
                                                Consectetur adipiscing elit. Proin aliquam lorem sed urna viverra
                                                accumsan. Aliquam sit amet dui et diam rutrum aliquet. Sed vulputate,
                                                arcu vitae aliquet facilisis, ligula sem posuere nisl, sit amet pretium
                                                ligula dolor
                                        </span>
                </li>
            </ul>
        </div>
    </div>
    <!-- /.row -->
</div><!-- /.login-register -->        </div>
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
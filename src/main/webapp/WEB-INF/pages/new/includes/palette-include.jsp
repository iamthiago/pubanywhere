<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<div class="palette">
    <div class="toggle">
        <a href="#">Toggle</a>
    </div><!-- /.toggle -->

    <div class="inner">
        <div class="headers">
            <h2>Header styles</h2>
            <ul>
                <li><a class="header-light">Light</a></li>
                <li><a class="header-normal">Normal</a></li>
                <li><a class="header-dark">Dark</a></li>
            </ul>
        </div><!-- /.headers -->

        <div class="patterns">
            <h2>Background patterns</h2>
            <ul>
                <li><a class="pattern-cloth-alike">cloth-alike</a></li>
                <li><a class="pattern-corrugation">corrugation</a></li>
                <li><a class="pattern-diagonal-noise">diagonal-noise</a></li>
                <li><a class="pattern-dust">dust</a></li>
                <li><a class="pattern-fabric-plaid">fabric-plaid</a></li>
                <li><a class="pattern-farmer">farmer</a></li>
                <li><a class="pattern-grid-noise">grid-noise</a></li>
                <li><a class="pattern-lghtmesh">lghtmesh</a></li>
                <li><a class="pattern-pw-maze-white">pw-maze-white</a></li>
                <li><a class="pattern-none">none</a></li>
            </ul>
        </div>

        <div class="colors">
            <h2>Color variants</h2>
            <ul>
                <li><a href="<c:url value='/resources/new/css/realia-red.css'/>" class="red">Red</a></li>
                <li><a href="<c:url value='/resources/new/css/realia-magenta.css'/>" class="magenta">Magenta</a></li>
                <li><a href="<c:url value='/resources/new/css/realia-brown.css'/>" class="brown">Brown</a></li>
                <li><a href="<c:url value='/resources/new/css/realia-orange.css'/>" class="orange">Orange</a></li>
                <li><a href="<c:url value='/resources/new/css/realia-brown-dark.css'/>" class="brown-dark">Brown dark</a></li>

                <li><a href="<c:url value='/resources/new/css/realia-gray-red.css'/>" class="gray-red">Gray Red</a></li>
                <li><a href="<c:url value='/resources/new/css/realia-gray-magenta.css'/>" class="gray-magenta">Gray Magenta</a></li>
                <li><a href="<c:url value='/resources/new/css/realia-gray-brown.css'/>" class="gray-brown">Gray Brown</a></li>
                <li><a href="<c:url value='/resources/new/css/realia-gray-orange.css'/>" class="gray-orange">Gray Orange</a></li>
                <li><a href="<c:url value='/resources/new/css/realia-gray-brown-dark.css'/>" class="gray-brown-dark">Gray Brown dark</a></li>

                <li><a href="<c:url value='/resources/new/css/realia-green-light.css'/>" class="green-light">Green light</a></li>
                <li><a href="<c:url value='/resources/new/css/realia-green.css'/>" class="green">Green</a></li>
                <li><a href="<c:url value='/resources/new/css/realia-turquiose.css'/>" class="turquiose">Turquiose</a></li>
                <li><a href="<c:url value='/resources/new/css/realia-blue.css'/>" class="blue">Blue</a></li>
                <li><a href="<c:url value='/resources/new/css/realia-violet.css'/>" class="violet">Violet</a></li>

                <li><a href="<c:url value='/resources/new/css/realia-gray-green-light.css'/>" class="gray-green-light">Gray Green light</a></li>
                <li><a href="<c:url value='/resources/new/css/realia-gray-green.css'/>" class="gray-green">Gray Green</a></li>
                <li><a href="<c:url value='/resources/new/css/realia-gray-turquiose.css'/>" class="gray-turquiose">Gray Turquiose</a></li>
                <li><a href="<c:url value='/resources/new/css/realia-gray-blue.css'/>" class="gray-blue">Gray Blue</a></li>
                <li><a href="<c:url value='/resources/new/css/realia-gray-violet.css'/>" class="gray-violet">Gray Violet</a></li>
            </ul>
        </div><!-- /.colors -->

        <a href="#" class="btn btn-primary reset">Reset default</a>
    </div><!-- /.inner -->
</div><!-- /.palette -->
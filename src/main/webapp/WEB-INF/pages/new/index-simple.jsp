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
    <div id="main">
        <div class="about-us">
    <h2 class="page-header">About us</h2>

    <div class="row">
        <div class="content">
            <div class="member span4">
                <img src="<c:url value='/resources/new/img/photos/john-doe-original.png'/>" alt="John Doe">
                <h2>John Doe</h2>
                <p>Senior Vice President</p>
            </div><!-- /.member -->

            <div class="member span4">
                <img src="<c:url value='/resources/new/img/photos/emma-hearth-original.png'/>" alt="Emma Hearth">
                <h2>Emma Hearth</h2>
                <p>Co-Founder</p>
            </div><!-- /.member -->

            <div class="member span4">
                <img src="<c:url value='/resources/new/img/photos/angie-blair-original.png'/>" alt="Angie Blair">
                <h2>Angie Blair</h2>
                <p>Public Relations</p>
            </div><!-- /.member -->
        </div><!-- /.content -->
    </div><!-- /.row -->
</div><!-- /.about-us -->        <div class="carousel">
    <h2 class="page-header">All properties</h2>

    <div class="content">
        <a class="carousel-prev" href="detail.html">Previous</a>
        <a class="carousel-next" href="detail.html">Next</a>
        <ul>
            <li>
                <div class="image">
                    <a href="detail.html"></a>
                    <img src="<c:url value='/resources/new/img/tmp/property-small-1.png'/>" alt="">
                </div><!-- /.image -->
                <div class="title">
                    <h3><a href="detail.html">27523 Pacific Coast</a></h3>
                </div><!-- /.title -->
                <div class="location">Palo Alto CA</div><!-- /.location-->
                <div class="price">€2 300 000</div><!-- .price -->
                <div class="area">
                    <span class="key">Area:</span>
                    <span class="value">750m<sup>2</sup></span>
                </div><!-- /.area -->
                <div class="bathrooms"><div class="inner">3</div></div><!-- /.bathrooms -->
                <div class="bedrooms"><div class="inner">3</div></div><!-- /.bedrooms -->
            </li>
            <li>
                <div class="image">
                    <a href="detail.html"></a>
                    <img src="<c:url value='/resources/new/img/tmp/property-small-2.png'/>" alt="">
                </div><!-- /.image -->
                <div class="title">
                    <h3><a href="detail.html">27523 Pacific Coast</a></h3>
                </div><!-- /.title -->
                <div class="location">Palo Alto CA</div><!-- /.location-->
                <div class="price">€2 300 000</div><!-- .price -->
                <div class="area">
                    <span class="key">Area:</span>
                    <span class="value">750m<sup>2</sup></span>
                </div><!-- /.area -->
                <div class="bathrooms"><div class="inner">3</div></div><!-- /.bathrooms -->
                <div class="bedrooms"><div class="inner">3</div></div><!-- /.bedrooms -->
            </li>

            <li>
                <div class="image">
                    <a href="detail.html"></a>
                    <img src="<c:url value='/resources/new/img/tmp/property-small-3.png'/>" alt="">
                </div><!-- /.image -->
                <div class="title">
                    <h3><a href="detail.html">27523 Pacific Coast</a></h3>
                </div><!-- /.title -->
                <div class="location">Palo Alto CA</div><!-- /.location-->
                <div class="price">€2 300 000</div><!-- .price -->
                <div class="area">
                    <span class="key">Area:</span>
                    <span class="value">750m<sup>2</sup></span>
                </div><!-- /.area -->
                <div class="bathrooms"><div class="inner">3</div></div><!-- /.bathrooms -->
                <div class="bedrooms"><div class="inner">3</div></div><!-- /.bedrooms -->
            </li>

            <li>
                <div class="image">
                    <a href="detail.html"></a>
                    <img src="<c:url value='/resources/new/img/tmp/property-small-4.png'/>" alt="">
                </div><!-- /.image -->
                <div class="title">
                    <h3><a href="detail.html">27523 Pacific Coast</a></h3>
                </div><!-- /.title -->
                <div class="location">Palo Alto CA</div><!-- /.location-->
                <div class="price">€2 300 000</div><!-- .price -->
                <div class="area">
                    <span class="key">Area:</span>
                    <span class="value">750m<sup>2</sup></span>
                </div><!-- /.area -->
                <div class="bathrooms"><div class="inner">3</div></div><!-- /.bathrooms -->
                <div class="bedrooms"><div class="inner">3</div></div><!-- /.bedrooms -->
            </li>

            <li>
                <div class="image">
                    <a href="detail.html"></a>
                    <img src="<c:url value='/resources/new/img/tmp/property-small-5.png'/>" alt="">
                </div><!-- /.image -->
                <div class="title">
                    <h3><a href="detail.html">27523 Pacific Coast</a></h3>
                </div><!-- /.title -->
                <div class="location">Palo Alto CA</div><!-- /.location-->
                <div class="price">€2 300 000</div><!-- .price -->
                <div class="area">
                    <span class="key">Area:</span>
                    <span class="value">750m<sup>2</sup></span>
                </div><!-- /.area -->
                <div class="bathrooms"><div class="inner">3</div></div><!-- /.bathrooms -->
                <div class="bedrooms"><div class="inner">3</div></div><!-- /.bedrooms -->
            </li>

            <li>
                <div class="image">
                    <a href="detail.html"></a>
                    <img src="<c:url value='/resources/new/img/tmp/property-small-6.png'/>" alt="">
                </div><!-- /.image -->
                <div class="title">
                    <h3><a href="detail.html">27523 Pacific Coast</a></h3>
                </div><!-- /.title -->
                <div class="location">Palo Alto CA</div><!-- /.location-->
                <div class="price">€2 300 000</div><!-- .price -->
                <div class="area">
                    <span class="key">Area:</span>
                    <span class="value">750m<sup>2</sup></span>
                </div><!-- /.area -->
                <div class="bathrooms"><div class="inner">3</div></div><!-- /.bathrooms -->
                <div class="bedrooms"><div class="inner">3</div></div><!-- /.bedrooms -->
            </li>

            <li>
                <div class="image">
                    <a href="detail.html"></a>
                    <img src="<c:url value='/resources/new/img/tmp/property-small-1.png'/>" alt="">
                </div><!-- /.image -->
                <div class="title">
                    <h3><a href="detail.html">27523 Pacific Coast</a></h3>
                </div><!-- /.title -->
                <div class="location">Palo Alto CA</div><!-- /.location-->
                <div class="price">€2 300 000</div><!-- .price -->
                <div class="area">
                    <span class="key">Area:</span>
                    <span class="value">750m<sup>2</sup></span>
                </div><!-- /.area -->
                <div class="bathrooms"><div class="inner">3</div></div><!-- /.bathrooms -->
                <div class="bedrooms"><div class="inner">3</div></div><!-- /.bedrooms -->
            </li>

            <li>
                <div class="image">
                    <a href="detail.html"></a>
                    <img src="<c:url value='/resources/new/img/tmp/property-small-2.png'/>" alt="">
                </div><!-- /.image -->
                <div class="title">
                    <h3><a href="detail.html">27523 Pacific Coast</a></h3>
                </div><!-- /.title -->
                <div class="location">Palo Alto CA</div><!-- /.location-->
                <div class="price">€2 300 000</div><!-- .price -->
                <div class="area">
                    <span class="key">Area:</span>
                    <span class="value">750m<sup>2</sup></span>
                </div><!-- /.area -->
                <div class="bathrooms"><div class="inner">3</div></div><!-- /.bathrooms -->
                <div class="bedrooms"><div class="inner">3</div></div><!-- /.bedrooms -->
            </li>

            <li>
                <div class="image">
                    <a href="detail.html"></a>
                    <img src="<c:url value='/resources/new/img/tmp/property-small-3.png'/>" alt="">
                </div><!-- /.image -->
                <div class="title">
                    <h3><a href="detail.html">27523 Pacific Coast</a></h3>
                </div><!-- /.title -->
                <div class="location">Palo Alto CA</div><!-- /.location-->
                <div class="price">€2 300 000</div><!-- .price -->
                <div class="area">
                    <span class="key">Area:</span>
                    <span class="value">750m<sup>2</sup></span>
                </div><!-- /.area -->
                <div class="bathrooms"><div class="inner">3</div></div><!-- /.bathrooms -->
                <div class="bedrooms"><div class="inner">3</div></div><!-- /.bedrooms -->
            </li>

            <li>
                <div class="image">
                    <a href="detail.html"></a>
                    <img src="<c:url value='/resources/new/img/tmp/property-small-4.png'/>" alt="">
                </div><!-- /.image -->
                <div class="title">
                    <h3><a href="detail.html">27523 Pacific Coast</a></h3>
                </div><!-- /.title -->
                <div class="location">Palo Alto CA</div><!-- /.location-->
                <div class="price">€2 300 000</div><!-- .price -->
                <div class="area">
                    <span class="key">Area:</span>
                    <span class="value">750m<sup>2</sup></span>
                </div><!-- /.area -->
                <div class="bathrooms"><div class="inner">3</div></div><!-- /.bathrooms -->
                <div class="bedrooms"><div class="inner">3</div></div><!-- /.bedrooms -->
            </li>
        </ul>
    </div><!-- /.content -->
</div><!-- /.carousel -->        <div class="features">
    <h2 class="page-header">Theme features</h2>

    <div class="row">
        <div class="item span4">
            <div class="row">
                <div class="icon span1">
                    <img src="<c:url value='/resources/new/img/icons/features-seo.png'/>" alt="">
                </div><!-- /.icon -->

                <div class="text span3">
                    <h3>SEO Ready</h3>
                    <p>Realia is ready to put your website on higher ranks. Every line of code was developed with SEO principles in mind.</p>
                </div><!-- /.logo -->
            </div><!-- /.row -->
        </div><!-- /.item -->

        <div class="item span4">
            <div class="row">
                <div class="icon span1">
                    <img src="<c:url value='/resources/new/img/icons/features-retina.png'/>" alt="">
                </div><!-- /.icon -->

                <div class="text span3">
                    <h3>Retina Ready</h3>
                    <p>Realia looks great even on Retina and high-resoultion displays. Every graphic element is sharp and clean. No blurry images anymore!</p>
                </div><!-- /.logo -->
            </div><!-- /.row -->
        </div><!-- /.item -->

        <div class="item span4">
            <div class="row">
                <div class="icon span1">
                    <img src="<c:url value='/resources/new/img/icons/features-custom-widgets.png'/>" alt="">
                </div><!-- /.icon -->

                <div class="text span3">
                    <h3>Custom Widgets</h3>
                    <p>Realia provides custom developed widgets to fulfil requirements of good real estate application.</p>
                </div><!-- /.logo -->
            </div><!-- /.row -->
        </div><!-- /.item -->
    </div>
    <div class="row">
        <div class="item span4">
            <div class="row">
                <div class="icon span1">
                    <img src="<c:url value='/resources/new/img/icons/features-bootstrap.png'/>" alt="">
                </div><!-- /.icon -->

                <div class="text span3">
                    <h3>Prepared for Bootstrap</h3>
                    <p>Developer friendly code based on Bootstrap and SASS makes your own customizations really easy.</p>
                </div><!-- /.logo -->
            </div><!-- /.row -->
        </div><!-- /.item -->

        <div class="item span4">
            <div class="row">
                <div class="icon span1">
                    <img src="<c:url value='/resources/new/img/icons/features-pencil.png'/>" alt="">
                </div><!-- /.icon -->

                <div class="text span3">
                    <h3>Frontend Submission</h3>
                    <p>Make the portal solution from your real estate by providing property submission on homepage.</p>
                </div><!-- /.logo -->
            </div><!-- /.row -->
        </div><!-- /.item -->

        <div class="item span4">
            <div class="row">
                <div class="icon span1">
                    <img src="<c:url value='/resources/new/img/icons/features-responsive.png'/>" alt="">
                </div><!-- /.icon -->

                <div class="text span3">
                    <h3>Responsive</h3>
                    <p>Realia is ready to put your website on higher ranks. Every line of code was developed with SEO principles in mind.</p>
                </div><!-- /.logo -->
            </div><!-- /.row -->
        </div><!-- /.item -->
    </div><!-- /.row -->
</div><!-- /.features -->        <div class="partners">
    <h2 class="page-header">Partners</h2>
    <div class="content">
        <div class="partner">
            <a href="http://logopond.com/gallery/detail/192115">
                <img src="<c:url value='/resources/new/img/photos/logo-sokolov.png'/>" alt="Logo">
            </a>
        </div><!-- /.partner -->

        <div class="partner">
            <a href="http://logopond.com/gallery/detail/191954">
                <img src="<c:url value='/resources/new/img/photos/logo-love-letters.png'/>" alt="Logo">
            </a>
        </div><!-- /.partner -->

        <div class="partner">
            <a href="http://logopond.com/gallery/detail/192592">
                <img src="<c:url value='/resources/new/img/photos/logo-royal-markt.png'/>" alt="Logo">
            </a>
        </div><!-- /.partner -->

        <div class="partner">
            <a href="http://logopond.com/gallery/detail/192905">
                <img src="<c:url value='/resources/new/img/photos/logo-shuba.png'/>" alt="Logo">
            </a>
        </div><!-- /.partner -->

        <div class="partner">
            <a href="http://logopond.com/gallery/detail/192394">
                <img src="<c:url value='/resources/new/img/photos/logo-sunsynk.png'/>" alt="Logo">
            </a>
        </div><!-- /.partner -->
    </div><!-- /.content -->
</div><!-- /.partners-->    </div>
</div>
    </div><!-- /#content -->
</div><!-- /#wrapper-inner -->

<jsp:include page="includes/footer-include.jsp"/>

</div><!-- /#wrapper -->
</div><!-- /#wrapper-outer -->

<jsp:include page="includes/js-include.jsp"/>

</body>
</html>
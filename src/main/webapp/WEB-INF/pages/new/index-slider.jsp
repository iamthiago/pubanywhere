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
        <div class="slider-wrapper">
    <div class="slider">
        <div class="slider-inner">
            <div class="row">
                <div class="images span9">
                    <div class='iosSlider'>
                        <div class='slider-content'>
                            <div class="slide">
                                <img src="<c:url value='/resources/new/img/tmp/property-large-1.jpg" alt="">

                                <div class="slider-info">
                                    <div class="price">
                                        <h2>€450 000.00</h2>
                                        <a href="#">More</a>
                                    </div><!-- /.price -->
                                    <h2><a href="#">1041 Fife Ave</a></h2>
                                    <div class="bathrooms">5</div><!-- /.bathrooms -->
                                    <div class="bedrooms">5</div><!-- /.bedrooms -->
                                </div><!-- /.slider-info -->
                            </div><!-- /.slide -->

                            <div class="slide">
                                <img src="<c:url value='/resources/new/img/tmp/property-large-2.jpg" alt="">

                                <div class="slider-info">
                                    <div class="price">
                                        <h2>€450 000.00</h2>
                                        <a href="#">More</a>
                                    </div><!-- /.price -->
                                    <h2><a href="#">1041 Fife Ave</a></h2>
                                    <div class="bathrooms">5</div><!-- /.bathrooms -->
                                    <div class="bedrooms">5</div><!-- /.bedrooms -->
                                </div><!-- /.slider-info -->
                            </div><!-- /.slide -->

                            <div class="slide">
                                <img src="<c:url value='/resources/new/img/tmp/property-large-3.jpg" alt="">

                                <div class="slider-info">
                                    <div class="price">
                                        <h2>€450 000.00</h2>
                                        <a href="#">More</a>
                                    </div><!-- /.price -->
                                    <h2><a href="#">1041 Fife Ave</a></h2>
                                    <div class="bathrooms">5</div><!-- /.bathrooms -->
                                    <div class="bedrooms">5</div><!-- /.bedrooms -->
                                </div><!-- /.slider-info -->
                            </div><!-- /.slide -->
                        </div><!-- /.slider-content -->
                    </div><!-- .iosSlider -->

                    <ul class="navigation">
                        <li class="active"><a>1</a></li>
                        <li><a>2</a></li>
                        <li><a>3</a></li>
                    </ul><!-- /.navigation-->
                </div><!-- /.images -->
                <div class="span3">
                    <div class="property-filter">
                        <div class="content">
                            <form method="get" action="?">
                                <div class="location control-group">
                                    <label class="control-label" for="inputLocation">
                                        Location
                                    </label>
                                    <div class="controls">
                                        <select id="inputLocation">
                                            <option id="malibu">Malibu, CA</option>
                                            <option id="palo-alto">Palo Alto, CA</option>
                                        </select>
                                    </div><!-- /.controls -->
                                </div><!-- /.control-group -->

                                <div class="type control-group">
                                    <label class="control-label" for="inputType">
                                        Type
                                    </label>
                                    <div class="controls">
                                        <select id="inputType">
                                            <option id="apartment">Apartment</option>
                                            <option id="condo">Condo</option>
                                        </select>
                                    </div><!-- /.controls -->
                                </div><!-- /.control-group -->

                                <div class="beds control-group">
                                    <label class="control-label" for="inputBeds">
                                        Beds
                                    </label>
                                    <div class="controls">
                                        <select id="inputBeds">
                                            <option id="1">1</option>
                                            <option id="2">2</option>
                                        </select>
                                    </div><!-- /.controls -->
                                </div><!-- /.control-group -->

                                <div class="baths control-group">
                                    <label class="control-label" for="inputBaths">
                                        Baths
                                    </label>
                                    <div class="controls">
                                        <select id="inputBaths">
                                            <option id="11">1</option>
                                            <option id="22">2</option>
                                        </select>
                                    </div><!-- /.controls -->
                                </div><!-- /.control-group -->


                                <div class="rent control-group">
                                    <div class="controls">
                                        <label class="checkbox" for="inputRent">
                                            <input type="checkbox" id="inputRent"> Rent
                                        </label>
                                    </div><!-- /.controls -->
                                </div><!-- /.control-group -->

                                <div class="sale control-group">
                                    <div class="controls">
                                        <label class="checkbox" for="inputSale">
                                            <input type="checkbox" id="inputSale"> Sale
                                        </label>
                                    </div><!-- /.controls -->
                                </div><!-- /.control-group -->

                                <div class="price-from control-group">
                                    <label class="control-label" for="inputPriceFrom">
                                        Price from
                                    </label>
                                    <div class="controls">
                                        <input type="text" id="inputPriceFrom" name="inputPriceFrom">
                                    </div><!-- /.controls -->
                                </div><!-- /.control-group -->

                                <div class="price-to control-group">
                                    <label class="control-label" for="inputPriceTo">
                                        Price to
                                    </label>
                                    <div class="controls">
                                        <input type="text" id="inputPriceTo" name="inputPriceTo">
                                    </div><!-- /.controls -->
                                </div><!-- /.control-group -->

                                <div class="price-value">
                                    <span class="from"></span><!-- /.from -->
                                    -
                                    <span class="to"></span><!-- /.to -->
                                </div><!-- /.price-value -->

                                <div class="price-slider">
                                </div><!-- /.price-slider -->

                                <div class="form-actions">
                                    <input type="submit" value="Filter now!" class="btn btn-primary btn-large">
                                </div><!-- /.form-actions -->
                            </form>
                        </div><!-- /.content -->
                    </div><!-- /.property-filter -->

                </div><!-- /.span3 -->
            </div><!-- /.row -->
        </div><!-- /.slider-inner -->
    </div><!-- /.slider -->
</div><!-- /.slider-wrapper -->

        <div class="row">
            <div class="span9">
                <h1 class="page-header">Featured properties</h1>
                <div class="properties-grid">
    <div class="row">
        <div class="property span3">
            <div class="image">
                <div class="content">
                    <a href="detail.html"></a>
                    <img src="<c:url value='/resources/new/img/tmp/property-small-1.png'/>" alt="">
                </div><!-- /.content -->

                <div class="price">1 250 000€</div><!-- /.price -->
                <div class="reduced">Reduced </div><!-- /.reduced -->
            </div><!-- /.image -->

            <div class="title">
                <h2><a href="detail.html">27523 Pacific Coast</a></h2>
            </div><!-- /.title -->

            <div class="location">Palo Alto CA</div><!-- /.location -->
            <div class="area">
                <span class="key">Area:</span><!-- /.key -->
                <span class="value">120</span><!-- /.value -->
            </div><!-- /.area -->
            <div class="bedrooms"><div class="content">4</div></div><!-- /.bedrooms -->
            <div class="bathrooms"><div class="content">3</div></div><!-- /.bathrooms -->
        </div><!-- /.property -->

        <div class="property span3">
            <div class="image">
                <div class="content">
                    <a href="detail.html"></a>
                    <img src="<c:url value='/resources/new/img/tmp/property-small-2.png'/>" alt="">
                </div><!-- /.content -->
                <div class="price">1 250 000€</div><!-- /.price -->
                <div class="reduced">Reduced </div><!-- /.reduced -->
            </div><!-- /.image -->

            <div class="title">
                <h2><a href="detail.html">27523 Pacific Coast</a></h2>
            </div><!-- /.title -->

            <div class="location">Palo Alto CA</div><!-- /.location -->
            <div class="area">
                <span class="key">Area:</span><!-- /.key -->
                <span class="value">120</span><!-- /.value -->
            </div><!-- /.area -->
            <div class="bedrooms"><div class="content">4</div></div><!-- /.bedrooms -->
            <div class="bathrooms"><div class="content">3</div></div><!-- /.bathrooms -->
        </div><!-- /.property -->

        <div class="property span3">
            <div class="image">
                <div class="content">
                    <a href="detail.html"></a>
                    <img src="<c:url value='/resources/new/img/tmp/property-small-3.png'/>" alt="">
                </div><!-- /.content -->

                <div class="price">1 250 000€</div><!-- /.price -->
                <div class="reduced">Reduced </div><!-- /.reduced -->
            </div><!-- /.image -->

            <div class="title">
                <h2><a href="detail.html">27523 Pacific Coast</a></h2>
            </div><!-- /.title -->

            <div class="location">Palo Alto CA</div><!-- /.location -->
            <div class="area">
                <span class="key">Area:</span><!-- /.key -->
                <span class="value">120</span><!-- /.value -->
            </div><!-- /.area -->
            <div class="bedrooms"><div class="content">4</div></div><!-- /.bedrooms -->
            <div class="bathrooms"><div class="content">3</div></div><!-- /.bathrooms -->
        </div><!-- /.property -->

        <div class="property span3">
            <div class="image">
                <div class="content">
                    <a href="detail.html"></a>
                    <img src="<c:url value='/resources/new/img/tmp/property-small-4.png'/>" alt="">
                </div><!-- /.content -->
                <div class="price">1 250 000€</div><!-- /.price -->
                <div class="reduced">Reduced </div><!-- /.reduced -->
            </div><!-- /.image -->

            <div class="title">
                <h2><a href="detail.html">27523 Pacific Coast</a></h2>
            </div><!-- /.title -->

            <div class="location">Palo Alto CA</div><!-- /.location -->
            <div class="area">
                <span class="key">Area:</span><!-- /.key -->
                <span class="value">120</span><!-- /.value -->
            </div><!-- /.area -->
            <div class="bedrooms"><div class="content">4</div></div><!-- /.bedrooms -->
            <div class="bathrooms"><div class="content">3</div></div><!-- /.bathrooms -->
        </div><!-- /.property -->

        <div class="property span3">
            <div class="image">
                <div class="content">
                    <a href="detail.html"></a>
                    <img src="<c:url value='/resources/new/img/tmp/property-small-5.png'/>" alt="">
                </div><!-- /.content -->

                <div class="price">1 250 000€</div><!-- /.price -->
                <div class="reduced">Reduced </div><!-- /.reduced -->
            </div><!-- /.image -->

            <div class="title">
                <h2><a href="detail.html">27523 Pacific Coast</a></h2>
            </div><!-- /.title -->

            <div class="location">Palo Alto CA</div><!-- /.location -->
            <div class="area">
                <span class="key">Area:</span><!-- /.key -->
                <span class="value">120</span><!-- /.value -->
            </div><!-- /.area -->
            <div class="bedrooms"><div class="content">4</div></div><!-- /.bedrooms -->
            <div class="bathrooms"><div class="content">3</div></div><!-- /.bathrooms -->
        </div><!-- /.property -->

        <div class="property span3">
            <div class="image">
                <div class="content">
                    <a href="detail.html"></a>
                    <img src="<c:url value='/resources/new/img/tmp/property-small-6.png'/>" alt="">
                </div><!-- /.content -->

                <div class="price">1 250 000€</div><!-- /.price -->
                <div class="reduced">Reduced </div><!-- /.reduced -->
            </div><!-- /.image -->

            <div class="title">
                <h2><a href="detail.html">27523 Pacific Coast</a></h2>
            </div><!-- /.title -->

            <div class="location">Palo Alto CA</div><!-- /.location -->
            <div class="area">
                <span class="key">Area:</span><!-- /.key -->
                <span class="value">120</span><!-- /.value -->
            </div><!-- /.area -->
            <div class="bedrooms"><div class="content">4</div></div><!-- /.bedrooms -->
            <div class="bathrooms"><div class="content">3</div></div><!-- /.bathrooms -->
        </div><!-- /.property -->
    </div><!-- /.row -->
</div><!-- /.properties-grid -->
            </div>
            <div class="sidebar span3">
                <div class="widget our-agents">
    <div class="title">
        <h2>Our Agents</h2>
    </div><!-- /.title -->

    <div class="content">
        <div class="agent">
            <div class="image">
                <img src="<c:url value='/resources/new/img/photos/emma-small.png'/>" alt="">
            </div><!-- /.image -->
            <div class="name">Victoria Summer</div><!-- /.name -->
            <div class="phone">333-666-777</div><!-- /.phone -->
            <div class="email"><a href="mailto:victoria@example.com">victoria@example.com</a></div><!-- /.email -->
        </div><!-- /.agent -->

        <div class="agent">
            <div class="image">
                <img src="<c:url value='/resources/new/img/photos/john-small.png'/>" alt="">
            </div><!-- /.image -->
            <div class="name">John Doe</div><!-- /.name -->
            <div class="phone">111-222-333</div><!-- /.phone -->
            <div class="email"><a href="mailto:john.doe@example.com">victoria@example.com</a></div><!-- /.email -->
        </div><!-- /.agent -->
    </div><!-- /.content -->
</div><!-- /.our-agents -->
                <div class="hidden-tablet">
                    <div class="widget properties last">
    <div class="title">
        <h2>Latest Properties</h2>
    </div><!-- /.title -->

    <div class="content">
        <div class="property">
            <div class="image">
                <a href="detail.html"></a>
                <img src="<c:url value='/resources/new/img/tmp/property-small-4.png'/>" alt="">
            </div><!-- /.image -->

            <div class="wrapper">
                <div class="title">
                    <h3>
                        <a href="detail.html">27523 Pacific Coast</a>
                    </h3>
                </div><!-- /.title -->
                <div class="location">Palo Alto CA</div><!-- /.location -->
                <div class="price">€2 300 000</div><!-- /.price -->
            </div><!-- /.wrapper -->
        </div><!-- /.property -->

        <div class="property">
            <div class="image">
                <a href="detail.html"></a>
                <img src="<c:url value='/resources/new/img/tmp/property-small-5.png'/>" alt="">
            </div><!-- /.image -->

            <div class="wrapper">
                <div class="title">
                    <h3>
                        <a href="detail.html">27523 Pacific Coast</a>
                    </h3>
                </div><!-- /.title -->
                <div class="location">Palo Alto CA</div><!-- /.location -->
                <div class="price">€2 300 000</div><!-- /.price -->
            </div><!-- /.wrapper -->
        </div><!-- /.property -->

        <div class="property">
            <div class="image">
                <a href="detail.html"></a>
                <img src="<c:url value='/resources/new/img/tmp/property-small-6.png'/>" alt="">
            </div><!-- /.image -->

            <div class="wrapper">
                <div class="title">
                    <h3>
                        <a href="detail.html">27523 Pacific Coast</a>
                    </h3>
                </div><!-- /.title -->
                <div class="location">Palo Alto CA</div><!-- /.location -->
                <div class="price">€2 300 000</div><!-- /.price -->
            </div><!-- /.wrapper -->
        </div><!-- /.property -->

        <div class="property">
            <div class="image">
                <a href="detail.html"></a>
                <img src="<c:url value='/resources/new/img/tmp/property-small-2.png'/>" alt="">
            </div><!-- /.image -->

            <div class="wrapper">
                <div class="title">
                    <h3>
                        <a href="detail.html">27523 Pacific Coast</a>
                    </h3>
                </div><!-- /.title -->
                <div class="location">Palo Alto CA</div><!-- /.location -->
                <div class="price">€2 300 000</div><!-- /.price -->
            </div><!-- /.wrapper -->
        </div><!-- /.property -->
    </div><!-- /.content -->
</div><!-- /.properties -->
                </div>
            </div>
        </div>
        <div class="carousel">
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
</div><!-- /.features -->    </div>
</div>

<div class="bottom-wrapper">
    <div class="bottom container">
        <div class="bottom-inner row">
            <div class="item span4">
                <div class="address decoration"></div>
                <h2><a>List your property</a></h2>
                <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla accumsan dui ac nunc imperdiet rhoncus. Aenean vitae imperdiet lectus</p>
                <a href="#" class="btn btn-primary">Read more</a>
            </div><!-- /.item -->

            <div class="item span4">
                <div class="gps decoration"></div>
                <h2><a>Advertise rentals</a></h2>
                <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla accumsan dui ac nunc imperdiet rhoncus. Aenean vitae imperdiet lectus</p>
                <a href="#" class="btn btn-primary">Read more</a>
            </div><!-- /.item -->

            <div class="item span4">
                <div class="key decoration"></div>
                <h2><a>Guidance</a></h2>
                <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla accumsan dui ac nunc imperdiet rhoncus. Aenean vitae imperdiet lectus</p>
                <a href="#" class="btn btn-primary">Read more</a>
            </div><!-- /.item -->
        </div><!-- /.bottom-inner -->
    </div><!-- /.bottom -->
</div><!-- /.bottom-wrapper -->    </div><!-- /#content -->
</div><!-- /#wrapper-inner -->

<jsp:include page="includes/footer-include.jsp"/>

</div><!-- /#wrapper -->
</div><!-- /#wrapper-outer -->

<jsp:include page="includes/js-include.jsp"/>

</body>
</html>
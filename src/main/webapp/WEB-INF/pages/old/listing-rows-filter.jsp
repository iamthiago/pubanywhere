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
        <div class="row">
            <div class="span9">
                <h1 class="page-header">Listing rows with filter</h1>

                <div class="properties-rows">
<div class="filter">
    <form action="?" method="get" class="form-horizontal">
        <div class="control-group">
            <label class="control-label" for="inputSortBy">
                Sort by
                <span class="form-required" title="This field is required.">*</span>
            </label>
            <div class="controls">
                <select id="inputSortBy">
                    <option id="price">Price</option>
                    <option id="published">Published</option>
                </select>
            </div><!-- /.controls -->
        </div><!-- /.control-group -->

        <div class="control-group">
            <label class="control-label" for="inputOrder">
                Order
                <span class="form-required" title="This field is required.">*</span>
            </label>
            <div class="controls">
                <select id="inputOrder">
                    <option id="asc">ASC</option>
                    <option id="desc">DESC</option>
                </select>
            </div><!-- /.controls -->
        </div><!-- /.control-group -->
    </form>
</div><!-- /.filter -->
</div><!-- /.properties-rows -->                <div class="properties-rows">
    <div class="row">
        <div class="property span9">
            <div class="row">
                <div class="image span3">
                    <div class="content">
                        <a href="detail.html"></a>
                        <img src="<c:url value='/resources/new/img/tmp/property-small-1.png'/>" alt="">
                    </div><!-- /.content -->
                </div><!-- /.image -->

                <div class="body span6">
                    <div class="title-price row">
                        <div class="title span4">
                            <h2><a href="detail.html">27523 Pacific Coast</a></h2>
                        </div><!-- /.title -->

                        <div class="price">
                            1 250 000€
                        </div><!-- /.price -->
                    </div><!-- /.title -->

                    <div class="location">Palo Alto CA</div><!-- /.location -->
                    <p>Etiam at ante id enim dictum posuere id vel est. Praesent at massa quis risus cursus tristique vel non orci. Phasellus ut nisi non odio</p>
                    <div class="area">
                        <span class="key">Area:</span><!-- /.key -->
                        <span class="value">120</span><!-- /.value -->
                    </div><!-- /.area -->
                    <div class="bedrooms"><div class="content">4</div></div><!-- /.bedrooms -->
                    <div class="bathrooms"><div class="content">3</div></div><!-- /.bathrooms -->
                </div><!-- /.body -->
            </div><!-- /.property -->
        </div><!-- /.row -->

        <div class="property span9">
            <div class="row">
                <div class="image span3">
                    <div class="content">
                        <a href="detail.html"></a>
                        <img src="<c:url value='/resources/new/img/tmp/property-small-2.png'/>" alt="">
                    </div><!-- /.content -->
                </div><!-- /.image -->

                <div class="body span6">
                    <div class="title-price row">
                        <div class="title span4">
                            <h2><a href="detail.html">27523 Pacific Coast</a></h2>
                        </div><!-- /.title -->

                        <div class="price">
                            1 250 000€
                        </div><!-- /.price -->
                    </div><!-- /.title -->

                    <div class="location">Palo Alto CA</div><!-- /.location -->
                    <p>Etiam at ante id enim dictum posuere id vel est. Praesent at massa quis risus cursus tristique vel non orci. Phasellus ut nisi non odio</p>
                    <div class="area">
                        <span class="key">Area:</span><!-- /.key -->
                        <span class="value">120</span><!-- /.value -->
                    </div><!-- /.area -->
                    <div class="bedrooms"><div class="content">4</div></div><!-- /.bedrooms -->
                    <div class="bathrooms"><div class="content">3</div></div><!-- /.bathrooms -->
                </div><!-- /.body -->
            </div><!-- /.property -->
        </div><!-- /.row -->

        <div class="property span9">
            <div class="row">
                <div class="image span3">
                    <div class="content">
                        <a href="detail.html"></a>
                        <img src="<c:url value='/resources/new/img/tmp/property-small-3.png'/>" alt="">
                    </div><!-- /.content -->
                </div><!-- /.image -->

                <div class="body span6">
                    <div class="title-price row">
                        <div class="title span4">
                            <h2><a href="detail.html">27523 Pacific Coast</a></h2>
                        </div><!-- /.title -->

                        <div class="price">
                            1 250 000€
                        </div><!-- /.price -->
                    </div><!-- /.title -->

                    <div class="location">Palo Alto CA</div><!-- /.location -->
                    <p>Etiam at ante id enim dictum posuere id vel est. Praesent at massa quis risus cursus tristique vel non orci. Phasellus ut nisi non odio</p>
                    <div class="area">
                        <span class="key">Area:</span><!-- /.key -->
                        <span class="value">120</span><!-- /.value -->
                    </div><!-- /.area -->
                    <div class="bedrooms"><div class="content">4</div></div><!-- /.bedrooms -->
                    <div class="bathrooms"><div class="content">3</div></div><!-- /.bathrooms -->
                </div><!-- /.body -->
            </div><!-- /.property -->
        </div><!-- /.row -->


        <div class="property span9">
            <div class="row">
                <div class="image span3">
                    <div class="content">
                        <a href="detail.html"></a>
                        <img src="<c:url value='/resources/new/img/tmp/property-small-4.png'/>" alt="">
                    </div><!-- /.content -->
                </div><!-- /.image -->

                <div class="body span6">
                    <div class="title-price row">
                        <div class="title span4">
                            <h2><a href="detail.html">27523 Pacific Coast</a></h2>
                        </div><!-- /.title -->

                        <div class="price">
                            1 250 000€
                        </div><!-- /.price -->
                    </div><!-- /.title -->

                    <div class="location">Palo Alto CA</div><!-- /.location -->
                    <p>Etiam at ante id enim dictum posuere id vel est. Praesent at massa quis risus cursus tristique vel non orci. Phasellus ut nisi non odio</p>
                    <div class="area">
                        <span class="key">Area:</span><!-- /.key -->
                        <span class="value">120</span><!-- /.value -->
                    </div><!-- /.area -->
                    <div class="bedrooms"><div class="content">4</div></div><!-- /.bedrooms -->
                    <div class="bathrooms"><div class="content">3</div></div><!-- /.bathrooms -->
                </div><!-- /.body -->
            </div><!-- /.property -->
        </div><!-- /.row -->
    </div><!-- /.row -->
</div><!-- /.properties-rows -->
                <div class="pagination pagination-centered">
    <ul>
        <li><a href="#">1</a></li>
        <li><a href="#">2</a></li>
        <li class="active"><a href="#">3</a></li>
        <li><a href="#">4</a></li>
        <li><a href="#">next</a></li>
        <li><a href="#">last</a></li>
    </ul>
</div><!-- /.pagination -->            </div>
            <div class="sidebar span3">
                <h2>Property filter</h2>
<div class="property-filter widget">
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
                        <option id="11">1</option>
                        <option id="22">2</option>
                    </select>
                </div><!-- /.controls -->
            </div><!-- /.control-group -->

            <div class="baths control-group">
                <label class="control-label" for="inputBaths">
                    Baths
                </label>
                <div class="controls">
                    <select id="inputBaths">
                        <option id="1">1</option>
                        <option id="2">2</option>
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
                <div class="ad widget">
    <h2>Advertisements</h2>
    <div class="content">
        <a href="#"><img src="<c:url value='/resources/new/img/banner/1.gif" alt="Banner"></a>
        <a href="#"><img src="<c:url value='/resources/new/img/banner/2.gif" alt="Banner"></a>
        <a href="#"><img src="<c:url value='/resources/new/img/banner/3.gif" alt="Banner"></a>
        <a href="#"><img src="<c:url value='/resources/new/img/banner/4.gif" alt="Banner"></a>
    </div><!-- /.content -->
</div><!-- /.ad -->
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
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
                <h1 class="page-header"><spring:message code="nav.top.covered"/></h1>

                <div class="properties-grid">
					<div class="row">

						<c:forEach items="${countries}" var="c">
							<c:url value='/pubs/country/${c.name}/1' var="countryList"></c:url>

							<div class="property span3">
								<div class="image">
									<div class="content">
										<a href="${countryList}"></a>
										<img src="https://s3.amazonaws.com/pubanywhere/${c.imgName}" class="pubImg270" alt="" />
									</div>
								</div>

								<div class="title">
									<h2>
										<a href="${countryList}"><spring:message code="${c.springCode}"/></a>
									</h2>
								</div>
							</div>
						</c:forEach>
					</div>
				</div><!-- /.properties-grid -->
				
				<!-- bootstrap pagination -->
				<jsp:include page="includes/pagination-include.jsp"/>
				
			</div>

			<div class="sidebar span3">
				<div class="ad widget">
				    <h2>Advertisements</h2>
				    <div class="content">
				        <a href="#"><img src="<c:url value='/resources/new/img/banner/1.gif'/>" alt="Banner"></a>
				        <a href="#"><img src="<c:url value='/resources/new/img/banner/2.gif'/>" alt="Banner"></a>
				        <a href="#"><img src="<c:url value='/resources/new/img/banner/3.gif'/>" alt="Banner"></a>
				        <a href="#"><img src="<c:url value='/resources/new/img/banner/4.gif'/>" alt="Banner"></a>
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

<script type="text/javascript" src="<c:url value='/resources/new/js/pub-list.js'/>"></script>

</body>
</html>
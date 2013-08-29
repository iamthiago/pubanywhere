<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<!-- HEADER -->
            <div id="header-wrapper">
                <div id="header">
                    <div id="header-inner">
                        <div class="container">
                            <div class="navbar">
                                <div class="navbar-inner">
                                    <div class="row">
                                        <div class="logo-wrapper span4">
                                            <div class="logo">
                                                <a href="/" title="Home">
                                                    <img id="imgLogo" src="<c:url value='/resources/imgs/pub-logo-mini.png'/>" alt="Home">
                                                </a>
                                            </div><!-- /.logo -->

                                            <div class="site-name">
                                                <a href="/" title="Home" class="brand">Pub Anywhere</a>
                                            </div><!-- /.site-name -->

                                            <div class="site-slogan">
                                                <span>Find a pub<br>anywhere</span>
                                            </div><!-- /.site-slogan -->
                                        </div><!-- /.logo-wrapper -->

                                        <div class="info">
                                            <div class="site-search">
                                            	<form action="/pubs/maps" method='POST' class="site-search" id="form-search">
													<input type="hidden" id="navlat" name="lat">
									    			<input type="hidden" id="navlng" name="lng">
									    			
													<div id="div-search" class="input-append">
														<input id="input-search" title="Enter the terms you wish to search for." class="search-query span2 form-text" placeholder="<spring:message code="header.search"/>" type="text" name="">
														<button type="submit" class="btn">
															<i class="icon-search"></i>
														</button>
													</div>
												</form>
                                            </div>
                                        </div>
                                        
                                        <c:url value="/pubs/registerPub" var="register"></c:url>
                                        <a class="btn btn-primary btn-large list-your-property arrow-right" href="${register}"><spring:message code="header.listPlace"/></a>
                                        
                                    </div><!-- /.row -->
                                </div><!-- /.navbar-inner -->
                            </div><!-- /.navbar -->
                        </div><!-- /.container -->
                    </div><!-- /#header-inner -->
                </div><!-- /#header -->
            </div><!-- /#header-wrapper -->
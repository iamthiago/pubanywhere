<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<!-- NAVIGATION -->
            <div id="navigation">
                <div class="container">
                    <div class="navigation-wrapper">
                        <div class="navigation clearfix-normal">

                            <ul class="nav">
                                <li class="menuparent">
                                	<span class="menuparent nolink">Pub Anywhere</span>
                                    <ul>
                                        <li><a href="<c:url value='/about'/>"><spring:message code="nav.pub.about"/></a></li>
                                        <%-- <li><a href="<c:url value='/team'/>"><spring:message code="nav.pub.team"/></a></li> --%>
                                    </ul>
                                </li>
                                <li class="menuparent">
                                	<span class="menuparent nolink">Top Pubs</span>
                                	<ul>
                                		<li>
		                                	<a href="<c:url value='/pubs/top100'/>"><spring:message code="nav.top.top100"/></a>
		                                </li>
		                                <li>
		                                	<a href="<c:url value='/country/findAll'/>"><spring:message code="nav.top.covered"/></a>
		                                </li>
                                	</ul>                                	
                                </li>
                                <li>
                                	<a href="<c:url value='/contact'/>"><spring:message code="nav.contact"/></a>
                                </li>
                                <li>
                               		<a href="<c:url value='/faq'/>">FAQ</a>
                                </li>
                            </ul>

                            <div class="language-switcher">
                                <div class="current en"><a href="?lang=en_US" lang="en">English</a></div>
                                <div class="options">
                                    <ul>
                                        <li class="br"><a href="?lang=pt_BR">Português</a></li>
                                    </ul>
                                </div><!-- /.options -->
                            </div><!-- /.language-switcher -->
                        </div><!-- /.navigation -->
                    </div><!-- /.navigation-wrapper -->
                </div><!-- /.container -->
            </div><!-- /.navigation -->
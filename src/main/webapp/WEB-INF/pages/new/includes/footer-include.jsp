<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<div id="footer-wrapper">
    <div id="footer-top">
        <div id="footer-top-inner" class="container">
            <div class="row">
                <div class="widget properties span3">
                    <div class="title">
                        <h2><spring:message code="footer.recents"/></h2>
                    </div><!-- /.title -->

                    <div id="last3" class="content"></div>
                    
                </div><!-- /.properties-small -->

                <div class="widget span3">
                    <div class="title">
                        <h2><spring:message code="footer.contact"/></h2>
                    </div><!-- /.title -->

                    <div class="content">
                        <table class="contact">
                            <tbody>
                            <!-- <tr>
                                <th class="address">Address:</th>
                                <td>1900 Pico Blvd<br>Santa Monica, CA 90405<br>United States<br></td>
                            </tr> -->
                            <!-- <tr>
                                <th class="phone">Phone:</th>
                                <td>+48 123 456 789</td>
                            </tr> -->
                            <tr>
                                <th class="email">E-mail:</th>
                                <td><a href="mailto:pubanywhere@gmail.com">info@pubanywhere.com</a></td>
                            </tr>
                            <!-- <tr>
                                <th class="skype">Skype:</th>
                                <td>your.company</td>
                            </tr>
                            <tr>
                                <th class="gps">GPS:</th>
                                <td>34.016811<br>-118.469009</td>
                            </tr> -->
                            </tbody>
                        </table>
                    </div><!-- /.content -->
                </div><!-- /.widget -->

                <div class="widget span3">
                    <div class="title">
                        <h2 class="block-title"><spring:message code="footer.useful"/></h2>
                    </div><!-- /.title -->

                    <div class="content">
                        <ul class="menu nav">
                            <li class="first leaf"><a href="<c:url value='/about'/>"><spring:message code="nav.pub.about"/></a></li>
                            <%-- <li class="leaf"><a href=""><spring:message code="nav.pub.team"/></a></li> --%>
                            <li class="leaf"><a href="<c:url value='/pubs/top100World'/>"><spring:message code="nav.top.top100"/></a></li>
                            <li class="leaf"><a href="<c:url value='/country/findAll'/>"><spring:message code="nav.top.covered"/></a></li>
                            <li class="leaf"><a href="/contact"><spring:message code="nav.contact"/></a></li>
                            <li class="last leaf"><a href="/faq">FAQ</a></li>
                        </ul>
                    </div><!-- /.content -->
                </div><!-- /.widget -->

                <div class="widget span3">
                    <div class="title">
                        <h2 class="block-title"><spring:message code="footer.like"/></h2>
                    </div><!-- /.title -->

                    <div class="content">
                        <div 
                        	class="fb-like-box" 
                        	data-href="https://www.facebook.com/PubAnywhere" 
                        	data-width="292" 
                        	data-show-faces="true" 
                        	data-header="false" 
                        	data-stream="false" 
                        	data-show-border="true"
                        	colorscheme="dark">
                        </div>
                    </div><!-- /.content -->
                </div><!-- /.widget -->
            </div><!-- /.row -->
        </div><!-- /#footer-top-inner -->
    </div><!-- /#footer-top -->

    <div id="footer" class="footer container">
        <div id="footer-inner">
            <div class="row">
                <div class="span6 copyright">
                    <p>© Copyright 2013 by Pub Anywhere</a>. All rights reserved.</p>
                </div><!-- /.copyright -->

                <div class="span6 share">
                    <div class="content">
                        <ul class="menu nav">
                            <li class="first leaf"><a href="http://www.facebook.com/pubanywhere" class="facebook">Facebook</a></li>
                            <!-- <li class="leaf"><a href="http://flickr.net" class="flickr">Flickr</a></li>
                            <li class="leaf"><a href="http://plus.google.com" class="google">Google+</a></li>
                            <li class="leaf"><a href="http://www.linkedin.com" class="linkedin">LinkedIn</a></li> -->
                            <li class="leaf"><a href="http://www.twitter.com/pubanywhere" class="twitter">Twitter</a></li>
                            <!-- <li class="last leaf"><a href="http://www.vimeo.com" class="vimeo">Vimeo</a></li> -->
                        </ul>
                    </div><!-- /.content -->
                </div><!-- /.span6 -->
            </div><!-- /.row -->
        </div><!-- /#footer-inner -->
    </div><!-- /#footer -->
    
    <div id="resultMessageModal"></div>
	<div id="loading" title="Loading"><img src="<c:url value='/resources/imgs/loading.gif'/>"></div>
	
	<form id="meForm" action="/me" method="POST"></form>

</div><!-- /#footer-wrapper -->
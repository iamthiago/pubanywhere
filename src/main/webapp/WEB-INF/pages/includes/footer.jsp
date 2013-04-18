<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<div id="footer">
	<div>
		<div id="footerLeft">
			<div>
				<h5><spring:message code="help.topics.about"/></h5>
				<ul>
					<li>
						<a href="info#about" class="btnAbout">
							<spring:message code="info.menu.about"/>
						</a>
					</li>
					<li>
						<a href="info#team" class="btnTeam">
							<spring:message code="info.menu.team"/>
						</a>
					</li>
					<li>
						<a href="info#story" class="btnStory">
							<spring:message code="info.menu.story"/>
						</a>
					</li>
				</ul>
			</div>
			<div>
				<h5><spring:message code="info.menu.help"/></h5>
				<ul>
					<li>
						<a href="info#help" class=btnHelp>
							<spring:message code="help.topics.help"/>
						</a>
					</li>
				</ul>
			</div>
			<div>
				<h5>Feedback</h5>
				<ul>
					<li>
						<a href="info#feedback" class="btnFeedback">
							<spring:message code="form.contact.title"/>
						</a>
					</li>
					<li>
						<a href="http://facebook.com/pubanywhere" target="_blank">
							Facebook
						</a>
					</li>
					<li>
						<a href="http://twitter.com/pubanywhere" target="_blank">
							Twitter
						</a>
					</li>
				</ul>
			</div>
		</div>
		<div id="footerRight">
			Copyright © 2013 Pub Anywhere.
			<div>
				<span class="spanCopyright"><spring:message code="footer.findus"/></span>
				<ul id="footerSocial">
					<li class="facebook">
						<a href="http://facebook.com/pubanywhere" target="_blank">
							<span></span>
						</a>
					</li>
					<li class="twitter">
						<a href="http://twitter.com/pubanywhere" target="_blank">
							<span></span>
						</a>
					</li>
				</ul>
			</div>
		</div>
	</div>
	
	<div id="resultMessageModal"></div>
	<div id="loading" title="Loading">
		<img src="<c:url value='/resources/imgs/loading.gif'/>">
	</div>
	
	<script type="text/javascript">

	  var _gaq = _gaq || [];
	  var pluginUrl =
		  '//www.google-analytics.com/plugins/ga/inpage_linkid.js';
		 _gaq.push(['_require', 'inpage_linkid', pluginUrl]);
	  _gaq.push(['_setAccount', 'UA-36976376-1']);
	  _gaq.push(['_trackPageview']);
	
	  (function() {
	    var ga = document.createElement('script'); ga.type = 'text/javascript'; ga.async = true;
	    ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';
	    var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(ga, s);
	  })();
	
	</script>
	
</div>
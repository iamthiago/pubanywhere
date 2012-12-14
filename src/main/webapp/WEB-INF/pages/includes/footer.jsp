<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<div id="footer" class="navigator">
	<div class="div-footer">
		<a href="#"><spring:message code="footer.discover.howitworks"/></a> |
		<a href="http://twitter.com/pubanywhere" target="_blank">Twitter</a> |
		<a href="http://facebook.com/pubanywhere" target="_blank">Facebook</a> |
		<a href="<c:url value="/about"/>"><spring:message code="footer.company.about"/></a>
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
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
		
		<title>${pub.name} - Pub Anywhere</title>
		
		<jsp:include page="default.jsp"/>
		<jsp:include page="social.jsp"/>
		
		<script type="text/javascript" src="<c:url value='/resources/js/google-maps-details-01-04-13.js' />"></script>
		<script type="text/javascript" src="<c:url value='/resources/js/details-01-04-13.js' />"></script>
		<script src="https://maps.googleapis.com/maps/api/js?sensor=false&libraries=places"></script>
		
		<script type="text/javascript" src="<c:url value='/resources/js/jquery/jquery.raty.js' />"></script>
		
		<script language="javascript" src="<c:url value='/resources/js/jquery/jquery.maxlenght.min.js' />"></script>
	    <script type="text/javascript">
		    jQuery(document).ready(function($) {
	             //Set maxlength of all the textarea (call plugin)
	             $().maxlength();
		    })
		</script>

		<meta property="og:title" content="${pub.name} - Pub Anywhere" />
		<meta property="og:url" content="http://www.pubanywhere.com/pubs/${pub.pubId}" />
		<meta property="og:image" content="https://s3.amazonaws.com/pubanywhere/${pub.pubId}" />
		<meta property="og:site_name" content="Pub Anywhere" />
		<meta property="og:description" content="${pub.descricao}" />
</head>
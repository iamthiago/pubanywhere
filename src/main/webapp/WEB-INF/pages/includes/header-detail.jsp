<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
		
		<title>${pub.name} - Pub Anywhere</title>
		
		<jsp:include page="default.jsp"/>
		<jsp:include page="social.jsp"/>
		
		<script type="text/javascript" src="<c:url value='/resources/js/google-maps-details-29-06-13.js' />"></script>
		<script type="text/javascript" src="<c:url value='/resources/js/details-29-06-13.js' />"></script>
		
		<script type="text/javascript" src="<c:url value='/resources/js/jquery/jquery.raty.js' />"></script>

		<meta property="og:title" content="${pub.name} - Pub Anywhere" />
		<meta property="og:url" content="http://www.pubanywhere.com/pubs/${pub.pubId}" />
		<meta property="og:image" content="https://s3.amazonaws.com/pubanywhere/${pub.pubId}" />
		<meta property="og:site_name" content="Pub Anywhere" />
		<meta property="og:description" content="${pub.descricao}" />
</head>
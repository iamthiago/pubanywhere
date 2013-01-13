<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
		
		<jsp:include page="default.jsp"/>
		<script language="javascript" src="<c:url value='/resources/js/jquery.maxlenght.min.js' />"></script>
	    <script type="text/javascript">
		    jQuery(document).ready(function($) {
	             //Set maxlength of all the textarea (call plugin)
	             $().maxlength();
		    })
		</script>
		
		<title>Pub Anywhere - ${pub.name}</title>
	</head>
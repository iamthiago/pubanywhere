<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<jsp:include page="includes/default.jsp"/>

<body>
	
	<jsp:include page="includes/navigator.jsp"/>

	<div id="error-page">
		<div id="error-msg">
			${erro}
		</div>
	</div>
	
	<jsp:include page="includes/footer.jsp"/>
	
</body>
</html>
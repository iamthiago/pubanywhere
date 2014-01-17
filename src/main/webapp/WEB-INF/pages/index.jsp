<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>

<html lang="en-US" ng-app="pubanywhere">

<jsp:include page="includes/css-include.jsp" />

<body>
	<div id="wrapper-outer">
		<div id="wrapper">
			<div id="wrapper-inner">

				<jsp:include page="includes/breadcrumb-include.jsp" />
				<jsp:include page="includes/header-include.jsp" />
				<jsp:include page="includes/navigator-include.jsp" />

				<div id="content">
					<div ng-view></div>
				</div>
			</div>

			<jsp:include page="includes/footer-include.jsp" />

		</div>
	</div>

	<jsp:include page="includes/js-include.jsp" />

</body>
</html>
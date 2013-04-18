<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<jsp:include page="includes/default.jsp"/>

<body>
	<div id="principal" class="frameAll">
		<jsp:include page="includes/navigator.jsp"/>
		<div id="content" class="degrade marginList row">
			<div>
				<div id="topSection">
					<jsp:include page="info/title.jsp" />
				</div>
				<div id="container" class="row">
					<div class="row">
						<div id="detailLeft">
							<div id="innerLeft" class="whiteBorder row min-height">
								<div id="infoMainDiv" class="innerDetails">
									<div id="infoAbout" class="padding10px">
										<jsp:include page="info/about.jsp" />
									</div>
									<div id="infoTeam" class="padding10px">
										<jsp:include page="info/team.jsp" />
									</div>
									<div id="infoStory" class="padding10px">
										<jsp:include page="info/story.jsp" />
									</div>
									<div id="infoHelp" class="padding10px">
										<jsp:include page="info/help.jsp" />
									</div>
									<div id="infoHowItWorks" class="padding10px">
										<jsp:include page="info/howItWorks.jsp" />
									</div>
									<div id="infoContact" class="padding10px">
										<jsp:include page="info/contact.jsp" />
									</div>
								</div>
							</div>
						</div>
						<div id="detailsRight">
							<jsp:include page="info/infoMenu.jsp" />
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	
	<jsp:include page="includes/footer.jsp"/>
	
</body>
</html>
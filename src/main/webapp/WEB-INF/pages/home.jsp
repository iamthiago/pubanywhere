<div class="map-wrapper">
	<div class="map">
		<div class="map-inner back_content"></div>
		<div class="container">
			<div class="row">
				<div class="span3 forceLeft">
					<div class="property-filter pull-left noBackground">
						<div class="content">
							<div class="control-group">
								<h2 style="color: white; font-weight: bold;">
									<spring:message code="index.apps" />
								</h2>
							</div>
							<%-- <div id="apple" class="control-group">
                            	<img src="<c:url value='/resources/new/img/apple.png'/>"/>
                            </div> --%>

							<div id="google" class="control-group">
								<a
									href="https://play.google.com/store/apps/details?id=com.pubanywhere.activity"
									target="_blank"> <img
									src="<c:url value='/resources/new/img/android.png'/>" />
								</a>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<!-- /.map-wrapper -->
<div class="container">
	<div id="main">
		<div class="row">
			<div class="span9">
				<h1 class="page-header">
					<spring:message code="index.pubs" />
				</h1>
				<div class="properties-grid">
					<div class="row">
						<c:forEach items="${topPubs}" var="pub">
							<c:url value="/pubs/${pub.pubId}" var="pubDetails"></c:url>

							<div class="property span3">
								<div class="image padding10px">
									<div class="content">
										<a href="${pubDetails}"></a> <span class="pubThumb"> <%-- <img src="https://s3.amazonaws.com/pubanywhere/${pub.pubId}" class="pubImgTopList"/> --%>
										</span>
									</div>
								</div>
								<div class="title">
									<h2>
										<a href="${pubDetails}">${pub.name}</a>
									</h2>
								</div>
								<div class="location">${pub.country}</div>
								<!-- /.location -->
								<div class="location">
									<div class="star-index star"
										data-number="${pub.pubTotalRating}"></div>
								</div>
							</div>
						</c:forEach>
					</div>
				</div>
			</div>
			<div class="sidebar span3">
				<div class="widget our-agents">
					<div class="title">
						<h2>
							<spring:message code="index.users" />
						</h2>
					</div>

					<div class="content">
						<c:forEach items="${topUser}" var="user">
							<c:url value="/user/" var="userProfile"></c:url>

							<div class="agent">
								<div class="image userIndexImg">
									<img
										src="https://graph.facebook.com/${user.facebookUser.facebookProfileId}/picture?type=normal" />
								</div>
								<div class="name">${user.facebookUser.firstName}</div>
								<div class="phone">
									Rank:&nbsp;
									<div class="phone pull-right">
										<div class="star-topuser star" data-number="${user.rank}"></div>
									</div>
								</div>
								<div class="phone">
									Reviews:&nbsp;
									<div class="phone pull-right">${user.reviews}</div>
								</div>
							</div>
						</c:forEach>
					</div>
				</div>
			</div>
		</div>
		<div class="carousel">
			<h2 class="page-header">
				<spring:message code="index.country" />
			</h2>

			<div class="content">
				<a class="carousel-prev" href="detail.html">Previous</a> <a
					class="carousel-next" href="detail.html">Next</a>
				<ul>
					<li>
						<div class="image">
							<a href="<c:url value='/pubs/country/United States'/>"></a> <img
								src="https://s3.amazonaws.com/pubanywhere/united_states.jpg"
								class="pubImg270" alt="" />
						</div>
						<div class="title">
							<h3>
								<a href="<c:url value='/pubs/country/United States'/>"><spring:message
										code="country.unitedstates" /></a>
							</h3>
						</div>
					</li>
					<li>
						<div class="image">
							<a href="<c:url value='/pubs/country/Ireland'/>"></a> <img
								src="https://s3.amazonaws.com/pubanywhere/ireland.jpg"
								class="pubImg270" alt="" />
						</div>
						<div class="title">
							<h3>
								<a href="<c:url value='/pubs/country/Ireland'/>"><spring:message
										code="country.ireland" /></a>
							</h3>
						</div>
					</li>

					<li>
						<div class="image">
							<a href="<c:url value='/pubs/country/Germany'/>"></a> <img
								src="https://s3.amazonaws.com/pubanywhere/germany.jpg"
								class="pubImg270" alt="" />
						</div>
						<div class="title">
							<h3>
								<a href="<c:url value='/pubs/country/Germany'/>"><spring:message
										code="country.germany" /></a>
							</h3>
						</div>
					</li>

					<li>
						<div class="image">
							<a href="<c:url value='/pubs/country/United Kingdom'/>"></a> <img
								src="https://s3.amazonaws.com/pubanywhere/england.jpg"
								class="pubImg270" alt="" />
						</div>
						<div class="title">
							<h3>
								<a href="<c:url value='/pubs/country/United Kingdom'/>"><spring:message
										code="country.unitedkingdom" /></a>
							</h3>
						</div>
					</li>

					<li>
						<div class="image">
							<a href="<c:url value='/pubs/country/The Netherlands'/>"></a> <img
								src="https://s3.amazonaws.com/pubanywhere/netherlands.jpg"
								class="pubImg270" alt="" />
						</div>
						<div class="title">
							<h3>
								<a href="<c:url value='/pubs/country/The Netherlands'/>"><spring:message
										code="country.thenetherlands" /></a>
							</h3>
						</div>
					</li>

					<li>
						<div class="image">
							<a href="<c:url value='/pubs/country/Czech Republic'/>"></a> <img
								src="https://s3.amazonaws.com/pubanywhere/praga.jpg"
								class="pubImg270" alt="" />
						</div>
						<div class="title">
							<h3>
								<a href="<c:url value='/pubs/country/Czech Republic'/>"><spring:message
										code="country.czechrepublic" /></a>
							</h3>
						</div>
					</li>

					<li>
						<div class="image">
							<a href="<c:url value='/pubs/country/Brazil'/>"></a> <img
								src="https://s3.amazonaws.com/pubanywhere/brazil.jpg"
								class="pubImg270" alt="" />
						</div>
						<div class="title">
							<h3>
								<a href="<c:url value='/pubs/country/Brazil'/>"><spring:message
										code="country.brazil" /></a>
							</h3>
						</div>
					</li>

					<li>
						<div class="image">
							<a href="<c:url value='/pubs/country/Argentina'/>"></a> <img
								src="https://s3.amazonaws.com/pubanywhere/argentina.jpg"
								class="pubImg270" alt="" />
						</div>
						<div class="title">
							<h3>
								<a href="<c:url value='/pubs/country/Argentina'/>"><spring:message
										code="country.argentina" /></a>
							</h3>
						</div>
					</li>
				</ul>
			</div>
		</div>
		<div class="features">
			<h2 class="page-header">
				<spring:message code="website.feature" />
			</h2>

			<div class="row">
				<div class="item span4">
					<div class="row">
						<div class="icon span1">
							<img
								src="<c:url value='/resources/new/img/icons/features-seo.png'/>"
								alt="">
						</div>
						<div class="text span3">
							<h3>
								<spring:message code="index.icon.find.title" />
							</h3>
							<p>
								<spring:message code="index.icon.find.desc" />
							</p>
						</div>
					</div>
				</div>

				<div class="item span4">
					<div class="row">
						<div class="icon span1">
							<img
								src="<c:url value='/resources/new/img/icons/features-retina.png'/>"
								alt="">
						</div>

						<div class="text span3">
							<h3>
								<spring:message code="index.icon.rate.title" />
							</h3>
							<p>
								<spring:message code="index.icon.rate.desc" />
							</p>
						</div>
					</div>
				</div>

				<div class="item span4">
					<div class="row">
						<div class="icon span1">
							<img
								src="<c:url value='/resources/new/img/icons/features-custom-widgets.png'/>"
								alt="">
						</div>

						<div class="text span3">
							<h3>
								<spring:message code="index.icon.puzzle.title" />
							</h3>
							<p>
								<spring:message code="index.icon.puzzle.desc" />
							</p>
						</div>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="item span4">
					<div class="row">
						<div class="icon span1">
							<img
								src="<c:url value='/resources/new/img/icons/features-bootstrap.png'/>"
								alt="">
						</div>

						<div class="text span3">
							<h3>
								<spring:message code="index.icon.config.title" />
							</h3>
							<p>
								<spring:message code="index.icon.config.desc" />
							</p>
						</div>
					</div>
				</div>

				<div class="item span4">
					<div class="row">
						<div class="icon span1">
							<img
								src="<c:url value='/resources/new/img/icons/features-pencil.png'/>"
								alt="">
						</div>

						<div class="text span3">
							<h3>
								<spring:message code="index.icon.review.title" />
							</h3>
							<p>
								<spring:message code="index.icon.review.desc" />
							</p>
						</div>
					</div>
				</div>

				<div class="item span4">
					<div class="row">
						<div class="icon span1">
							<img
								src="<c:url value='/resources/new/img/icons/features-responsive.png'/>"
								alt="">
						</div>

						<div class="text span3">
							<h3>
								<spring:message code="index.icon.mobile.title" />
							</h3>
							<p>
								<spring:message code="index.icon.mobile.desc" />
							</p>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>

<div class="bottom-wrapper">
	<div class="bottom container">
		<div class="bottom-inner row">
			<div class="item span4">
				<div class="address decoration"></div>
				<h2>
					<a><spring:message code="index.icon.list.title" /></a>
				</h2>
				<p>
					<spring:message code="index.icon.list.desc" />
				</p>
			</div>

			<div class="item span4">
				<div class="gps decoration"></div>
				<h2>
					<a><spring:message code="index.icon.gps.title" /></a>
				</h2>
				<p>
					<spring:message code="index.icon.gps.desc" />
				</p>
			</div>

			<div class="item span4">
				<div class="key decoration"></div>
				<h2>
					<a><spring:message code="index.icon.secure.title" /></a>
				</h2>
				<p>
					<spring:message code="index.icon.secure.desc" />
				</p>
			</div>
		</div>
	</div>
</div>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<div>
	<ul>
		<li class="founder floatLeft">
			<div class="image floatLeft">
				<span>
					<img src="https://s3.amazonaws.com/pubanywhere/thiagoandrade6"/>
				</span>
			</div>
			<div class="summary floatRight">
				<div class="name">
					<h3 class="justify">
						<spring:message code="info.thiago.title"/>
					</h3>
				</div>
				<div class="description">
					<h3 class="justify">
						<spring:message code="info.thiago"/>
					</h3>
				</div>
			</div>
		</li>
		
		<li class="founder floatLeft">
			<div class="image floatLeft">
				<span>
					<img src="https://s3.amazonaws.com/pubanywhere/lsrjr89"/>
				</span>
			</div>
			<div class="summary floatRight">
				<div class="name">
					<h3 class="justify">
						<spring:message code="info.lineu.title"/>
					</h3>
				</div>
				<div class="description">
					<h3 class="justify">
						<spring:message code="info.lineu"/>
					</h3>
				</div>
			</div>
		</li>
	</ul>
</div>
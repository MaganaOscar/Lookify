<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%> 
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Add New Song</title>
		<link rel="stylesheet" type="text/css" href="css/style.css">
	</head>
	<body>
		<div>
			<p><a href="/dashboard">Dashboard</a></p>
		</div>
		<div>
			<form:form action="/songs/new" method="post" modelAttribute="song">
				<div>
					<form:label path="title">Title</form:label>
					<form:errors path="title"/>
					<form:input path="title"/>
				</div>
				<div>
					<form:label path="artist">Artist</form:label>
					<form:errors path="artist"/>
					<form:input path="artist"/>
				</div>
				<div>
					<form:label path="rating">Rating(1-10)</form:label>
					<form:errors path="rating"/>
					<form:input path="rating"/>
				</div>
				<input type="submit" value="Add Song">
			</form:form>
		</div>
		<script type="text/javascript" src="js/app.js"></script>
	</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%> 
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Top 10 Songs</title>
		<link rel="stylesheet" type="text/css" href="css/style.css">
	</head>
	<body>
		<div>
			<p>Top Ten Songs</p>
			<p><a href="/dashboard">Dashboard</a></p>
		</div>
		<div>
			<c:forEach items="${songs}" var="song">
				<div>
					<p><c:out value="${song.rating}"/> | <a href="/songs/${song.id}"><c:out value="${song.title}"/></a>
					| <c:out value="${song.artist}"/>
					</p>
				</div>
			</c:forEach>
		</div>
		<script type="text/javascript" src="js/app.js"></script>
	</body>
</html>
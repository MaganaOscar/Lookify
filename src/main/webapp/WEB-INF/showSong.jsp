<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%> 
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Song Info</title>
		<link rel="stylesheet" type="text/css" href="css/style.css">
	</head>
	<body>
		<div>
			<p><a href="/dashboard">Dashboard</a></p>
		</div>
		<div>
			<table>
				<tr>
					<td>Title:</td>
					<td><c:out value="${song.title}"/></td>
				</tr>
				<tr>
					<td>Artist:</td>
					<td><c:out value="${song.artist}"/></td>
				</tr>
				<tr>
					<td>Rating(1-10):</td>
					<td><c:out value="${song.rating}"/></td>
				</tr>
				<tr>
					<td>
						<form action="/songs/${song.id}" method="post">
 	           					<input type="hidden" name="_method" value="delete">
 	           					<input type="submit" value="delete">
 	           			</form>
					</td>
				</tr>
			</table>
		</div>
		<script type="text/javascript" src="js/app.js"></script>
	</body>
</html>
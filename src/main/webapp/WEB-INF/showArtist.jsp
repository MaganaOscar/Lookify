<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%> 
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Songs by Artist</title>
		<link rel="stylesheet" type="text/css" href="css/style.css">
	</head>
	<body>
		<div>
			<p>Songs by artist: <c:out value="${artist}"/></p>
			<form action="/search/" method="post">
				<input type="text" name="artist" value="${artist}">
				<input type="submit" value="New Search">
			</form>
			<p><a href="/dashboard">Dashboard</a></p>
		</div>
		<div>
			<table>
    		<thead>
        		<tr>
            		<th>Name</th>
            		<th>Rating</th>
            		<th>Actions</th>
        		</tr>
    		</thead>
    		<tbody>
    		<c:forEach items="${songs}" var="song">
	        		<tr>
    	        		<td><a href="/songs/${song.id}"><c:out value="${song.title}"/></a></td>
        	    		<td><c:out value="${song.rating}"/></td>
 	           			<td>
 	           				<form action="/songs/${song.id}" method="post">
 	           					<input type="hidden" name="_method" value="delete">
 	           					<input type="submit" value="delete">
 	           				</form>
 	           			</td>
  	      			</tr>
        		</c:forEach>
    		</tbody>
		</table>
		</div>
		<script type="text/javascript" src="js/app.js"></script>
	</body>
</html>
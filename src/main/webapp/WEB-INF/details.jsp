<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- c:out ; c:forEach etc. -->
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!-- Formatting (dates) -->
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!-- form:form -->
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!-- for rendering errors on PUT routes -->
<%@ page isErrorPage="true"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">
</head>
<body>
	<div class="container userdetails mt-5">
		<div class="">
			<a href="/home">Back to the shelves</a>
		
		<div class="details">
	
		<h1>Title:${bookObj.title} by ${bookObj.author }</h1>
		<h3>Posted by: ${bookObj.user.userName}</h3>
		<h3>Summary:</h3>
		<p>${bookObj.thoughts}</p>
		<!-- <a href="/delete/${bookObj.id }">Delete</a>	 -->
		<c:choose>
			<c:when test="${bookObj.user.id == user_id}">
				<a href="/book/${bookObj.id}/edit">Edit</a>
			</c:when>
		</c:choose>
		
		<!-- another way to delete -->
	<%-- 	<form action="/books/${book.id}" method="post">
		<input type="hidden" name="_method" value="delete">
		<input type="submit" value="Delete">
		<h1>hello</h1>

	</form> --%>
		</div>
		</div>
	</div>

</body>
</html>
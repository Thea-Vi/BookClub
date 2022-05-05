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
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
</head>
<body>

<div class="container userdetails mt-5">
	<h3>Here are the books you uploaded:</h3>
	<table class="table table-dark">
		<thead>
			<tr>
				<th scope="col">Book Titles</th>
				<th scope="col">Authors</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="book" items="${user.books }">
				<tr>
					<td>${book.title }</td>	
					<td>${book.author}</td>		
				</tr>
			</c:forEach>
	</table>
	<!-- <ul class="list-group">
		<c:forEach var="book" items="${user.books }">
				<li class="list-group-item">
					${book.title }		
				</li>
		</c:forEach>
	</ul> -->
</div>
<div><a href="/home">Go home</a></div>
	


</body>
</html>
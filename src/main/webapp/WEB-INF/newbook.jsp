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
<script src="https://code.jquery.com/jquery-3.5.1.min.js" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>

<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>

<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-bs4.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-bs4.min.js"></script>
</head>
<body>
	<div class="container userdetails mt-5">
		<h1 class="addbook">Add a Book to Your Shelf!</h1>
	<div>
		<a href="/home">back to the shelves</a>
	</div>
	<div class="newbook">
		<div>
			<form:form action="/books/create" method="post" modelAttribute="book">

				<div class="md-form form-group w-50">
					<form:label path="title" class="form-control col-xs-3">Title:</form:label>
					<form:errors path="title" class="text-danger" />
					<form:input path="title" class="col-xs-3" />
				</div>

				<div class="md-form form-group w-50">
					<form:label path="author" class="form-control">Author:</form:label>
					<form:errors path="author" class="text-danger" />
					<form:input path="author" />
				</div>
				
					<div class="md-form form-group w-50">
					<form:label path="thoughts" class="form-control">Summary:</form:label>
					<form:errors path="thoughts" class="text-danger" />
					<form:textarea path="thoughts" id="summernote"/>
				</div>
				
				
				<button class="btn btn-success">Submit</button>
			</form:form>
		</div>
	</div>

	</div>
	
	<script>
		$('#summernote').summernote({
		  placeholder: '',
		  tabsize: 2,
		  height: 100
		});
	  </script>

</body>
</html>
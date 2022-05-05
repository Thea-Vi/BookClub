<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="/styles.css" />
<title>Insert title here</title>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">
</head>
<body>
	<div class="container">
    <h1 class="user">Welcome ${loggedInUser.userName}!</h1>
    <div>
      <a class="btn btn-success" href="/">Logout</a>
    </div>
    <div>
      <img class="headerimg" src="https://media-exp1.licdn.com/dms/image/C561BAQF2iDYc9NBC3Q/company-background_10000/0/1605132319078?e=2147483647&v=beta&t=Vc9dflqQamJCAJXmpoS8vDKLSfv-TWm_Kgu_0M_I_Pg" alt="">
    </div>
		<h3>Books from everyone's shelves:</h3>
	</div>
	<div>
	<div>
    <h3>
      <a href="/books/new">Add a book to my shelf</a>
    </h3>
  </div>

	<table class="table table-dark">
  <thead>
    <tr>
      <!-- <th scope="col">ID</th> -->
      <th scope="col">Title</th>   
      <th scope="col">Author Name</th>
      <th scope="col">Posted By</th>
      <th scope="col">Actions</th>
    </tr>
  </thead>
  <tbody>
  <c:forEach var="book" items="${allBooks }">
    <tr>

      <!-- <td>${book.id }</td> -->
      <!-- make TITLE CLICKABLE!!! -->
      <td><a href="/book/info/${book.id}">${book.title}</a></td>
      
      <td>${book.author}</td>
      
      <!-- MAKE THE USER CLICKABLE DIRECT TO ONEUSER --BOOKS -->
      <td><a href="/users/${book.user.id}">${ book.user.userName}</a></td>
      <!-- IF THE PROJECT BELONGS TO THE USER, THEN SHOW EDIT AND DELETE -->
      <c:choose>
        <c:when test="${ book.user.id == user_id}">
          <td><a href="/book/${book.id}/edit">Edit</a> || <a href="/delete/${book.id }">Delete</a></td>
        </c:when>
        <c:otherwise>
        <!-- IF NOT, SHOW NOTHING   -->
        <td></td>
        <td></td>
        </c:otherwise>

      </c:choose>    
      <!-- EDIT -->
      <!-- <td><a href="/book/${book.id}/edit">Edit</a> || <a href="/delete/${book.id }">Delete</a>
    </tr> -->
  </c:forEach>
  

  </tbody>
</table>
	</div>
</body>
</html>
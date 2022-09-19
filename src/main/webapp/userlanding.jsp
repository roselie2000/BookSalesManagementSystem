<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta content="text/html; charset=utf-8" />
<title>user landing page</title>

<link rel="stylesheet" href="styles/user.css">
<link rel="stylesheet" href="styles/footer.css">
<script src='https://kit.fontawesome.com/a076d05399.js'></script>
</head>
<body>
	<jsp:include page="userheader.jsp"></jsp:include>
	<jsp:include page="usernavbar.jsp"></jsp:include>
	<main>
		<jsp:include page="slidebars.jsp"></jsp:include>

		<div class="topic">
			<h1><em>Top Most Searched Books</em></h1>
		</div>
		
		<div class="books-container">
			<c:forEach var="book" items="${topBooks}" varStatus="loop">
				<c:if test = "${loop.index < 4}">
				<jsp:include page="bookdiv.jsp">
					<jsp:param value="${book.imagesPath }" name="bookImage"/>
					<jsp:param value="${book.bookName }" name="bookName"/>
					<jsp:param value="${book.actualPrice }" name="actualPrice"/>
					<jsp:param value="${book.rate }" name="rate"/>
					<jsp:param value="${book.bookId }" name="bookId"/>
					<jsp:param value="${book.category }" name="category"/>
				</jsp:include>
				</c:if>
			</c:forEach>
		</div>
		
		<div class="topic">
			<h1><em>New Arrivals</em></h1>
		</div>
		
		<div class="books-container">
			<c:forEach var="book" items="${books}" varStatus="loop">
			<c:if test = "${loop.index < 4}">
				<jsp:include page="bookdiv.jsp">
					<jsp:param value="${book.imagesPath }" name="bookImage"/>
					<jsp:param value="${book.bookName }" name="bookName"/>
					<jsp:param value="${book.actualPrice }" name="actualPrice"/>
					<jsp:param value="${book.rate }" name="rate"/>
					<jsp:param value="${book.bookId }" name="bookId"/>
					<jsp:param value="${book.category }" name="category"/>
				</jsp:include>	
			</c:if>
			</c:forEach>
		</div>
		
		<a href="getAllBooks" class="view">View all</a>
	</main>
<jsp:include page="footer.jsp"></jsp:include>

<script src="script/userpage.js"></script>
<script type="text/javascript" src="script/profilemenu.js"></script>
</body>
</html>
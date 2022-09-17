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
	<nav id="nav">
		<div class="catgry">
			<ul>
			<li><a href="home.jsp">Home</a></li>
				<li><a href="getBookByCategory?category=Biography">Biography</a></li>
				<li><a href="getBookByCategory?category=Education">Education</a></li>
				<li><a href="getBookByCategory?category=Novel">Novels</a></li>
				<li><a href="getBookByCategory?category=Poetry">Poetry</a></li>
				<li><a href="getBookByCategory?category=History">History</a></li>
				<li><a href="getAllBooks">All</a></li>
				<li class="button" onclick="showFilters()"><a href="#">Filters <em class="fa fa-caret-down"></em></a></li>
			</ul>
		</div>
	</nav>
 
 	<div class="filters" id="filters">
 		<button class="dropdown-btn">Price <em class="fa fa-caret-down"></em></button>
 		<div class="dropdown-container">
    		<a href="getBookByPrice?from=${0 }&to=${200}">Under Rs.200</a>
    		<a href="getBookByPrice?from=${201 }&to=${500}">Rs.201 - Rs.500</a>
    		<a href="getBookByPrice?from=${501 }&to=${800}">Rs.501 - Rs.800</a>
    		<a href="getBookByPrice?from=${801 }&to=${1000}">Rs.801 - Rs.1000</a>
    		<a href="getBookByPrice?from=${1000 }&to=${10000}">Over Rs.1000</a>
  		</div>
 		<button class="dropdown-btn">Language <em class="fa fa-caret-down"></em></button>
 		<div class="dropdown-container">
    		<a href="language?lang=English">English</a>
    		<a href="language?lang=Tamil">Tamil</a>
    		<a href="language?lang=Hindi">Hindi</a>
    		<a href="language?lang=Telugu">Telugu</a>
    		<a href="language?lang=Malayalam">Malayalam</a>
    		<a href="language?lang=Kanadam">Kanadam</a>
  		</div>
 	</div>
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
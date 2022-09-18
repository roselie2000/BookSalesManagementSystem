<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta content="text/html; charset=utf-8" />
<title>Administrator page</title>
<link rel="stylesheet" href="styles/navbar.css">
<link rel="stylesheet" href="styles/admin_landing.css">
<link rel="stylesheet" href="styles/dropdown.css">
</head>
<body>
	<header>
		<ul>
			<li class="left"><img alt="logo" src="images/Mars.png" height="95px"
				width="150px"></li>
			<li class="profile"><img alt="profile" src="images/profile.png" width="70px" height="70px"></li>
			<li class="admin">Administrator</li>
		</ul>
	</header>
	
	<nav id = "nav">
		<div class="menu">
			<ul>
				<li><a href="home.jsp">Home</a></li>
				<li class="dropdown"><a href="Books" class="dropbtn">Books</a>
					<div class="dropdown-content">
    					<a href=getBookByCategoryAdmin?category=Novel>Novels</a>
    					<a href="getBookByCategoryAdmin?category=Poetry">Poetry</a>
    					<a href="getBookByCategoryAdmin?category=History">History</a>
    					<a href="getBookByCategoryAdmin?category=Education">Education</a>
    					<a href="getBookByCategoryAdmin?category=Biography">Biography</a>
    					<a href="Books">All Books</a>
  					</div>
				</li>
				<li><a href="Orders">Orders</a></li>
				<li><a href="Users">Users</a></li>
				<li><a href="addbooks.jsp">Add Books</a></li>
			</ul>
		</div>
	</nav>
	<main>
		<c:if test="${not empty lowQtyBooks}">
		<div><h1>Low Quantity Books</h1></div>
		<div class="books-container">
			<c:forEach var="book" items="${lowQtyBooks}" varStatus="loop">
					<jsp:include page="adminbookdiv.jsp">
					<jsp:param value="${book.imagesPath }" name="bookImage"/>
					<jsp:param value="${book.bookName }" name="bookName"/>
					<jsp:param value="${book.actualPrice }" name="actualPrice"/>
					<jsp:param value="${book.rate }" name="rate"/>
					<jsp:param value="${book.bookId }" name="bookId"/>
					<jsp:param value="${book.category }" name="category"/>
				</jsp:include>
			</c:forEach>
		</div>
	</c:if>
	
	<div><h1>Top Searched Books</h1></div>
		<div class="books-container">
			<c:forEach var="book" items="${topBooks}" varStatus="loop">
					<jsp:include page="adminbookdiv.jsp">
					<jsp:param value="${book.imagesPath }" name="bookImage"/>
					<jsp:param value="${book.bookName }" name="bookName"/>
					<jsp:param value="${book.actualPrice }" name="actualPrice"/>
					<jsp:param value="${book.rate }" name="rate"/>
					<jsp:param value="${book.bookId }" name="bookId"/>
					<jsp:param value="${book.category }" name="category"/>
				</jsp:include>
			</c:forEach>
		</div>
		
		<div><h1>Top Buyers</h1></div>
		<div class="user-container">
			<c:forEach var="user" items="${topUsers}" varStatus="loop">
				
					<div class="user-info">
							<div class="avatar">
								<img alt="avatar image" src="images/profile.png" width="100%" height="270px">
							</div>
							<div class="info">
								<div><span>User name :</span>${user.userName }</div>
								<div><span>Name :</span>${user.name }</div>
								<div><span>Email ID :</span>${user.emailId }</div>
								<div><span>Phone no :</span>${user.phoneno }</div>
							</div>
							<div><a href="getUserDetailsById?username=${user.userName }">See</a></div>
					</div>
					
			</c:forEach>
		</div>
		
	</main>
	<script type="text/javascript">
	window.onscroll = function() {myFunction()};
	let navbar = document.getElementById("nav");
	let sticky = navbar.offsetTop;
	function myFunction() {
	  if (window.pageYOffset >= sticky) {
	    navbar.classList.add("sticky")
	  } else {
	    navbar.classList.remove("sticky");
	  }
	}
	</script>
</body>
</html>
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
	<header>
		<ul>
			<li class="left"><img alt="logo" src="images/Mars.png" height="95px"
				width="150px"></li>
			<li>
				<form class="search" action="/searchBooks">
					<input type="search"
						placeholder="Search your favourite books" name="keyword">
					<button type="submit"><em class="fa fa-search"></em></button>
				</form>
			</li>
			<li class="profile"><img alt="profile" src="images/profile.png" width="70px" height="70px" onclick="showOption()"></li>
			<li class="profile"><a href="carts"><img alt="cart" src="images/cart.png" width="60px" height="60px"></a></li>
		</ul>
	</header>

	<div id="option">
		<a href="getProfile">Profile</a>
		<a href="getOrderHistory">My History</a>
		<a href="Logout">Logout</a>
	</div>
	<nav id="nav">
		<div class="catgry">
			<ul>
			<li><a href="home.jsp">Home</a></li>
				<li><a href="getBookByCategory?category=Biography">Biography</a></li>
				<li><a href="getBookByCategory?category=Education">Education</a></li>
				<li><a href="getBookByCategory?category=Novels">Novels</a></li>
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
		<div class="slide-container">
			<div class="slides">
				<div class="text">
					Mars Book Center<br>A massive collection of books with
					affordable price in<br>various categories<br> <span>Buy!
						and Enjoy!</span>
				</div>
				<img alt="slide 1" src="images/bok.jpg" height="250px" width="100%">

			</div>

			<div class="slides">
				<div class="text">
					Only Cash on Delivery <br>is Available!
				</div>
				<img alt="cash on delivery" src="images/cashondevlry.jpg"
					width="100%" height="250px" style="float: right;">
			</div>

			<div class="slides">
				<div class="text">
					Free Shipping Available<br> in Nationwide!
				</div>
				<img alt="discount" src="images/delivery.jpg" width="100%"
					height="250px">

			</div>
		</div>

		<div class="topic">
			<h1><em>Top Most Searched Books</em></h1>
		</div>
		
		<div class="books-container">
			<c:forEach var="book" items="${topBooks}" varStatus="loop">
				<c:if test = "${loop.index < 4}">
					<div class="book-info">
							<div class="img">
								<img alt="${book.bookName }" src="data:image/jpg;base64,${book.imagesPath}" width="100%" height="270px">
								<h3>${book.bookName }</h3>
							</div>
							<div class="details">
								<h4>Rs.${book.actualPrice }</h4>
								<c:choose>
								<c:when test="${book.rate == 1 }">
									<div><span class="fa fa-star checked"></span></div>
								</c:when>
								<c:when test="${book.rate == 2 }">
									<div>
										<span class="fa fa-star checked"></span>
										<span class="fa fa-star checked"></span>
									</div>
								</c:when>
								<c:when test="${book.rate == 3 }">
									<div>
										<span class="fa fa-star checked"></span>
										<span class="fa fa-star checked"></span>
										<span class="fa fa-star checked"></span>
									</div>
								</c:when>
								<c:when test="${book.rate == 4 }">
									<div>
										<span class="fa fa-star checked"></span>
										<span class="fa fa-star checked"></span>
										<span class="fa fa-star checked"></span>
										<span class="fa fa-star checked"></span>
									</div>
								</c:when>
								<c:when test="${book.rate == 5 }">
									<div>
										<span class="fa fa-star checked"></span>
										<span class="fa fa-star checked"></span>
										<span class="fa fa-star checked"></span>
										<span class="fa fa-star checked"></span>
										<span class="fa fa-star checked"></span>
									</div>
								</c:when>
								
							</c:choose>
							</div>
							<div class="view-btn">
								<a href="/getBooks?id=${book.bookId }&cat=${book.category}"><button>View</button></a>
							</div>
						</div>
				</c:if>
			</c:forEach>
		</div>
		
		<div class="topic">
			<h1><em>New Arrivals</em></h1>
		</div>
		
		<div class="books-container">
			<c:forEach var="book" items="${books}" varStatus="loop">
			<c:if test = "${loop.index < 4}">
				<div class="book-info">
						<div class="img">
							<img alt="${book.bookName }" src="data:image/jpg;base64,${book.imagesPath}" width="100%" height="270px">
							<h3>${book.bookName }</h3>
						</div>
						<div class="details">
								<h4>Rs.${book.actualPrice }</h4>
								<c:choose>
								<c:when test="${book.rate == 1 }">
									<div><span class="fa fa-star checked"></span></div>
								</c:when>
								<c:when test="${book.rate == 2 }">
									<div>
										<span class="fa fa-star checked"></span>
										<span class="fa fa-star checked"></span>
									</div>
								</c:when>
								<c:when test="${book.rate == 3 }">
									<div>
										<span class="fa fa-star checked"></span>
										<span class="fa fa-star checked"></span>
										<span class="fa fa-star checked"></span>
									</div>
								</c:when>
								<c:when test="${book.rate == 4 }">
									<div>
										<span class="fa fa-star checked"></span>
										<span class="fa fa-star checked"></span>
										<span class="fa fa-star checked"></span>
										<span class="fa fa-star checked"></span>
									</div>
								</c:when>
								<c:when test="${book.rate == 5 }">
									<div>
										<span class="fa fa-star checked"></span>
										<span class="fa fa-star checked"></span>
										<span class="fa fa-star checked"></span>
										<span class="fa fa-star checked"></span>
										<span class="fa fa-star checked"></span>
									</div>
								</c:when>
								
							</c:choose>
							</div>
						<div class="view-btn">
							<a href="/getBooks?id=${book.bookId }&cat=${book.category}"><button>View</button></a>
						</div>
					</div>
				</c:if>
			</c:forEach>
		</div>
		
		<a href="getAllBooks" class="view">View all</a>
	</main>

	<footer>
		<div class="logo">
			<img alt="logo" src="images/Mars.png" width="150px" height="100px">
		</div>
		<div>
			<ul>
				<li><em class="fa fa-phone"></em>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<a href="tel:+6382639293">6382639293</a></li>
				<li><em class="fa fa-gmail">&#xf0e0;</em>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<a href="mailto:mars1234@gmail.com">mars1234@gmail.com</a>
			</ul>
		</div>

		<div class="addr">
			12A, Middle Street,<br>Golden City,<br>Madurai,<br>Tamil
			Nadu.
		</div>
	</footer>

<script src="script/userpage.js"></script>
<script type="text/javascript" src="script/profilemenu.js"></script>
</body>
</html>
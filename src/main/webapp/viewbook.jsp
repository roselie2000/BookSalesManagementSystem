<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta content="text/html; charset=utf-8" />
<title>View Books</title>
<link rel="stylesheet" href="styles/navbar.css">
<link rel="stylesheet" href="styles/footer.css"> 
<link rel="stylesheet" href="styles/user.css">
<link rel="stylesheet" href="styles/views.css">
<script src='https://kit.fontawesome.com/a076d05399.js'></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
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
			<li><a href="userBooks">Home</a></li>
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
		<div class="viewed-book">
			<div class="imgdiv">
				<img alt="book cover page" src="data:image/jpg;base64,${book.imagesPath}">
			</div>
			<div>
				<div class="container">
					<div class="head">
						<div class="topics">
							<h1><em>${book.bookName }</em></h1>
							<h4>by ${book.author } (Author) | ${book.publisher} (Publisher)</h4>
						</div>
						
						<div class="info">
							<c:if test =  "${book.edition > 0 }">
								<div>Edition : ${book.edition }</div>
							</c:if>
							<div>Category : ${book.category}</div>
						</div>
							
						<div class="price-container">
							<div><h2><span><em>Rs.</em></span>${book.actualPrice }</h2></div>
							<div><p class="msg">${msg }</p></div>
						</div>
					</div>
					
					<div class="btn">
						<a href="/addtocart?id=${book.bookId }&cat=${book.category}&price=${book.actualPrice}"><button class="cart">Add to cart</button></a>
						<a href="/getOrders?id=${book.bookId}"><button class="order">Order</button></a>
						<a href="#review-panel" class="review">Write Review</a>
					</div>
				</div>
			</div>
		</div>
		
		<div class="topic">
			<h1>Related Books</h1>
		</div>
		
		<div class="books-container">
			<c:forEach var="books" items="${relatedBook}" varStatus="loop">
				<div class="book-info">
						<div class="img">
							<img alt="${books.bookName }" src="data:image/jpg;base64,${books.imagesPath}" width="100%" height="270px">
							<h3>${books.bookName }</h3>
						</div>
						<div class="details">
							<h4>Rs.${books.actualPrice }</h4>
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
								<c:when test="${book.rate == 0 }">
									<div>
										<span class="fa fa-star"></span>
										<span class="fa fa-star"></span>
										<span class="fa fa-star"></span>
										<span class="fa fa-star"></span>
										<span class="fa fa-star"></span>
									</div>
								</c:when>
							</c:choose>
						</div>
						<div class="view-btn">
							<a href="/getBooks?id=${books.bookId }&cat=${books.category}"><button>View</button></a>
						</div>
					</div>
			</c:forEach>
		</div>
		
		<div class="topic">
			<h1>Top Most Searched Books</h1>
		</div>
		
		<div class="books-container">
			<c:forEach var="books" items="${topBooks}" varStatus="loop">
				<div class="book-info">
						<div class="img">
							<img alt="${books.bookName }" src="data:image/jpg;base64,${books.imagesPath}" width="100%" height="270px">
							<h3>${books.bookName }</h3>
						</div>
						<div class="details">
							<h4>Rs.${books.actualPrice }</h4>
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
								
								<c:when test="${book.rate == 0 }">
									<div>
										<span class="fa fa-star"></span>
										<span class="fa fa-star"></span>
										<span class="fa fa-star"></span>
										<span class="fa fa-star"></span>
										<span class="fa fa-star"></span>
									</div>
								</c:when>
								
							</c:choose>
						</div>
						<div class="view-btn">
							<a href="/getBooks?id=${books.bookId }&cat=${books.category}"><button>View</button></a>
						</div>
					</div>
			</c:forEach>
		</div>
		
		<div class="review-panel" id="review-panel">
			<h3>Write Your Reviews</h3>
			<form action="/addReview">
			<input type="hidden" name="id" value="${book.bookId }">
			<div>
				<label>Rating :</label>
				<select name="rate">
					<option>1</option>
					<option>2</option>
					<option>3</option>
					<option>4</option>
					<option>5</option>
				</select>
			</div>
			<textarea rows="5" placeholder="Write your review here" name="review"></textarea>
			<input type="submit" value="Submit">
			</form>
		</div>
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
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
	<jsp:include page="userheader.jsp"></jsp:include>
	<jsp:include page="usernavbar.jsp"></jsp:include>
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
	
	<jsp:include page="footer.jsp"></jsp:include>
	
	<script src="script/userpage.js"></script>
	<script type="text/javascript" src="script/profilemenu.js"></script>
</body>
</html>
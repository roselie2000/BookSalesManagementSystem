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
			<c:forEach var="relatedBook" items="${relatedBook}" varStatus="loop">
				<jsp:include page="bookdiv.jsp">
					<jsp:param value="${relatedBook.imagesPath }" name="bookImage"/>
					<jsp:param value="${relatedBook.bookName }" name="bookName"/>
					<jsp:param value="${relatedBook.actualPrice }" name="actualPrice"/>
					<jsp:param value="${relatedBook.rate }" name="rate"/>
					<jsp:param value="${relatedBook.bookId }" name="bookId"/>
					<jsp:param value="${relatedBook.category }" name="category"/>
				</jsp:include>
			</c:forEach>
		</div>
		
		<div class="topic">
			<h1>Top Most Searched Books</h1>
		</div>
		
		<div class="books-container">
			<c:forEach var="topBooks" items="${topBooks}" varStatus="loop">
				<jsp:include page="bookdiv.jsp">
					<jsp:param value="${topBooks.imagesPath }" name="bookImage"/>
					<jsp:param value="${topBooks.bookName }" name="bookName"/>
					<jsp:param value="${topBooks.actualPrice }" name="actualPrice"/>
					<jsp:param value="${topBooks.rate }" name="rate"/>
					<jsp:param value="${topBooks.bookId }" name="bookId"/>
					<jsp:param value="${topBooks.category }" name="category"/>
				</jsp:include>
			</c:forEach>
		</div>
		
		<c:if test="${not empty reviews}">
		<h1 class="review-head">Reviews</h1>
		<div class="reviews">
			<c:forEach var="review" items="${reviews }">
				<div>
					<h4>${review.userName }</h4>
					<p>${review.review }</p>
				</div>
			</c:forEach>
		</div>
		</c:if>
		
		<div class="review-panel" id="review-panel">
			<h3>Write Your Reviews</h3>
			<form action="/addReview">
			<input type="hidden" name="id" value="${book.bookId }">
			<div>
				<label>Rating :</label>
				<select name="rate">
					<option disabled selected>Give Rate</option>
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
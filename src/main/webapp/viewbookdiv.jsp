<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<div class="viewed-book">
		<div class="imgdiv">
			<img alt="book cover page"
				src="data:image/jpg;base64,${book.imagesPath}">
		</div>
		<div>
			<div class="container">
				<div class="head">
					<div class="topics">
						<h1>
							<em>${book.bookName }</em>
						</h1>
						<h4>by ${book.author } (Author) | ${book.publisher}
							(Publisher)</h4>
					</div>

					<div class="info">
						<c:if test="${book.edition > 0 }">
							<div>Edition : ${book.edition }</div>
						</c:if>
						<div>Category : ${book.category}</div>
					</div>

					<div class="price-container">
						<div>
							<h2>
								<span><em>Rs.</em></span>${book.actualPrice }</h2>
						</div>
						<div>
							<p class="msg">${msg }</p>
						</div>
					</div>
				</div>

				<div class="btn">
					<a
						href="/addtocart?id=${book.bookId }&cat=${book.category}&price=${book.actualPrice}"><button
							class="cart">Add to cart</button></a> <a
						href="/getOrders?id=${book.bookId}"><button class="order">Order</button></a>
					<a href="#review-panel" class="review">Write Review</a>
				</div>
			</div>
		</div>
	</div>
</body>
</html>
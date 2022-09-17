<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta content="text/html; charset=utf-8" />
<title>Cart page</title>
<link rel="stylesheet" href="styles/navbar.css">
<link rel="stylesheet" href="styles/views.css">
<script src='https://kit.fontawesome.com/a076d05399.js'></script>

</head>
<body>

	<jsp:include page="userheader.jsp"></jsp:include>
	<jsp:include page="usernavbar.jsp"></jsp:include>
	<main>
	<c:choose>
		<c:when test="${empty carts }">
			<div><p class="msg">${msg }</p></div> 
			<div class="order-button"><a href="getAllBooks"><button>View</button></a></div>
		</c:when>
		
		<c:when test="${not empty carts }">
			<c:forEach var="ct" items="${carts}">
		<div class="viewed-book">
			<div class="imgdiv">
				<img alt="book cover page" src="data:image/jpg;base64,${ct.bookImages}">
			</div>
			<div>
				<div class="container">
					<div class="head-div">
						<h1><em>${ct.bookName }</em></h1>
						<div>
							<div class="label">Author</div>
							<div>${ct.authors }</div>
						</div>
						<div>
							<div class="label">Publisher</div>
							<div>${ct.publishers}</div>
						</div>
						<c:if test = "${ct.edition > 0 }">
							<div>
								<div class="label">Edition</div>
								<div>${ct.edition }</div>
							</div>
						</c:if>
						<div>
							<div class="label">Category</div>
							<div>${ct.category}</div>
						</div>
						
						<div>
							<div class="label">Quantity</div>
							<div>${ct.cartQuantity }</div>
							
						</div>
						
					</div>
					
					<div class="price-container">
						<h2><span><em>Rs.</em></span>${ct.price }</h2>
					</div>
					<div class="btn">
						<a href="/deletecart?id=${ct.cartId }"><button class="cart">Remove</button></a>
						<a href="/getOrders?id=${ct.bookId}"><button class="order">Order</button></a>
					</div>
				</div>
			</div>
		</div>
	</c:forEach>
	<div class="order-button"><a href="getMultipleOrders"><button>Order</button></a></div>
	</c:when>
	</c:choose>
	</main>
	
	<script src="script/userpage.js"></script>
	<script src="script/profilemenu.js"></script>
</body>
</html>
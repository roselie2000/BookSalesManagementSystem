<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="ISO-8859-1">
<title>Orders</title>
<link rel="stylesheet" href="styles/navbar.css">
<link rel="stylesheet" href="styles/views.css">
<script src='https://kit.fontawesome.com/a076d05399.js'></script>
</head>
<body onload="sumAllPrice()">

<header>
	<a href="userBooks"><span>&#8249;</span></a>
	<h1>Orders</h1>	
</header>
	<c:forEach var="ct" items="${cart}">
		<div class="viewed-book">
			<div class="imgdiv">
				<img alt="book cover page"
					src="data:image/jpg;base64,${ct.bookImages}">
			</div>
			<div>
				<div class="container">
					<div class="head-div">
						<h1>
							<em>${ct.bookName }</em>
						</h1>
						<div>
							<div class="label">Author</div>
							<div>${ct.authors }</div>
						</div>
						<div>
							<div class="label">Publisher</div>
							<div>${ct.publishers}</div>
						</div>
						<c:if test="${ct.edition > 0 }">
							<div>
								<div class="label">Edition</div>
								<div>${ct.edition }</div>
							</div>
						</c:if>
						<div>
							<div class="label">Category</div>
							<div>${ct.category}</div>
						</div>
					</div>

					<div class="price-container">
						<form id="${ct.cartId }" action="updateQuantity">
							<input type="hidden" name="avlQuantity" class="avl_qty" value=${ct.availableQuantity }>
							<input type="hidden" name="id" value="${ct.cartId }">
							<input type="hidden" name = "actual price" value="${ct.bookPrice }" id="price">
							<div class="quantity">
								<label>Quantity</label>
								<div>
									<div class="qty-button" onclick="decreaseQuantity(${ct.cartId})">&#8722;</div>
									<div><input type="text" name="quantity"  pattern="[0-9]*" class="qty" value="${ct.cartQuantity }" 
										onkeyup="setPrice(${ct.cartId})"></div>
									<div onclick="increaseQuantity(${ct.cartId})">&plus;</div>
									<input type="submit" value="Save" class="ok">
								</div>								 
							</div>
							<input type="text" name="price" class="price" value="${ct.price }" pattern="[0-9]*" readonly>
							
							<div id="alert-msg"></div>
						</form>
					</div>
					<div class="btn">
						<a href="/deletecart?id=${ct.cartId }"><button class="cart">Remove</button></a>
					</div>
				</div>
			</div>
		</div>
	</c:forEach>
	
	<div id="totalPrice"></div>
	<div class="order-button"><a href="getAddressFromcart"><button>Order</button></a></div>
	<script src="script/profilemenu.js"></script>
	<script src="script/multiplepricecalculation.js"></script>
</body>
</html>
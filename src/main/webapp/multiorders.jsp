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
	<c:forEach var="ct" items="${cart}">
		<div class="viewed-book">
			<div class="imgdiv">
				<img alt="book cover page"
					src="data:image/jpg;base64,${ct.bkImages}">
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
						<%-- <div>
							<div class="label">Quantity</div>
							<div>${ct.cartQuantity}</div>
						</div> --%>
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
	<script type="text/javascript" src="script/profilemenu.js"></script>
	<script type="text/javascript">
	
	function setPrice(trigger){
		let container = document.getElementById(trigger);
		let qty = container.querySelector('.qty').value;
		let price = container.querySelector('.price');
		let defaultPrice = document.getElementById("price").value;
		if(qty <= 0){
			price.value = defaultPrice;
		}
		else{
			let total = defaultPrice * qty;
			price.value = total;
		}
	}
	
	function sumAllPrice(){
		let allPrice = document.querySelectorAll('.price');
		let sum = 0;
		for(let i=0; i<allPrice.length; i++){
			let num = parseInt(allPrice[i].value);
			sum += num;
		}
		document.getElementById('totalPrice').innerHTML = sum;
	}
	
		function increaseQuantity(trigger){
			let container = document.getElementById(trigger);
			let qty = parseInt(container.querySelector('.qty').value);
			const price = document.getElementById("price").value
			if(Number.isNaN(qty)){
				qty = 1;
				container.querySelector('.qty').value = qty;
				let total = price * qty;
				container.querySelector('.price').value = total;
				sumAllPrice();
			}
			else{
				qty++;
				container.querySelector('.qty').value = qty;
				let total = price * qty;
				container.querySelector('.price').value = total;
				sumAllPrice();
			}
			
		}
		
		function decreaseQuantity(trigger){
			let container = document.getElementById(trigger);
			let qty = parseInt(container.querySelector('.qty').value);
			const price = document.getElementById("price").value;
			qty--;
			if(qty <= 1){
				qty = 1;
				container.querySelector('.qty').value = qty;
				let total = price * qty;
				container.querySelector('.price').value = total;
				sumAllPrice();
				
			}
			else{
				container.querySelector('.qty').value = qty;
				let total = price * qty;
				container.querySelector('.price').value = total;
				sumAllPrice();
			}
			
		}
	</script>
</body>
</html>
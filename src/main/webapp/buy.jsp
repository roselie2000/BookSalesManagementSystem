<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta content="text/html; charset=utf-8" />
<title>user landing page</title>
<link rel="stylesheet" href="styles/navbar.css">
<link rel="stylesheet" href="styles/buy.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
</head>
<body>
	<header>
		<ul>
			<li class="left"><img alt="logo" src="images/Mars.png" height="80px"
				width="150px"></li>
			<li class="profile"><a href="profile.jsp" class="right"><img
					alt="profile" src="images/profile.png" width="50px" height="50px"></a></li>
		</ul>
	</header>
<main>
<div class="buy-form-container">
<form action="getAddress">
<input type="hidden" id = "avl_qty" value="${book.availableQuantity }">
<label>Book ID</label>
<input type="text" name="bookid" value="${book.bookId }" required readonly>
<label>Book Name</label>
<input type="text" name="bookName" value="${book.bookName }" required readonly>
<label>Author</label>
<input type="text" name="author" value="${book.author }" required readonly>
<label>Publisher</label>
<input type="text" name="publisher" value="${book.publisher }" required readonly>
<label>Price</label>
<input type="text" name="price" value="${book.actualPrice }" id="price" required readonly>
<label>Quantity</label>
<input type="text" name="quantity" value="1" pattern="[0-9]*" id="qty" required onkeyup="calculatePriceAmount()">
<div></div>
<div id="alert-msg"></div>
<label>Total Price</label>
<input type="text" name="total" pattern="[0-9]*" value="${book.actualPrice }" id="totalPrice" required readonly>
<a href="cancel"><button>Cancel</button> </a>
<input type="submit" name="submit" value="Buy" id="submit">
</form>
</div>
</main>	
</body>
<script type="text/javascript">
function calculatePriceAmount() {
	console.log("inside function")
	let price = parseInt(document.getElementById("price").value);
	let availableQuantity = parseInt(document.getElementById("avl_qty").value);
	let qty = parseInt(document.getElementById("qty").value);
	let quantity = document.getElementById("qty").value;
	if(availableQuantity < qty){
		console.log(qty + " " + availableQuantity);
		document.getElementById("qty").value = "";
		document.getElementById("totalPrice").value = 0;
		window.alert("We only have" + availableQuantity + "books. Please Order less than" + availableQuantity + "or Order later");
	}
	else{
		if(Number.isNaN(quantity)){
			document.getElementById("totalPrice").value = 0;
		}
		let totalPrice = qty * price;
		document.getElementById("totalPrice").value = totalPrice;
	}
	
}
</script>
</html>
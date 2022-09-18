<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="ISO-8859-1">
<title>Payment</title>
<link rel="stylesheet" href="styles/payment.css">
<script src=
"https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js">
 </script>
</head>
<body onload="sumAllPrice()">
<header>
	<a href="userBooks"><span>&#8249;</span></a>
	<h1>Summary</h1>	
</header>
<c:choose>
	<c:when test="${not empty book }">
	<div class="order-list">
		<div><img alt="book cover page" src="data:image/jpg;base64,${book.imagesPath}"></div>
		<div>
			<div><span>Book Name: </span>${book.bookName }</div>
			<div><span>Quantity: </span>${quantity}</div>
			<div class="price">${price }</div>
		</div>
	</div>
	<div class="total">
		<label>Total Price</label>
		<div class="totalPrice"></div>
	</div>
	<form action="addOrder" method="post">
		<label>
			Card number
		</label>
		<input type="text" name="cardno" placeholder="Enter your card number" required pattern="[0-9]{12}"
		title="The card number should be 12 digits eg. 8364 7364 3253 7432">
		<label>Expire Date</label>
		<div>
			<input type="text" name="month" placeholder="MM" required pattern="[0-9]{2}"
			title="The month should be 2 digits eg. 12 or 02" id="month">
			<input type="text" name="year" placeholder="YY"required pattern="[0-9]{2}"
			title="The year should be 2 digits eg. 22" id="year" onclick="checkMonth()">
		</div>
		<label>CVV</label>
		<input type="password" name="cvv" placeholder="CVV" required pattern="[0-9]{3}"
			title="The cvv number should be 3 digits eg. 123" onclick="checkYear()">
		<div></div>
		<div id="container">
  				<div class="msg">
  					<p>Click confirm to Place the order!<br>Note: Once you place the order you can't cancel it</p>
  				</div>
  				<input class="yes" type="submit" name="submit" value="confirm">
			</div>
		<input type="button" value="Confirm and Order" onclick="member()">
	</form>
	</c:when>
	<c:when test="${not empty cart }">
	<c:forEach var="cart" items="${cart }">
		<div class="order-list">
		<div><img alt="book cover page" src="data:image/jpg;base64,${cart.bookImages}"></div>
		<div>
			<div><span>Book Name: </span>${cart.bookName }</div>
			<div><span>Quantity: </span>${cart.cartQuantity}</div>
			<div class="price">${cart.price }</div>
		</div>
	</div>
	</c:forEach>
		<div class="total">
		<label>Total Price</label>
		<div class="totalPrice"></div>
	</div>
		
		<form action="addMultipleOrders" method="post">
		<label>
			Card number
		</label>
		<input type="text" name="cardno" placeholder="Enter your card number" required pattern="[0-9]{12}"
		title="The card number should be 12 digits eg. 8364 7364 3253 7432">
		<label>Expire Date</label>
		<div>
			<input type="text" name="month" placeholder="MM" required pattern="[0-9]{2}"
			title="The month should be 2 digits eg. 12 or 02" id="month">
			<input type="text" name="year" placeholder="YY"required pattern="[0-9]{2}"
			title="The year should be 2 digits eg. 22" id="year" onclick="checkMonth()">
		</div>
		<label>CVV</label>
		<input type="password" name="cvv" placeholder="CVV" required pattern="[0-9]{3}"
			title="The cvv number should be 3 digits eg. 123" onclick="checkYear()">
		<div></div>
		<div id="container">
  				<div class="msg">
  					   </div>
  				<input class="yes" type="submit" name="submit" value="confirm">
			</div>
		<input type="button" value="Confirm and Order" onclick="member()">
	</form>
	</c:when>
</c:choose>
	
	
<script type="text/javascript">
function sumAllPrice(){
	let allPrice = document.querySelectorAll('.price');
	let sum = 0;
	for(let i=0; i<allPrice.length; i++){
		let num = parseInt(allPrice[i].innerHTML);
		sum += num;
	}
 	document.getElementsByClassName('totalPrice')[0].innerHTML = "Rs. " + sum; 
}

function checkMonth(){
	let month = document.getElementById("month").value;
	if(month>12 || month<=0){
		window.alert("The month should be within 1 to 12!");
		document.getElementById("month").value = "";
	}
}

function checkYear(){
	let year = document.getElementById("year").value;
	console.log(year);
	if(year < 22 || year > 27){
		window.alert("The expire year of card should be within 22 to 26!!");
		document.getElementById("year").value = "";
	}
}

function member(msg,clk) {
	   var confirmBox = $("#container");
	   confirmBox.find(".msg").text(msg);
	   confirmBox.find(".yes").unbind().click(function()
	   {
	   confirmBox.hide();
	   });
	   confirmBox.find(".yes").click(clk);
	   confirmBox.show();
	  }
</script>
</body>
</html>
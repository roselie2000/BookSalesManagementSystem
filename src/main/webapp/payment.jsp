<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="ISO-8859-1">
<title>Payment</title>
<link rel="stylesheet" href="styles/payment.css">
</head>
<body>
<h3>Summary</h3>
<c:choose>
	<c:when test="${not empty book }">
	<div class="order-list">
		<div><img alt="book cover page" src="data:image/jpg;base64,${book.imagesPath}"></div>
		<div>
			<div>${book.bookName }</div>
			<div>${quantity}</div>
			<div>${price }</div>
		</div>
	</div>
	<form action="addOrder">
		<label>
			Card number
		</label>
		<input type="text" name="cardno" placeholder="Enter your card number">
		<label>Expire Date</label>
		<input type="text" name="month" placeholder="MM">
		<input type="text" name="year" placeholder="YY">
		<label>CVV</label>
		<input type="text" name="cvv" placeholder="CVV">
		<input type="submit" value="Confirm and Order">
	</form>
	</c:when>
	<c:when test="${empty book }">
	<h1>Add Multiple Orders</h1>
		<form action="addMultipleOrders">
		<label>
			Card number
		</label>
		<input type="text" name="cardno" placeholder="Enter your card number">
		<label>Expire Date</label>
		<input type="text" name="month" placeholder="MM">
		<input type="text" name="year" placeholder="YY">
		<label>CVV</label>
		<input type="text" name="cvv" placeholder="CVV">
		<input type="submit" value="Confirm and Order">
	</form>
	</c:when>
</c:choose>
	
	
	
</body>
</html>
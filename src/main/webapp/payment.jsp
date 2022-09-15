<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Payment</title>
</head>
<body>
<c:choose>
	<c:when test="${not empty book }">
		<table>
		<caption>Orders</caption>
		<tr>
		<td>${book.bookName }</td>
		<td>${book.author }</td>
		<td>${quantity}</td>
		<td>${price }</td>
		</table>
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
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>bill</title>
</head>
<body>
<table>
<caption>Bill</caption>
<thead>
<tr>
<th>Book Name</th>
<th>Quantity</th>
<th>Total Price</th>
</tr>
</thead>
<c:forEach var="ct" items="${cart }">
<tr>
	<td>${ct.bookName }</td>
	<td>${ct.cartQuantity }</td>
	<td>${ct.cartPrice }</td>
</tr>
</c:forEach>
</table>
<div class="order-button"><a href="placeMultipleOrders"><button>Order</button></a></div>
</body>
</html>
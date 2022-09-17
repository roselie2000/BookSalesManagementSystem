<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="ISO-8859-1">
<title>Top User</title>
<link rel="stylesheet" href="styles/navbar.css">
<link rel="stylesheet" href="styles/dropdown.css">
<link rel="stylesheet" href="styles/topuser.css">
<link rel="stylesheet" href="styles/table.css">
</head>
<body>
	<jsp:include page="adminheader.jsp"></jsp:include>
	<main>
	<div class="user-details">
		<div>
			<label>User Name</label>
			<p>${user.userName }</p>
		</div>
		<div>
			<label>Name</label>
			<p>${user.name }</p>
		</div>
		<div>
			<label>Email ID</label>
			<p>${user.emailId }</p>
		</div>
		<div>
			<label>Phone no</label>
			<p>${user.phoneno }</p>
		</div>
		<div>
		<label>Address</label>
		<p>${user.address },<br> ${user.district },<br> ${user.state }- ${user.pincode }
		</div>
	</div>
		
	<table>
		<caption>Order List of ${user.userName }</caption>
		<thead>
			<tr>
				<th>Order ID</th>
				<th>Book ID</th>
				<th>Book Name</th>
				<th>Quantity</th>
				<th>Total Price</th>
		</thead>
		<tbody>
		<c:forEach var="od" items="${orders}">
			<tr>
				<td>${od.orderId }</td>
				<td>${od.bookId }</td>
				<td>${od.bookName }</td>
				<td>${od.quantity }</td>
				<td>${od.totalPrice }</td>
			</tr>
		</c:forEach>
		</tbody>
	</table>
	</main>
	<script type="text/javascript">
	window.onscroll = function() {myFunction()};
	let navbar = document.getElementById("nav");
	let sticky = navbar.offsetTop;
	function myFunction() {
	  if (window.pageYOffset >= sticky) {
	    navbar.classList.add("sticky")
	  } else {
	    navbar.classList.remove("sticky");
	  }
	}
	</script>
</body>
</html>
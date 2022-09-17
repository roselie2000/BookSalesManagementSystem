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
	<header>
		<ul>
			<li class="left"><img alt="logo" src="images/Mars.png" height="95px"
				width="150px"></li>
			<li class="profile"><img alt="profile" src="images/profile.png" width="70px" height="70px"></li>
			<li class="admin">Administrator</li>
		</ul>
	</header>
	
	<nav id = "nav">
		<div class="menu">
			<ul>
				<li><a href="home.jsp">Home</a></li>
				<li class="dropdown"><a href="Books" class="dropbtn">Books</a>
					<div class="dropdown-content">
    					<a href=getBookByCategoryAdmin?category=Novel>Novels</a>
    					<a href="getBookByCategoryAdmin?category=Poetry">Poetry</a>
    					<a href="getBookByCategoryAdmin?category=History">History</a>
    					<a href="getBookByCategoryAdmin?category=Education">Education</a>
    					<a href="getBookByCategoryAdmin?category=Biography">Biography</a>
    					<a href="Books">All Books</a>
  					</div>
				</li>
				<li><a href="Orders">Orders</a></li>
				<li><a href="Users">Users</a></li>
				<li><a href="addbooks.jsp">Add Books</a></li>
			</ul>
		</div>
	</nav>
	
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
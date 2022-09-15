<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta content="text/html; charset=utf-8" />
<title>Administrator page</title>
<link rel="stylesheet" href="styles/navbar.css">
<link rel="stylesheet" href="styles/footer.css">
<link rel="stylesheet" href="styles/table.css">
<link rel="stylesheet" href="styles/dropdown.css">
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
	
	<nav>
		<div class="menu">
			<ul>
				<li><a href="adminHome">Home</a></li>
				<li class="dropdown"><a href="Books" class="dropbtn">Books</a>
					<div class="dropdown-content">
    					<a href="Novels">Novels</a>
    					<a href="Poetry">Poetry</a>
    					<a href="History">History</a>
    					<a href="Education">Education</a>
    					<a href="Biography">Biography</a>
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
	
	<table>
		<caption>Order List</caption>
        <thead>
          <tr>
            <th>Cart ID</th>
            <th>Order ID</th>
            <th>User Name</th>
            <th>Email ID</th>
            <th>Phone no</th>
            <th>Address</th>
            <th>Book id</th>
            <th>Quantity</th>
            <th>Total price</th>  
            <th>Status</th>
         	<th>Ordered Date</th>
          </tr>
        </thead>
        <tbody>
        <c:forEach var="od" items="${orderList}">
        	<tr>
            <td>${od.cartId}</td>
            <td>${od.orderId }</td>
            <td>${od.userName }</td>
            <td>${od.emailId }</td>
            <td>${od.phoneno }</td>
            <td>${od.orderedAddress }</td>
            <td>${od.bookId }</td>
            <td class="center_col">${od.quantity }</td>
            <td class="center_col">${od.totalPrice }</td>
            <td>${od.status }</td>
            <td>${od.orderDate }</td>
          </tr>
        </c:forEach>
        </tbody>
      </table>
	</main>
</body>
</html>
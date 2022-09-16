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
<jsp:include page="adminheader.jsp"></jsp:include>
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
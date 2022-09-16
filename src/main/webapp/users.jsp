<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta content="text/html; charset=utf-8" />
<title>Administrator page</title>
<link rel="stylesheet" href="styles/user.css">
<link rel="stylesheet" href="styles/dropdown.css">
<link rel="stylesheet" href="styles/table.css">

</head>
<body>
	<jsp:include page="adminheader.jsp"></jsp:include>

	<main>
		<table>
		<caption>Users List</caption>
			<thead>
				<tr>
					<th>User Name</th>
					<th>Name</th>
					<th>Phone no</th>
					<th>Email ID</th>
					<th>Address</th>
					<th>District</th>
					<th>State</th>
					<th>Pincode</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="user" items="${users}">
					<tr>
						<td>${user.userName}</td>
						<td>${user.name}</td>
						<td>${user.phoneno}</td>
						<td>${user.emailId}</td>
						<td>${user.address}</td>
						<td>${user.district}</td>
						<td>${user.state}</td>
						<td>${user.pincode}</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</main>
</body>
</html>
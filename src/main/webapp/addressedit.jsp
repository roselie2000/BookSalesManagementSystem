<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="ISO-8859-1">
<title>Address change</title>
<link rel="stylesheet" href="styles/addresseditform.css">
<script src='https://kit.fontawesome.com/a076d05399.js'></script>
</head>
<body>
<header>
	<a href="userBooks"><span>&#8249;</span></a>
	<h1>Edit Address</h1>	
</header>
<form action="addDeliveryAddress" class="address">
	<label>Address</label>
	<input type="text" value="${userdata.address }" name="addr" required>
	<label>District</label>
	<input type="text" value="${userdata.district }" name="dist" required pattern="[A-Za-z]{4,20}"
		title="Please enter a valid district name">
	<label>State</label>
	<input type="text" value="${userdata.state }" name="state" required pattern="[A-Za-z\s]{4,20}"
		title="Please enter a valid district name">
	<label>Pin code</label>
	<input type="text" value="${userdata.pincode }" name="pincode" required pattern="[0-9]{6}"
		title="Please enter a valid pincode">
	<div></div>
	<input type="submit" value="continue">
</form>
<script type="text/javascript" src="script/profilemenu.js"></script>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Address change</title>
</head>
<body>
<form action="addDeliveryAddress">
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
	<input type="submit" value="continue">
</form>
</body>
</html>
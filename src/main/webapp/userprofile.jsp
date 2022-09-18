<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="ISO-8859-1">
<title>user profile</title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="styles/profile.css">
</head>
<body>
<div class="msg"><p>${msg }</p></div>
<fieldset>
	<legend>
		<img alt="profile" src="images/profile.png" width="150px" height="150px">
	</legend>
	<form action="updateUser" class="container">
		<label>Name</label>
		<input type="text" value="${userdata.name }" name="name" required pattern="[A-Z]{1}[A-Za-z\s\,]{4,18}"
		title="Please enter a valid name eg.M Roselie">
		<label>User name</label>
		<input type="text" value="${userdata.userName }" name="username" disabled="disabled">
		<label>Email Id</label>
		<input type="email" value="${userdata.emailId }" name="emailid" disabled="disabled">
		<label>Phone no</label>
		<input type="tel" value="${userdata.phoneno }" name="phno" required pattern="[0-9]{10}"
		title="Please enter a correct phone number">
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
		<input type="submit" name="submit" value="submit">
	</form>
</fieldset>
</body>
</html>
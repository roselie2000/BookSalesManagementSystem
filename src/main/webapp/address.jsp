<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="ISO-8859-1">
<title>User Address</title>
<link rel="stylesheet" href="styles/address.css">
</head>
<body>
<header>
	<a href="userBooks"><span>&#8249;</span></a>
	<h1>Address</h1>	
</header>
	<main>
	
		<div class="address">
			<h3>${userdata.name }</h3>
			<p>${userdata.address }, ${userdata.district },<br>${userdata.state }, ${userdata.pincode }</p>
			<a href="editAddress" class="edit">Edit</a>
			<a href="payment" class="button"><button>Deliver to this Address</button></a>
		</div>
		
	</main>
	
	<script type="text/javascript" src="script/profilemenu.js"></script>
</body>
</html>
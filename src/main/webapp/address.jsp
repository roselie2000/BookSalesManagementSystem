<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>User Address</title>
</head>
<body>
<header>
		<ul>
			<li class="left"><img alt="logo" src="images/Mars.png" height="95px"
				width="150px"></li>
			<li>
				<form class="search" action="/searchBooks">
					<input type="search"
						placeholder="Search your favourite books" name="keyword">
					<button type="submit"><em class="fa fa-search"></em></button>
				</form>
			</li>
			<li class="profile"><img alt="profile" src="images/profile.png" width="70px" height="70px" onclick="showOption()"></li>
			<li class="profile"><a href="carts"><img alt="cart" src="images/cart.png" width="60px" height="60px"></a></li>
		</ul>
	</header>
		
	<div id="option">
		<a href="getProfile">Profile</a>
		<a href="getOrderHistory">My History</a>
		<a href="Logout">Logout</a>
	</div>
	<main>
		<div class="address">
			<h3>${userdata.name }</h3>
			<p>${userdata.address }, ${userdata.district },<br>${userdata.state }, ${userdata.pincode }</p>
			<a href="editAddress">Edit</a>
		</div>
		<a href="payment"><button>Deliver to this Address</button></a>
	</main>
	
	<script type="text/javascript" src="script/profilemenu.js"></script>
</body>
</html>
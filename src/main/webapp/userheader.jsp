<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" href="styles/navbar.css">
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
	<nav id="nav">
		<div class="catgry">
			<ul>
			<li><a href="home.jsp">Home</a></li>
				<li><a href="getBookByCategory?category=Biography">Biography</a></li>
				<li><a href="getBookByCategory?category=Education">Education</a></li>
				<li><a href="getBookByCategory?category=Novels">Novels</a></li>
				<li><a href="getBookByCategory?category=Poetry">Poetry</a></li>
				<li><a href="getBookByCategory?category=History">History</a></li>
				<li><a href="getAllBooks">All</a></li>
				<li class="button" onclick="showFilters()"><a href="#">Filters <em class="fa fa-caret-down"></em></a></li>
			</ul>
		</div>
	</nav>
 
 	<div class="filters" id="filters">
 		<button class="dropdown-btn">Price <em class="fa fa-caret-down"></em></button>
 		<div class="dropdown-container">
    		<a href="getBookByPrice?from=${0 }&to=${200}">Under Rs.200</a>
    		<a href="getBookByPrice?from=${201 }&to=${500}">Rs.201 - Rs.500</a>
    		<a href="getBookByPrice?from=${501 }&to=${800}">Rs.501 - Rs.800</a>
    		<a href="getBookByPrice?from=${801 }&to=${1000}">Rs.801 - Rs.1000</a>
    		<a href="getBookByPrice?from=${1000 }&to=${10000}">Over Rs.1000</a>
  		</div>
 		<button class="dropdown-btn">Language <em class="fa fa-caret-down"></em></button>
 		<div class="dropdown-container">
    		<a href="language?lang=English">English</a>
    		<a href="language?lang=Tamil">Tamil</a>
    		<a href="language?lang=Hindi">Hindi</a>
    		<a href="language?lang=Telugu">Telugu</a>
    		<a href="language?lang=Malayalam">Malayalam</a>
    		<a href="language?lang=Kanadam">Kanadam</a>
  		</div>
 	</div>
	
</body>
</html>
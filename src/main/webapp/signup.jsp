<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta content="text/html; charset=utf-8" />
<title>Sign in page</title>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="styles/login.css">
</head>
<body>
	<header>
		<img alt="logo" src="images/Mars.png">
	</header>
	<p style="color: red; text-align: center;">${msg}</p>
	<fieldset class="panel">
		<legend>Sign in</legend>
		<form action="/signup" method="post">
			<div class="input-icon">
				<em class="fa fa-user icon"></em> <input type="text"
					placeholder="Enter Username" name="username" class="input-field" pattern="[A-Za-z0-9]{5,15}"
					title="Please enter a valid username. The username should contain 5 to 10 alpha numeric letters" required>
				<em class="fa fa-envelope icon"></em> <input type="email"
					placeholder="Enter your email id" name="email" class="input-field" required pattern="[a-z0-9._%+-]+@gmail+\.com"> <em
					class="fa fa-lock icon"></em> <input type="password"
					placeholder="Enter a password" name="pwd" class="input-field" 
					pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}" required id="pwd"
  					title="Must contain at least one  number and one uppercase and lowercase letter, and at least 8 or more characters">
  				<div class="show">
  					<input type="checkbox" onclick="myFunction()">
					<label>Show Password</label>
  				</div>
				<input type="submit" value="Sign up" class="signin" />
			</div>
		</form>

		<p>If your already a existing user?</p>

		<a href="login.jsp"><input type="button" value="login"
			class="login" /></a>
	</fieldset>

<script src="script/signup.js"></script>
</body>
</html>
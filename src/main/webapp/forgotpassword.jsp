<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta content="text/html; charset=utf-8" />
<title>change password</title>
<link rel="stylesheet" href="styles/login.css">
</head>
<body>

	<header>
		<img alt="logo" src="images/Mars.png">
	</header>
	<p style="color: red; text-align: center;">${msg}</p>
	<fieldset class="panel">
		<legend>Change Password</legend>
		<form action="changepassword" method="post">
			<div class="input-icon">
				<input type="text" placeholder="Enter Username" name="username" class="input-field" pattern="[A-Za-z0-9]{5,15}"
					title="Please enter a valid username. The username should contain 5 to 10 alpha numeric letters" required>
				<input type="password" placeholder="Enter your Password" name="pwd1" class="input-field" required id="pwd1"
					pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}"
					title="Must contain at least one  number and one uppercase and lowercase letter, and at least 8 or more characters">
				<input type="password" placeholder="Enter a password" name="pwd2" class="input-field" id="pwd2"
					pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}" required
  					title="Must contain at least one  number and one uppercase and lowercase letter, and at least 8 or more characters">
				<input type="submit" value="Change Password" class="signin" onclick="checkPassword()"/>
			</div>
		</form>
	</fieldset>
</body>
</html>
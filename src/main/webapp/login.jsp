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
	<main>
		<div class="staff">
			<fieldset class="login-panel">
				<legend>Admin Login</legend>
				<form action="/adminlogin" method="POST" enctype="multipart/form-data">
					<div class="input-icon">
						<em class="fa fa-user icon"></em> <input type="text"
							placeholder="Enter Username" name="username" class="input-field" required>
						<em class="fa fa-lock icon"></em> <input type="password"
							placeholder="Enter a password" name="pwd" class="input-field" required>
							<input type="submit" value="Login" class="login-staff" />
					</div>
				</form>
			</fieldset>
		</div>

		<div class="user">
			<fieldset class="login-panel">
				<legend>User Login</legend>
				<form action="/userlogin" method="post">
					<div class="input-icon">
						<em class="fa fa-user icon"></em> <input type="text"
							placeholder="Enter Username" name="username" class="input-field" required>
						<em class="fa fa-lock icon"></em> <input type="password"
							placeholder="Enter a password" name="pwd" class="input-field" required>
						<input type="submit" value="Login" class="login" />
					</div>
				</form>
				
				<a href="forgotpassword.jsp"><em>forgot password?</em></a>

				<p>If you are new User</p>

				<a href="signup.jsp"><input type="button" value="Sign Up"
					class="signin" /></a>
			</fieldset>
		</div>
	</main>

</body>
</html>
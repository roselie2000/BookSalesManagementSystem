<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta content="text/html; charset=utf-8" />
<title>Add Books Page</title>
<link rel="stylesheet" href="styles/user.css">
<link rel="stylesheet" href="styles/addbooks.css">
<link rel="stylesheet" href="styles/dropdown.css">
<script src=
"https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js">
 </script>
</head>
<body>
<jsp:include page="adminheader.jsp"></jsp:include>
	<main>
	<p>${msg}</p>
	<div class="form-container">
		<form action="/addBooks" class="container" enctype="multipart/form-data" method="post">
			<label>Book ID</label>
			<input type="text" name="bkid" placeholder="Enter a id for the book" pattern="[A-Z]{2,4}[0-9]{3}" 
				title="The book id should contain 1 to 4 alphabets and 3 numbers (e.g AB736)" required>
				
			<label>Book Name</label>
			<input type="text" name="bkname" placeholder="Enter the name of the book" required pattern="[A-Za-z\s.]{4,70}"
				title="Please enter a proper book name (e.g Wings of Fire)" >
				
			<label>Author Name</label>
			<input type="text" name="authorname" placeholder="Enter the author name of the book" pattern="[A-Z]{1}[A-Za-z\s\,\.]{4,18}"
				title="Please enter a valid author name (e.g APJ.Abdul Kalam)" required>
				
			<label>Publisher</label>
			<input type="text" name="publisher" placeholder="Enter the publisher of the book" pattern="[A-Z]{1}[A-Za-z\s]{4,50}"
				title="Please enter a valid publisher name (e.g World University)" required>
				
			<label>Category</label>
			<select name="category" id="category">
				<option disabled selected>Select a category</option>
				<option>Biography</option>
				<option>Education</option>
				<option>Novel</option>
				<option>Poetry</option>
				<option>History</option>
			</select>
			
			<label>Edition</label>
			<input type="text" name="edition" placeholder="Enter the edition of the book" pattern="[0-9]{1,2}"
				title="Please enter a valid edition number (e.g 1)">
				
			<label>Language</label>
			<select name="lang" id="lang">
				<option disabled selected>Select a Language</option>
				<option>English</option>
				<option>Tamil</option>
				<option>Hindi</option>
				<option>Malayalam</option>
				<option>Kanadam</option>
				<option>Telugu</option>
			</select>
			
			<label>Quantity</label>
			<input type="text" name="quantity" placeholder="Enter the available Quantity of the book" pattern="[0-9]*" required="required">
			
			<label>Price</label>
			<input type="text" name="price" placeholder="Enter the price of the book" pattern="[0-9]*" required
				title="Please enter a valid price (e.g 543)">
			
			<label>MRP</label>
			<input type="text" name="mrpRate" placeholder="Enter the MRP price of the book" pattern="[0-9]*"
				title="Please enter a valid MRP (e.g 269)" required>
			
			<label>Book Cover Page</label>
			<input type="file" name="file" accept="images/png, images/jpeg" title="Please upload only .png file or .jpeg file">
			<div></div>
			<div id="container">
  				<div class="msg"> Click confirm to add the book details</div>
  				<input class="yes" type="submit" name="submit" value="confirm">
			</div>
			<input type="button" class="submit" value="Add" onclick="member()">
		</form>
	</div>
	</main>
	<script src="script/popup.js"></script>
</body>
</html>
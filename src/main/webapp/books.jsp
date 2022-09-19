<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta content="text/html; charset=utf-8" />
<title>Administrator Page</title>
<link rel="stylesheet" href="styles/navbar.css">
<link rel="stylesheet" href="styles/book.css">
<link rel="stylesheet" href="styles/footer.css">
<link rel="stylesheet" href="styles/dropdown.css">
<script src='https://kit.fontawesome.com/a076d05399.js'></script>
<body>
	<jsp:include page="adminheader.jsp"></jsp:include>

	<main>
		<p class="msg">${msg }</p>
		<div class="books-container">
			<c:forEach var="book" items="${books}">
				<div class="book-info">
					<div>
						<img alt="book cover page" src="data:image/jpg;base64,${book.imagesPath}">
					</div>
					<div>
						<form action="update" class="container" id="${book.bookId }">
							<div class="head"><h1>${book.bookName}</h1>
							<em style='font-size:20px' class='fas' onclick="enable(${book.bookId})" class="test">&#xf304;</em>
							</div>
							<div class="input-feild">
								<label>Book ID</label>
								<input type="text" name="bookid" value="${book.bookId}" readonly>
							</div>
				
							<div class="input-feild">
								<label>Book Name</label>
								<input type="text" name="bookname" value="${book.bookName}" readonly>
							</div>
				
							<div class="input-feild">
							<label>Author Name</label>
							<input type="text" name="author" value="${book.author}" readonly>
							</div>
				
							<div class="input-feild">
							<label>Publisher</label>
							<input type="text" name="publisher" value="${book.publisher }" readonly>
							</div>
							
							<div class="input-feild">
								<label>Edition</label>
							<input type="text" name="edition" value="${book.edition}" readonly>
							</div>
							
							<div class="input-feild">
								<label>Rating</label>
							<input type="text" name="edition" value="${book.rate}" readonly>
							</div>
			
							<div class="input-feild">
								<label>Quantity</label>
							<input type="text" name="quantity" value="${book.availableQuantity}" placeholder="Enter the available Quantity of the book" 
								pattern="[0-9]*" required="required" class="inactive">
							</div>
			
							<div class="input-feild">
								<label>Price</label>
							<input type="text" name="price" value="${book.price }" placeholder="Enter the price of the book" 
								pattern="[0-9]*" required class="inactive">
							</div>
							
							<div class="input-feild">
								<label>Actual Price</label>
							<input type="text" name="actualPrice" value="${book.actualPrice }" placeholder="Enter the price of the book" 
								pattern="[0-9]*" required class="inactive">
							</div>
			
							<div class="input-feild">
								<label>MRP Rate</label>
							<input type="text" name="mrpRate" value="${book.mrp }" placeholder="Enter the MRP price of the book" 
								pattern="[0-9]*" required class="inactive">
							</div>

							<div class="submit">
								<input type="submit" name="Save" value="Save" onclick="disable(${book.bookId})">
							</div>
						</form>
					</div>
				</div>
			</c:forEach>
		</div>
	</main>
	<footer>
		<div class="logo">
			<img alt="logo" src="images/Mars.png" width="150px" height="100px">
		</div>
		<div>
			<ul>
				<li><em class="fa fa-phone"></em>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a
					href="tel:+6382639293">6382639293</a></li>
				<li><em class="fa fa-gmail">&#xf0e0;</em>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<a href="mailto:mars1234@gmail.com">mars1234@gmail.com</a>
			</ul>
		</div>

		<div class="addr">
			12A, Middle Street,<br>Golden City,<br>Madurai,<br>Tamil Nadu.
		</div>
	</footer>
	<script type="text/javascript" src="script/editbutton.js"></script>
	<script type="text/javascript">
	window.onscroll = function() {myFunction()};
	let navbar = document.getElementById("nav");
	let sticky = navbar.offsetTop;
	function myFunction() {
	  if (window.pageYOffset >= sticky) {
	    navbar.classList.add("sticky")
	  } else {
	    navbar.classList.remove("sticky");
	  }
	}
	</script>
</body>
</html>
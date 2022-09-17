<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta content="text/html; charset=utf-8" />
<title>Mars books</title>
<link rel="stylesheet" href="styles/user.css">
<link rel="stylesheet" href="styles/footer.css">
<script src='https://kit.fontawesome.com/a076d05399.js'></script>
</head>
<body>
	<jsp:include page="userheader.jsp"></jsp:include>
	<jsp:include page="usernavbar.jsp"></jsp:include>
	<main>
	
		<jsp:include page="slidebars.jsp"></jsp:include>
		<c:if test="${not empty books}">
		<div class="books-container">
			<c:forEach var="book" items="${books}" varStatus="loop">
				<div class="book-info">
						<div class="img">
							<img alt="${book.bookName }" src="data:image/jpg;base64,${book.imagesPath}" width="100%" height="270px">
							<h3>${book.bookName }</h3>
						</div>
						<div class="details">
							<h4>Rs.${book.actualPrice }</h4>
							<c:choose>
								<c:when test="${book.rate == 1 }">
									<div><span class="fa fa-star checked"></span></div>
								</c:when>
								<c:when test="${book.rate == 2 }">
									<div>
										<span class="fa fa-star checked"></span>
										<span class="fa fa-star checked"></span>
									</div>
								</c:when>
								<c:when test="${book.rate == 3 }">
									<div>
										<span class="fa fa-star checked"></span>
										<span class="fa fa-star checked"></span>
										<span class="fa fa-star checked"></span>
									</div>
								</c:when>
								<c:when test="${book.rate == 4 }">
									<div>
										<span class="fa fa-star checked"></span>
										<span class="fa fa-star checked"></span>
										<span class="fa fa-star checked"></span>
										<span class="fa fa-star checked"></span>
									</div>
								</c:when>
								<c:when test="${book.rate == 5 }">
									<div>
										<span class="fa fa-star checked"></span>
										<span class="fa fa-star checked"></span>
										<span class="fa fa-star checked"></span>
										<span class="fa fa-star checked"></span>
										<span class="fa fa-star checked"></span>
									</div>
								</c:when>
								
								<c:when test="${book.rate == 0 }">
									<div>
										<span class="fa fa-star"></span>
										<span class="fa fa-star"></span>
										<span class="fa fa-star"></span>
										<span class="fa fa-star"></span>
										<span class="fa fa-star"></span>
									</div>
								</c:when>
								
							</c:choose>
						</div>
						<div class="view-btn">
							<a href="/getBooks?id=${book.bookId }&cat=${book.category}"><button>View</button></a>
						</div>
					</div>
			</c:forEach>
		</div>
		</c:if>
		<h4 style="text-align: center;">${msg }</h4>
	</main>
	
	<jsp:include page="footer.jsp"></jsp:include>
	<script src="script/userpage.js"></script>
	<script type="text/javascript" src="script/profilemenu.js"></script>
</body>
</html>
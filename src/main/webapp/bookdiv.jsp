<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<div class="books-container">
			<c:forEach var="book" items="${topBooks}" varStatus="loop">
				<c:if test = "${loop.index < 4}">
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
								
							</c:choose>
							</div>
							<div class="view-btn">
								<a href="/getBooks?id=${book.bookId }&cat=${book.category}"><button>View</button></a>
							</div>
						</div> 
				</c:if>
			</c:forEach>
		</div>
	</div>
</body>
</html>
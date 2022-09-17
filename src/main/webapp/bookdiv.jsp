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
	<div class="book-info">
		<div class="img">
			<img alt="${param.bookName }"
				src="data:image/jpg;base64,${param.bookImage}" width="100%"
				height="270px">
			<h3>${param.bookName }</h3>
		</div>
		<div class="details">
			<h4>Rs.${param.actualPrice }</h4>
			<c:choose>
				<c:when test="${param.rate == 1 }">
					<div>
						<span class="fa fa-star checked"></span>
					</div>
				</c:when>
				<c:when test="${param.rate == 2 }">
					<div>
						<span class="fa fa-star checked"></span> <span
							class="fa fa-star checked"></span>
					</div>
				</c:when>
				<c:when test="${param.rate == 3 }">
					<div>
						<span class="fa fa-star checked"></span> <span
							class="fa fa-star checked"></span> <span
							class="fa fa-star checked"></span>
					</div>
				</c:when>
				<c:when test="${param.rate == 4 }">
					<div>
						<span class="fa fa-star checked"></span> <span
							class="fa fa-star checked"></span> <span
							class="fa fa-star checked"></span> <span
							class="fa fa-star checked"></span>
					</div>
				</c:when>
				<c:when test="${param.rate == 5 }">
					<div>
						<span class="fa fa-star checked"></span> <span
							class="fa fa-star checked"></span> <span
							class="fa fa-star checked"></span> <span
							class="fa fa-star checked"></span> <span
							class="fa fa-star checked"></span>
					</div>
				</c:when>

			</c:choose>
		</div>
		<div class="view-btn">
			<a href="/getBooks?id=${param.bookId }&cat=${param.category}"><button>View</button></a>
		</div>
	</div>

</body>
</html>
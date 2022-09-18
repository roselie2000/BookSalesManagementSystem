<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta content="text/html; charset=utf-8" />
<title>Order History</title>
<script src='https://kit.fontawesome.com/a076d05399.js'></script>
<link rel="stylesheet" href="styles/navbar.css">
<link rel="stylesheet" href="styles/footer.css">
<link rel="stylesheet" href="styles/history.css">
<link rel="stylesheet" href="styles/views.css">

</head>
<body>
	<jsp:include page="userheader.jsp"></jsp:include>
	<jsp:include page="usernavbar.jsp"></jsp:include>

	<main>
		<c:if test="${not empty orderHistory }">
			<c:forEach var="orders" items="${orderHistory}" varStatus="loop">
				<div class="viewed-book">
					<div class="imgdiv">
						<img alt="book cover page"
							src="data:image/jpg;base64,${orders.imagesPath}">
					</div>
					<div>
						<div class="container">
							<div class="head">
								<div class="topics">
									<h1>
										<em>${book.bookName }</em>
									</h1>
								</div>

								<div class="order-info">
									<label>Ordered Date</label>
									<div>${orders.orderDate }</div>
									<label>Status</label>
									<div>${orders.status }</div>
									<label>Quantity</label>
									<div>${orders.quantity }</div>
								</div>

								<div class="price-container">
									<div>
										<h2>
											<span><em>Rs.</em></span>${orders.totalPrice }</h2>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</c:forEach>
		</c:if>
		<c:if test="${empty orderHistory }">
			<h2>No history</h2>
		</c:if>
	</main>
	<script src="script/userpage.js"></script>
	<script type="text/javascript" src="script/profilemenu.js"></script>
</body>
</html>
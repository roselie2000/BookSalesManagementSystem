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
</head>
<body>
<jsp:include page="userheader.jsp"></jsp:include>
<jsp:include page="usernavbar.jsp"></jsp:include>
	
	<main>
		<c:if test="${not empty orderHistory }">
			<c:forEach var="orders" items="${orderHistory}" varStatus="loop">
				<div class="orders">
					<div class="order-history">
					<div class="img">
						<img alt="${orders.bookName }" src="data:image/jpg;base64,${orders.imagesPath}" width="100%" height="270px">
					</div>
					<div class="order-info">
						<label class="bookname">${orders.bookName }</label>
						<div class="info"><label>Quantity</label><label>${orders.quantity }</label></div>
					</div>
				</div>
				<div class="order-details">
					<label>Total Price </label>
					<div>${orders.totalPrice }</div>
					<label>Ordered Date</label>
					<div>${orders.orderDate }</div>
					<label>Status</label>
					<div>${orders.status }</div>
				</div>		
				</div>	
			</c:forEach>
		</c:if>
	</main>
	<script type="text/javascript" src="script/profilemenu.js"></script>
</body>
</html>
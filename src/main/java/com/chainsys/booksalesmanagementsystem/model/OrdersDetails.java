package com.chainsys.booksalesmanagementsystem.model;

import java.sql.Date;

public class OrdersDetails {

	Orders order = new Orders();
	private String emailId;
	private String phoneno;
	private String orderedAddress;
	
	public int getCartId() {
		 return order.getCartId();
	}

	public void setCartId(int cartId) {
		order.setCartId(cartId);
	}

	public int getOrderId() {
		return order.getOrderId();
	}

	public void setOrderId(int orderId) {
		order.setOrderId(orderId);
	}

	public String getBookId() {
		return order.getBookId();
	}

	public void setBookId(String bookId) {
		order.setBookId(bookId);
	}

	public String getUserName() {
		return order.getUserName();
	}

	public void setUserName(String userName) {
		order.setUserName(userName);
	}

	public Date getOrderDate() {
		return order.getOrderDate();
	}

	public void setOrderDate(Date orderDate) {
		order.setOrderDate(orderDate);
	}

	public int getQuantity() {
		return order.getQuantity();
	}

	public void setQuantity(int quantity) {
		order.setQuantity(quantity);
	}

	public int getTotalPrice() {
		return order.getTotalPrice();
	}

	public void setTotalPrice(int totalPrice) {
		order.setTotalPrice(totalPrice);
	}
	
	public String getStatus() {
		return order.getStatus();
	}

	public void setStatus(String status) {
		order.setStatus(status);
	}

	public String getEmailId() {
		return emailId;
	}

	public void setEmailId(String emailId) {
		this.emailId = emailId;
	}

	public String getPhoneno() {
		return phoneno;
	}

	public void setPhoneno(String phoneno) {
		this.phoneno = phoneno;
	}

	public String getOrderedAddress() {
		return orderedAddress;
	}

	public void setOrderedAddress(String orderedAddress) {
		this.orderedAddress = orderedAddress;
	}

	

}

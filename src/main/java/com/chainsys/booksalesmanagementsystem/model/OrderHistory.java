package com.chainsys.booksalesmanagementsystem.model;

import java.sql.Date;

public class OrderHistory {

	Orders order = new Orders();
	private String bookName;
	private int actualPrice;
	private byte[] bookImage;
	private String imagesPath;

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


	public String getBookName() {
		return bookName;
	}

	public void setBookName(String bookName) {
		this.bookName = bookName;
	}

	public int getActualPrice() {
		return actualPrice;
	}

	public void setActualPrice(int actualPrice) {
		this.actualPrice = actualPrice;
	}

	public byte[] getBookImage() {
		return bookImage;
	}

	public void setBookImage(byte[] bookImage) {
		this.bookImage = bookImage;
	}

	public String getImagesPath() {
		return imagesPath;
	}

	public void setImagesPath(String imagesPath) {
		this.imagesPath = imagesPath;
	}

}

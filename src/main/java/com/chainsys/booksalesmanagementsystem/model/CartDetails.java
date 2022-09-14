package com.chainsys.booksalesmanagementsystem.model;

public class CartDetails {

	private int cartId;
	private int cartQuantity;
	private String bookId;
	private String bookName;
	private String authors;
	private String publishers;
	private int edition;
	private String category;
	private int price;
	private int availableQuantity;
	private byte[] bookImage;
	private String bookImages;

	public int getCartId() {
		return cartId;
	}

	public void setCartId(int cartId) {
		this.cartId = cartId;
	}

	public int getCartQuantity() {
		return cartQuantity;
	}

	public void setCartQuantity(int cartQuantity) {
		this.cartQuantity = cartQuantity;
	}

	public String getBookId() {
		return bookId;
	}

	public void setBookId(String bookId) {
		this.bookId = bookId;
	}

	public String getBookName() {
		return bookName;
	}

	public void setBookName(String bookName) {
		this.bookName = bookName;
	}

	public String getAuthors() {
		return authors;
	}

	public void setAuthors(String authors) {
		this.authors = authors;
	}

	public String getPublishers() {
		return publishers;
	}

	public void setPublishers(String publishers) {
		this.publishers = publishers;
	}

	public int getEdition() {
		return edition;
	}

	public void setEdition(int edition) {
		this.edition = edition;
	}

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}
	
	public String getBkImages() {
		return bookImages;
	}

	public void setBkImages(String bookImages) {
		this.bookImages = bookImages;
	}

	public byte[] getBookImage() {
		return bookImage;
	}

	public void setBookImage(byte[] bookImage) {
		this.bookImage = bookImage;
	}

	public int getAvailableQuantity() {
		return availableQuantity;
	}

	public void setAvailableQuantity(int availableQuantity) {
		this.availableQuantity = availableQuantity;
	}

	public String getBookImages() {
		return bookImages;
	}

	public void setBookImages(String bookImages) {
		this.bookImages = bookImages;
	}

}

package com.chainsys.booksalesmanagementsystem.mapper;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Base64;

import org.springframework.jdbc.core.RowMapper;

import com.chainsys.booksalesmanagementsystem.model.CartDetails;

public class CartDetailsMapper implements RowMapper<CartDetails>{

	@Override
	public CartDetails mapRow(ResultSet rs, int rowNum) throws SQLException {
		int cartId = rs.getInt("cartid");
		String bookId = rs.getString("booksid");
		String bookName = rs.getString("booksname");
		int quantity = rs.getInt("quantity");
		int price = rs.getInt("price");
		String author = rs.getString("authors");
		String publisher = rs.getString("publishers");
		int edition = rs.getInt("edition");
		String category = rs.getString("category");
		int availableQuantity = rs.getInt("avl_quantity");
		int bookPrice = rs.getInt("act_rate");
		byte[] bookImage = rs.getBytes("book_image");
		String base64Image = Base64.getEncoder().encodeToString(bookImage);
		
		CartDetails cartDetails = new CartDetails();
		cartDetails.setCartId(cartId);
		cartDetails.setBookId(bookId);
		cartDetails.setBookName(bookName);
		cartDetails.setCartQuantity(quantity);
		cartDetails.setPrice(price);
		cartDetails.setAuthors(author);
		cartDetails.setPublishers(publisher);
		cartDetails.setEdition(edition);
		cartDetails.setCategory(category);
		cartDetails.setAvailableQuantity(availableQuantity);
		cartDetails.setBookPrice(bookPrice);
		cartDetails.setBookImage(bookImage);
		cartDetails.setBookImages(base64Image);
		return cartDetails;
	}

	
}

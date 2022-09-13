package com.chainsys.booksalesmanagementsystem.mapper;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Base64;

import org.springframework.jdbc.core.RowMapper;

import com.chainsys.booksalesmanagementsystem.model.CartDetails;

public class CartMapper implements RowMapper<CartDetails>{

	@Override
	public CartDetails mapRow(ResultSet rs, int rowNum) throws SQLException {
		int cartId = rs.getInt(1);
		String bookId = rs.getString(2);
		String bookName = rs.getString(3);
		String author = rs.getString(4);
		String publisher = rs.getString(5);
		int edition = rs.getInt(6);
		String category = rs.getString(7);
		int actPrice = rs.getInt(8);
		byte[] images = rs.getBytes("book_image");
		String img = Base64.getEncoder().encodeToString(images);
		
		CartDetails cart = new CartDetails();
		cart.setCartId(cartId);
		cart.setBookId(bookId);
		cart.setBookName(bookName);
		cart.setAuthors(author);
		cart.setPublishers(publisher);
		cart.setEdition(edition);
		cart.setCategory(category);
		cart.setPrice(actPrice);
		cart.setBookImage(images);
		cart.setBkImages(img);
		return cart;
	}

	
}

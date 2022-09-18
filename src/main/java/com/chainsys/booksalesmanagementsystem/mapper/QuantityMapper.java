package com.chainsys.booksalesmanagementsystem.mapper;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

import com.chainsys.booksalesmanagementsystem.model.Cart;

public class QuantityMapper implements RowMapper<Cart> {

	@Override
	public Cart mapRow(ResultSet rs, int rowNum) throws SQLException {
		String bookId = rs.getString("booksid");
		int qunatity = rs.getInt("quantity");
		
		Cart cart = new Cart();
		cart.setBookId(bookId);
		cart.setQuantity(qunatity);
		return cart;
	}

}

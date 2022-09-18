package com.chainsys.booksalesmanagementsystem.mapper;

import java.sql.Date;
import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

import com.chainsys.booksalesmanagementsystem.model.Cart;

public class CartMapper implements RowMapper<Cart>{

	@Override
	public Cart mapRow(ResultSet rs, int rowNum) throws SQLException {
		
		int cartId = rs.getInt("cardid");
		String userName = rs.getString("username");
		String bookId = rs.getString("booksid");
		int quantity = rs.getInt("quantity");
		int price = rs.getInt("price");
		int orderId = rs.getInt("orderid");
		String status = rs.getString("status");
		Date date = rs.getDate("ordereddate");
		String address = rs.getString("orderedaddress");
		
		Cart cart = new Cart();
		cart.setCartId(cartId);
		cart.setUserName(userName);
		cart.setBookId(bookId);
		cart.setQuantity(quantity);
		cart.setPrice(price);
		cart.setOrderId(orderId);
		cart.setStatus(status);
		cart.setOrderedDate(date);
		cart.setAddress(address);
		return cart;
	}

	

}

package com.chainsys.booksalesmanagementsystem.mapper;

import java.sql.Date;
import java.sql.ResultSet;
import java.sql.SQLException;


import org.springframework.jdbc.core.RowMapper;

import com.chainsys.booksalesmanagementsystem.model.OrdersDetails;

public class OrderMapper implements RowMapper<OrdersDetails>{

	@Override
	public OrdersDetails mapRow(ResultSet rs, int rowNum) throws SQLException {
		
		int cartId = rs.getInt("cartid");
		String usname = rs.getString("username");
		String bookId = rs.getString("booksid");
		int qty = rs.getInt("quantity");
		int price = rs.getInt("price");
		int orderId = rs.getInt("orderid");
		Date orderDate = rs.getDate("ordereddate");
		String status = rs.getString("status");
		String address = rs.getString("orderedaddress");
		String email = rs.getString("emailid");
		String phoneno = rs.getString("phoneno");
		
		OrdersDetails oderDetails = new OrdersDetails();
		oderDetails.setCartId(cartId);
		oderDetails.setOrderId(orderId);
		oderDetails.setBookId(bookId);
		oderDetails.setUserName(usname);
		oderDetails.setOrderDate(orderDate);
		oderDetails.setQuantity(qty);
		oderDetails.setTotalPrice(price);
		oderDetails.setOrderedAddress(address);
		oderDetails.setStatus(status);
		oderDetails.setEmailId(email);
		oderDetails.setPhoneno(phoneno);
		return oderDetails;
	}

	
}

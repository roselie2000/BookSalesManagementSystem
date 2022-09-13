package com.chainsys.booksalesmanagementsystem.mapper;

import java.sql.Date;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Base64;

import org.springframework.jdbc.core.RowMapper;

import com.chainsys.booksalesmanagementsystem.model.OrderHistory;

public class OrderHistoryMapper implements RowMapper<OrderHistory>{

	@Override
	public OrderHistory mapRow(ResultSet rs, int rowNum) throws SQLException {
		int orderId = rs.getInt(1);
		String bookId = rs.getString(2);
		String username = rs.getString(3);
		Date orderedDate = rs.getDate(4);
		int quantity = rs.getInt(5);
		int totalPrice = rs.getInt(6);
		int advanceAmount = rs.getInt(7);
		String status = rs.getString(8);
		String bookName = rs.getString(9);
		int actualPrice = rs.getInt(10);
		byte[] images = rs.getBytes("book_image");
		String base64Image = Base64.getEncoder().encodeToString(images);
		
		OrderHistory orderHistory = new OrderHistory();
		orderHistory.setOrderId(orderId);
		orderHistory.setBookId(bookId);
		orderHistory.setUserName(username);
		orderHistory.setOrderDate(orderedDate);
		orderHistory.setQuantity(quantity);
		orderHistory.setTotalPrice(totalPrice);
		orderHistory.setAdvanceAmount(advanceAmount);
		orderHistory.setStatus(status);
		orderHistory.setBookName(bookName);
		orderHistory.setActualPrice(actualPrice);
		orderHistory.setBookImage(images);
		orderHistory.setImagesPath(base64Image);
		return orderHistory;
	}

	
}

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
		int orderId = rs.getInt("orderid");
		String bookId = rs.getString("booksid");
		String userName = rs.getString("username");
		Date orderedDate = rs.getDate("ordereddate");
		int quantity = rs.getInt("quantity");
		int price = rs.getInt("price");
		String status = rs.getString("status");
		String bookName = rs.getString("booksname");
		byte[] images = rs.getBytes("book_image");
		String base64Image = Base64.getEncoder().encodeToString(images);
		
		OrderHistory orderHistory = new OrderHistory();
		orderHistory.setOrderId(orderId);
		orderHistory.setBookId(bookId);
		orderHistory.setUserName(userName);
		orderHistory.setOrderDate(orderedDate);
		orderHistory.setQuantity(quantity);
		orderHistory.setTotalPrice(price);
		orderHistory.setStatus(status);
		orderHistory.setBookName(bookName);
		orderHistory.setBookImage(images);
		orderHistory.setImagesPath(base64Image);
		return orderHistory;
	}

	
}

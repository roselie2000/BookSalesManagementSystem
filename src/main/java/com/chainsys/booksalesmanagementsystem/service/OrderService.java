package com.chainsys.booksalesmanagementsystem.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.chainsys.booksalesmanagementsystem.dao.BookDao;
import com.chainsys.booksalesmanagementsystem.dao.OrderDao;
import com.chainsys.booksalesmanagementsystem.model.OrderHistory;
import com.chainsys.booksalesmanagementsystem.model.OrdersDetails;
import com.chainsys.booksalesmanagementsystem.model.Rating;

@Service
public class OrderService {

	@Autowired
	OrderDao orderDao;
	
	@Autowired
	BookDao bookDao;
	
	public boolean addOrder(OrdersDetails orderDetails) {
		int noOfRowAffected = orderDao.addOrder(orderDetails);
		if(noOfRowAffected > 0) {
			int availableQuantity = bookDao.getQuantityById(orderDetails.getBookId());
			int remainingQuantity = availableQuantity - orderDetails.getQuantity();
			bookDao.updateQuantity(remainingQuantity, orderDetails.getBookId());
			return true;
		}
		else {
			return false;
		}
	}
	
	public boolean cancelOrder(int orderId, String Status) {
		int noOfRowsAffected = orderDao.updateOrder(orderId, Status);
		if(noOfRowsAffected > 0) {
			return true;
		}
		else {
			return false;
		}
	}
	
	public boolean addRating(Rating rating) {
		int noOfRowsAffected1 = orderDao.addRating(rating);
		if(noOfRowsAffected1 > 0) {
			String bookId = rating.getBookId();
			int rate = orderDao.getSumOfRating(bookId) / orderDao.getNumberOfREviewers(bookId);
			int noOfRowsAffected2 = orderDao.updateBookRating(bookId, rate);
			if(noOfRowsAffected2 > 0) {
				return true;
			}
			else {
				return false;
			}
		}
		else {
			return false;
		}
	}
	
	public List<OrderHistory> getOrderById(String userName){
		return orderDao.getOrdersById(userName);
	}
	
}

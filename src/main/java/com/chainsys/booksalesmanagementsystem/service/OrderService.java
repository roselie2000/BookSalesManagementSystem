package com.chainsys.booksalesmanagementsystem.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.chainsys.booksalesmanagementsystem.dao.BookDao;
import com.chainsys.booksalesmanagementsystem.dao.OrderDao;
import com.chainsys.booksalesmanagementsystem.model.Cart;
import com.chainsys.booksalesmanagementsystem.model.CartDetails;
import com.chainsys.booksalesmanagementsystem.model.OrderHistory;
import com.chainsys.booksalesmanagementsystem.model.OrdersDetails;
import com.chainsys.booksalesmanagementsystem.model.Rating;

@Service
public class OrderService {

	@Autowired
	OrderDao orderDao;
	
	@Autowired
	BookDao bookDao;
	
//	public boolean cancelOrder(int orderId, String Status) {
//		int noOfRowsAffected = orderDao.updateOrders(orderId, Status);
//		if(noOfRowsAffected > 0) {
//			return true;
//		}
//		else {
//			return false;
//		}
//	}
	
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
	
	public boolean updateCart(int cartId, int quantity, int price) {
		int noOfRowsAffected = orderDao.updateCart(cartId, quantity, price);
		if(noOfRowsAffected > 0) {
			return true;
		}
		else {
			return false;
		}
	}
	
	

	public boolean addOrders(Cart cart) {
		int noOfRowsAffected = orderDao.addOrder(cart);
		int quantity = cart.getQuantity();
		String bookId = cart.getBookId();
		if(noOfRowsAffected > 0) {
			bookDao.updateQuantity(quantity, bookId);
			return true;
		}
		else {
			return false;
		}
		
	}
	
	public List<CartDetails> getCart(String userName, String status){
		return orderDao.getCart(userName, userName);
	}

	public boolean updateCartStatus(Cart cart) {
		String userName = cart.getUserName();
		List<Cart> QuantityList = orderDao.getQunatityFromCart(userName);
		System.out.println(QuantityList.get(0).getBookId());
		int noOfRowsafected = orderDao.updateCartStatus(cart);
		if(noOfRowsafected >0) {
			for(int i=0; i<QuantityList.size(); i++) {
				String bookId = QuantityList.get(i).getBookId();
				int quantity = QuantityList.get(i).getQuantity();
				System.out.println(bookId);
				bookDao.updateQuantity(quantity, bookId);
			}
			return true;
		}
		else {
			return false;
		}
		
	}
}

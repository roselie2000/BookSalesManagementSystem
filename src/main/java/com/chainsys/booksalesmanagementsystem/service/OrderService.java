package com.chainsys.booksalesmanagementsystem.service;

import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.chainsys.booksalesmanagementsystem.dao.BookDao;
import com.chainsys.booksalesmanagementsystem.dao.OrderDao;
import com.chainsys.booksalesmanagementsystem.exception.InternalException;
import com.chainsys.booksalesmanagementsystem.exception.UpdateRatingException;
import com.chainsys.booksalesmanagementsystem.model.Cart;
import com.chainsys.booksalesmanagementsystem.model.CartDetails;
import com.chainsys.booksalesmanagementsystem.model.OrderHistory;
import com.chainsys.booksalesmanagementsystem.model.Rating;

@Service
public class OrderService {

	@Autowired
	OrderDao orderDao;
	
	@Autowired
	BookDao bookDao;
	
	public boolean addRating(Rating rating) throws InternalException, UpdateRatingException, SQLException {
		int noOfRowsAffected1 = orderDao.addRating(rating);
		if(noOfRowsAffected1 > 0) {
			String bookId = rating.getBookId();
			int rate = orderDao.getSumOfRating(bookId) / orderDao.getNumberOfREviewers(bookId);
			int noOfRowsAffected2 = orderDao.updateBookRating(bookId, rate);
			if(noOfRowsAffected2 > 0) {
				return true;
			}
			else {
				throw new UpdateRatingException();
			}
		}
		else {
			throw new InternalException();
		}
	}
	
	public List<OrderHistory> getOrderById(String userName) throws SQLException{
		return orderDao.getOrdersById(userName);
	}
	
	public boolean updateCart(int cartId, int quantity, int price) throws SQLException {
		int noOfRowsAffected = orderDao.updateCart(cartId, quantity, price);
		if(noOfRowsAffected > 0) {
			return true;
		}
		else {
			return false;
		}
	}
	
	

	public boolean addOrders(Cart cart) throws SQLException {
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
	
	public List<CartDetails> getCart(String userName, String status) throws SQLException{
		return orderDao.getCart(userName, userName);
	}

	public boolean updateCartStatus(Cart cart) throws SQLException {
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

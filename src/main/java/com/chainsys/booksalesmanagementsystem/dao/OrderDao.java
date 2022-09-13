package com.chainsys.booksalesmanagementsystem.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.chainsys.booksalesmanagementsystem.mapper.CartMapper;
import com.chainsys.booksalesmanagementsystem.mapper.OrderHistoryMapper;
import com.chainsys.booksalesmanagementsystem.model.Cart;
import com.chainsys.booksalesmanagementsystem.model.CartDetails;
import com.chainsys.booksalesmanagementsystem.model.OrderHistory;
import com.chainsys.booksalesmanagementsystem.model.OrdersDetails;
import com.chainsys.booksalesmanagementsystem.model.Rating;

@Repository
public class OrderDao {

	@Autowired
	JdbcTemplate jdbcTemplate;
	
	public int addcart(Cart cart) {
		String insertCart = "INSERT INTO cartdetails(cart_id, username, booksid)values(cardId.nextval, ?, ?)";
		// create the object for execute the query
		Object[] cartData = {cart.getUserName(), cart.getBookId()};
		int noOfRowsAffected = jdbcTemplate.update(insertCart, cartData);// execute the query
		return noOfRowsAffected;
	}
	
	public List<CartDetails> getCart(String userName){
		String selectCartList = "select ct.cart_id, bk.booksid, bk.booksname, bk.authors, bk.publishers, bk.edition, bk.category, "
				+ "bk.act_rate, bk.book_image from cartdetails ct "
				+ "inner join bookdetails bk on ct.booksid = bk.booksid WHERE ct.username = ?";
		List<CartDetails> cartList = null;
		try {
			cartList = jdbcTemplate.query(selectCartList, new CartMapper(), userName);
			return cartList;
		}catch (Exception e) {
			return cartList;
		}
		
	}
	
	public int deleteCart(int cartId) {
		String deleteCart = "DELETE FROM cartdetails WHERE cart_id = ?";
		try {
			int noOfRowsAffected = jdbcTemplate.update(deleteCart, cartId);
			return noOfRowsAffected;
		}catch (Exception e) {
			return 0;
		}
		
	}
	
	public int addOrder(OrdersDetails order) {
		String insertOrder = "insert into orderhistory(orderid, booksid, username, orderdate, quantity, totalprice, advanceamt, status)"
				+ "values(orderId.nextval, ?, ?, ?, ?, ?, ?, ?)";
		try {
			Object[] orderData = {order.getBookId(), order.getUserName(), order.getOrderDate(), order.getQuantity(), order.getTotalPrice(), 
					order.getAdvanceAmount(), order.getStatus()};
			int noOfRowsAffected = jdbcTemplate.update(insertOrder, orderData);
			return noOfRowsAffected;
		}catch (Exception e) {
			e.printStackTrace();
		}
		return 0;
	}
	
	public int updateOrder(int orderId, String status) {
		String updateOrder = "update orderhistory set status = ? where orderId = ?";
		try {
			int noOfRowsAffected = jdbcTemplate.update(updateOrder, orderId, status);
			return noOfRowsAffected;
		}catch (Exception e) {
			return 0;
		}		
	}
	
	public int getNumberOfREviewers(String bookId) {
		String getReviewerCount = "Select count(username)From bookreviews Where bookid = ? Group by bookid";
		try {
			int reviewerCount = jdbcTemplate.queryForObject(getReviewerCount, int.class, bookId);
			return reviewerCount;
		}catch (Exception e) {
			e.printStackTrace();
		}
		return 0;
	}
	
	public int getSumOfRating(String bookId) {
		String sumRatings = "select sum(rating) from bookreviews where bookid = ?";
		try {
			int sumOfRating = jdbcTemplate.queryForObject(sumRatings, int.class, bookId);
			return sumOfRating;
			
		}catch (Exception e) {
			e.printStackTrace();
		}
		return 0;
	}
	
	public int updateBookRating(String bookId, int rating) {
		String updateRating = "update bookdetails SET rating = ? where booksid = ?";
		try {
			int noOfRowsAffected = jdbcTemplate.update(updateRating, rating, bookId);
			return noOfRowsAffected;
		}catch (Exception e) {
			return 0;
		}
	}
	
	public int addRating(Rating rating) {
		String insertRating = "insert into bookreviews(bookid, username, review, rating)values(?, ?, ?, ?)";
		Object[] ratingInfo = {rating.getBookId(), rating.getUserName(), rating.getReview(), rating.getRating()};
		try {
			int noOfRowsAffected = jdbcTemplate.update(insertRating, ratingInfo);
			return noOfRowsAffected;
		}catch (Exception e) {
			e.printStackTrace();
		}
		return 0;
	}
	
	public List<OrderHistory> getOrdersById(String userName){
		String selectOrders = "select od.orderid, od.booksid, od.username, od.orderdate, od.quantity, od.totalprice, od.advanceamt, od.status,"
				+ "bk.booksname, bk.act_rate, bk.book_image from orderhistory od inner join bookdetails bk on od.booksid = bk.booksid "
				+ "WHERE od.username = ?";
		List<OrderHistory> orderList = null;
		try {
			orderList = jdbcTemplate.query(selectOrders, new OrderHistoryMapper(), userName);
			return orderList;
		}catch (Exception e) {
			return orderList;
		}
	}
}

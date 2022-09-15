package com.chainsys.booksalesmanagementsystem.dao;

import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.chainsys.booksalesmanagementsystem.mapper.CartDetailsMapper;
import com.chainsys.booksalesmanagementsystem.mapper.OrderHistoryMapper;
import com.chainsys.booksalesmanagementsystem.mapper.CartMapper;
import com.chainsys.booksalesmanagementsystem.model.Cart;
import com.chainsys.booksalesmanagementsystem.model.CartDetails;
import com.chainsys.booksalesmanagementsystem.model.OrderHistory;
import com.chainsys.booksalesmanagementsystem.model.OrdersDetails;
import com.chainsys.booksalesmanagementsystem.model.Rating;

@Repository
public class OrderDao {

	@Autowired
	JdbcTemplate jdbcTemplate;

	public int getOrderId() throws SQLException {
		String sqlIdentifier = "select ordersId.NEXTVAL from dual";
		int orderId = jdbcTemplate.queryForObject(sqlIdentifier, int.class);
		return orderId;
	}

	public int addcart(Cart cart) throws SQLException {
		String insertCart = "INSERT INTO orders(cartid, username, booksid, quantity, price, status)values(cardId.nextval, ?, ?, ?, ?, ?)";
		// create the object for execute the query
		Object[] cartData = { cart.getUserName(), cart.getBookId(), cart.getQuantity(), cart.getPrice(),
				cart.getStatus() };
		int noOfRowsAffected = jdbcTemplate.update(insertCart, cartData);// execute the query
		return noOfRowsAffected;
	}

	public List<CartDetails> getCart(String userName, String status) throws SQLException {
		String selectCartList = "select od.cartid, od.booksid, od.quantity, od.price, bk.booksName, bk.authors, bk.publishers, bk.edition, bk.category,\r\n"
				+ "bk.book_image, bk.avl_quantity, bk.act_rate from orders od "
				+ "inner join bookdetails bk on od.booksid = bk.booksid where od.username = ? and od.status = 'Add to Cart'";
		List<CartDetails> cartList = null;
		cartList = jdbcTemplate.query(selectCartList, new CartDetailsMapper(), userName);
		return cartList;
	}

	public int deleteCart(int cartId) throws SQLException {
		String deleteCart = "DELETE FROM orders WHERE cartid = ?";
		int noOfRowsAffected = jdbcTemplate.update(deleteCart, cartId);
		return noOfRowsAffected;
	}

	public int getNumberOfREviewers(String bookId) throws SQLException {
		String getReviewerCount = "Select count(username)From bookreviews Where bookid = ? Group by bookid";
		int reviewerCount = jdbcTemplate.queryForObject(getReviewerCount, int.class, bookId);
		return reviewerCount;
	}

	public int getSumOfRating(String bookId) throws SQLException {
		String sumRatings = "select sum(rating) from bookreviews where bookid = ?";
		int sumOfRating = jdbcTemplate.queryForObject(sumRatings, int.class, bookId);
		return sumOfRating;
	}

	public int updateBookRating(String bookId, int rating) throws SQLException {
		String updateRating = "update bookdetails SET rating = ? where booksid = ?";
		int noOfRowsAffected = jdbcTemplate.update(updateRating, rating, bookId);
		return noOfRowsAffected;
	}

	public int addRating(Rating rating) throws SQLException {
		String insertRating = "insert into bookreviews(bookid, username, review, rating)values(?, ?, ?, ?)";
		Object[] ratingInfo = { rating.getBookId(), rating.getUserName(), rating.getReview(), rating.getRating() };
		int noOfRowsAffected = jdbcTemplate.update(insertRating, ratingInfo);
		return noOfRowsAffected;
	}

	public List<OrderHistory> getOrdersById(String userName) throws SQLException {
		String selectOrders = "select od.orderid, od.booksid, od.username, od.ordereddate, od.quantity, od.price, od.status,"
				+ "bk.booksname, bk.book_image from orders od inner join bookdetails bk on od.booksid = bk.booksid "
				+ "WHERE od.username = ?";
		List<OrderHistory> orderList = null;
		orderList = jdbcTemplate.query(selectOrders, new OrderHistoryMapper(), userName);
		return orderList;
	}

	public int updateCart(int cartId, int quantity, int price) throws SQLException {
		String updateCart = "update orders SET quantity = ?, price = ? where cartid = ?";
		Object[] values = { quantity, price, cartId };
		int noOfRowsAffected = jdbcTemplate.update(updateCart, values);
		return noOfRowsAffected;
	}

	public int addOrder(Cart cart) throws SQLException {
		String insertOrder = "insert into orders(cartid, username, booksid, quantity, price, orderid, "
				+ "ordereddate, status, orderedaddress)values(cardId.nextval, ?, ?, ?, ?, ?, ?, ?, ?)";
		int orderId = getOrderId();
		Object[] cartValues = { cart.getUserName(), cart.getBookId(), cart.getQuantity(), cart.getPrice(), orderId,
				cart.getOrderedDate(), cart.getStatus(), cart.getAddress() };
		try {
			int noOfRowsAffected1 = jdbcTemplate.update(insertOrder, cartValues);
			return noOfRowsAffected1;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return 0;
	}

	public int updateCartStatus(Cart cart) throws SQLException {
		String updateCartStatus = "update orders set orderid = ?, ordereddate = ?,"
				+ "status = ?, orderedaddress = ? where username = ? and status = 'Add to Cart'";
		int orderId = getOrderId();
		Object[] cartValues = { orderId, cart.getOrderedDate(), cart.getStatus(), cart.getAddress(),
				cart.getUserName() };
		int noOfRowsAffected = jdbcTemplate.update(updateCartStatus, cartValues);
		return noOfRowsAffected;
	}

	public List<Cart> getQunatityFromCart(String userName) throws SQLException {
		String selectQuantity = "select booksid, quantity from orders where username = ? and status = 'Add to Cart'";
		List<Cart> QuantityList = null;
		QuantityList = jdbcTemplate.query(selectQuantity, new CartMapper(), userName);
		return QuantityList;
	}
}

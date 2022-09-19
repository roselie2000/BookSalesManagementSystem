package com.chainsys.booksalesmanagementsystem.service;

import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.chainsys.booksalesmanagementsystem.dao.BookDao;
import com.chainsys.booksalesmanagementsystem.dao.OrderDao;
import com.chainsys.booksalesmanagementsystem.dao.UserDao;
import com.chainsys.booksalesmanagementsystem.exception.DataAddedException;
import com.chainsys.booksalesmanagementsystem.exception.DataDeletedException;
import com.chainsys.booksalesmanagementsystem.model.Books;
import com.chainsys.booksalesmanagementsystem.model.Cart;
import com.chainsys.booksalesmanagementsystem.model.CartDetails;
import com.chainsys.booksalesmanagementsystem.model.Users;

@Service

public class UserService {

	@Autowired
	BookDao bookDao;
	
	@Autowired
	OrderDao orderDao;
	
	@Autowired
	UserDao userDao;
	
	public List<Books> getTopBooks() throws SQLException{
		return bookDao.getTopSaledBooks();
	}
	
	public List<Books> getBooks() throws SQLException{
		return bookDao.getBookList();
	}

	public Books getBookById(String bookId) {
		return bookDao.getBookById(bookId);
	}
	
	public List<Books> getBookBycategory(String category) throws SQLException{
		return bookDao.getBookByCategory(category);
	}

	public boolean addToCart(Cart cart) throws SQLException, DataAddedException {
		int noOfRowsAffected = orderDao.addcart(cart);
		if(noOfRowsAffected > 0) {
			return true;
		}
		else {
			throw new DataAddedException();
		}
	}
	
	public List<CartDetails> getCart(String username, String status) throws SQLException{
		return orderDao.getCart(username, status);
	}
	
	public boolean deleteCart(int cartId) throws SQLException, DataDeletedException {
		int noOfRowsAffected = orderDao.deleteCart(cartId);
		if(noOfRowsAffected > 0) {
			return true;
		}
		else {
			throw new DataDeletedException();
		}
	}
	
	public boolean updatePassword(String username, String password) {
		if(!userDao.checkUserNameAvail(username)) {
			int noOfRowsAffected = userDao.updatePassword(username, password);
			if(noOfRowsAffected > 0) {
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
	
	public List<Books> searchBooks(String keyword) throws SQLException {
		return bookDao.searchBooks(keyword);
	}
	
	public List<Books> getBooksByLanguage(String language) throws SQLException{
		return bookDao.getBookByLanguage(language);
	}
	
	public List<Books> getBooksByPrice(int fromRate, int toRate) throws SQLException{
		return bookDao.getBookByPrice(fromRate, toRate);
	}
	
	public List<Books> getBooksByAuthor(String author) throws SQLException{
		return bookDao.getBookByAuthor(author);
	}
	
	public boolean checkUserAddress(String userName) {
		Users users = userDao.getUserById(userName);
		return users.getAddress() == null ? true : false;
	}
}

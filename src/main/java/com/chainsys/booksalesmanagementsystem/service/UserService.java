package com.chainsys.booksalesmanagementsystem.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.chainsys.booksalesmanagementsystem.dao.BookDao;
import com.chainsys.booksalesmanagementsystem.dao.OrderDao;
import com.chainsys.booksalesmanagementsystem.dao.UserDao;
import com.chainsys.booksalesmanagementsystem.model.Books;
import com.chainsys.booksalesmanagementsystem.model.Cart;
import com.chainsys.booksalesmanagementsystem.model.CartDetails;

@Service

public class UserService {

	@Autowired
	BookDao bookDao;
	
	@Autowired
	OrderDao orderDao;
	
	@Autowired
	UserDao userDao;
	
	public List<Books> getTopBooks(){
		return bookDao.getTopSaledBooks();
	}
	
	public List<Books> getBooks(){
		return bookDao.getBookList();
	}

	public Books getBookById(String bookId) {
		return bookDao.getBookById(bookId);
	}
	
	public List<Books> getBookBycategory(String category){
		return bookDao.getBookByCategory(category);
	}

	public boolean addToCart(Cart cart) {
		int noOfRowsAffected = orderDao.addcart(cart);
		if(noOfRowsAffected > 0) {
			return true;
		}
		else {
			return false;
		}
	}
	
	public List<CartDetails> getCart(String username, String status){
		return orderDao.getCart(username, status);
	}
	
	public boolean deleteCart(int cartId) {
		System.out.println("Inseide service");
		int noOfRowsAffected = orderDao.deleteCart(cartId);
		if(noOfRowsAffected > 0) {
			return true;
		}
		else {
			return false;
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
	
	public List<Books> searchBooks(String keyword) {
		return bookDao.searchBooks(keyword);
	}
	
	public List<Books> getBooksByLanguage(String language){
		return bookDao.getBookByLanguage(language);
	}
	
	public List<Books> getBooksByPrice(int fromRate, int toRate){
		return bookDao.getBookByPrice(fromRate, toRate);
	}
	
	public List<Books> getBooksByAuthor(String author){
		return bookDao.getBookByAuthor(author);
	}
}

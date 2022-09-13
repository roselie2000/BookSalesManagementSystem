package com.chainsys.booksalesmanagementsystem.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.chainsys.booksalesmanagementsystem.dao.AdminDao;
import com.chainsys.booksalesmanagementsystem.dao.BookDao;
import com.chainsys.booksalesmanagementsystem.dao.UserDao;
import com.chainsys.booksalesmanagementsystem.model.Admin;
import com.chainsys.booksalesmanagementsystem.model.Books;
import com.chainsys.booksalesmanagementsystem.model.OrdersDetails;
import com.chainsys.booksalesmanagementsystem.model.Users;

@Service
public class AdminService {

	@Autowired 
	AdminDao adminDoa;
	
	@Autowired
	UserDao userDoa;
	
	@Autowired
	BookDao bookDoa;
	
	public boolean checkIdentity(String uname, String pwd) {
		Admin admin = adminDoa.adminLogin(uname, pwd);
		if(uname.equals(admin.getAdminUserName()) && pwd.equals(admin.getAdminPassword())) {
			return true;
		}
		else {
			return false;
		}
	}

	public List<Users> getUser() {
		return userDoa.getUserList();
	}
	
	public boolean addBooks(Books bk) {
		int noOfRowsAffected = bookDoa.addBooks(bk);
		if(noOfRowsAffected > 0) {
			return true;
		}
		else {
			return false;
		}
	}
	
	public List<Books> getBooks(){
		return bookDoa.getBookList();
	}
	
	public List<Books> getBookBycategory(String category){
		List<Books> categoryBook = null;
		if(category.equals("Novel")) {
			return bookDoa.getBookByCategory(category);
		}
		else if(category.equals("Poetry")) {
			return bookDoa.getBookByCategory(category);
		}
		else if(category.equals("History")) {
			return bookDoa.getBookByCategory(category);
		}
		else if(category.equals("Education")){
			return bookDoa.getBookByCategory(category);
		}
		else if(category.equals("Biography")) {
			return bookDoa.getBookByCategory(category);
		}
		return categoryBook;
	}

	public boolean updateBook(Books bk) {
		int noOfRowsAffected = bookDoa.updateBookDetails(bk);
		if(noOfRowsAffected > 0) {
			return true;
		}
		else {
			return false;
		}	
	}
	
	public boolean deleteBooks(String bookId) {
		int noOfRowsAffected = bookDoa.deleteBook(bookId);
		if(noOfRowsAffected > 0) {
			return true;
		}
		else {
			return false;
		}
	}
	
	public List<OrdersDetails> getOrders() {
		return adminDoa.getOrderList();
	}
	
	public List<Books> getTopSearchedBooks(){
		return bookDoa.getTopSaledBooks();
	}
	
	public List<Books> getLowQuantityBooks(){
		return bookDoa.getLowQuantityBooks();
	}
	
	public List<Users> getTopBuyers(){
		return userDoa.getTopBuyers();
	}
}

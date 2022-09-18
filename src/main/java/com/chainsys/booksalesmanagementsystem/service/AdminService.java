package com.chainsys.booksalesmanagementsystem.service;

import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.chainsys.booksalesmanagementsystem.dao.AdminDao;
import com.chainsys.booksalesmanagementsystem.dao.BookDao;
import com.chainsys.booksalesmanagementsystem.dao.OrderDao;
import com.chainsys.booksalesmanagementsystem.dao.UserDao;
import com.chainsys.booksalesmanagementsystem.exception.DataAddedException;
import com.chainsys.booksalesmanagementsystem.exception.InternalException;
import com.chainsys.booksalesmanagementsystem.exception.InvalidCredentialException;
import com.chainsys.booksalesmanagementsystem.model.Admin;
import com.chainsys.booksalesmanagementsystem.model.Books;
import com.chainsys.booksalesmanagementsystem.model.OrderHistory;
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
	
	@Autowired
	OrderDao orderDao;
	
	public boolean checkIdentity(String uname, String pwd) throws InvalidCredentialException, InternalException, SQLException {
		Admin admin = adminDoa.adminLogin(uname, pwd);
		if(admin == null) {
			throw new InternalException();
		}
		else if(uname.equals(admin.getAdminUserName()) && pwd.equals(admin.getAdminPassword())) {
			return true;
		}
		else {
			throw new InvalidCredentialException();
		}
	}

	public List<Users> getUser() {
		return userDoa.getUserList();
	}
	
	public boolean addBooks(Books bk) throws DataAddedException, SQLException {
		int noOfRowsAffected = bookDoa.addBooks(bk);
		if(noOfRowsAffected > 0) {
			return true;
		}
		else {
			throw new DataAddedException();
		}
	}
	
	public List<Books> getBooks() throws SQLException{
		return bookDoa.getBookList();
	}
	
	public List<Books> getBookBycategory(String category) throws SQLException{
		 return bookDoa.getBookByCategory(category);
	}

	public boolean updateBook(Books bk) throws DataAddedException, SQLException {
		int noOfRowsAffected = bookDoa.updateBookDetails(bk);
		if(noOfRowsAffected > 0) {
			return true;
		}
		else {
			throw new DataAddedException();
		}	
	}
	
	public List<OrdersDetails> getOrders() throws SQLException {
		return adminDoa.getOrderList();
	}
	
	public List<Books> getTopSearchedBooks() throws SQLException{
		return bookDoa.getTopSaledBooks();
	}
	
	public List<Books> getLowQuantityBooks() throws SQLException{
		return bookDoa.getLowQuantityBooks();
	}
	
	public List<Users> getTopBuyers(){
		return userDoa.getTopBuyers();
	}
	
	public Users getUserByUserName(String userName){
		return userDoa.getUserById(userName);
	}
	
	public List<OrderHistory> getOrdersByUserName(String userName) throws SQLException{
		return orderDao.getOrdersById(userName);
	}

	public boolean getBookById(String bookId) {
		Books book = bookDoa.getBookById(bookId);
		return book!=null ? true : false;
	}
}

package com.chainsys.booksalesmanagementsystem.controller;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.chainsys.booksalesmanagementsystem.exception.DataAddedException;
import com.chainsys.booksalesmanagementsystem.exception.InternalException;
import com.chainsys.booksalesmanagementsystem.exception.InvalidCredentialException;
import com.chainsys.booksalesmanagementsystem.model.Books;
import com.chainsys.booksalesmanagementsystem.model.OrderHistory;
import com.chainsys.booksalesmanagementsystem.model.OrdersDetails;
import com.chainsys.booksalesmanagementsystem.model.Users;
import com.chainsys.booksalesmanagementsystem.service.AdminService;

@Controller
public class AdminController {
	
	@Autowired
	AdminService adminService;
	
	String listName = "books";
	String booksPage = "books.jsp";
	String message = "There is no Books are available now";
	String msg = "msg";
	String login = "login.jsp";
	String bookPath = "Books";
	String addBooks = "addbooks.jsp";
	String orders = "orders.jsp";
	String topUser = "topuser.jsp";
	@RequestMapping(value = "/adminlogin", method = RequestMethod.POST)
	public String adminLogin(@RequestParam("username") String userName, @RequestParam("pwd") String password, Model model) throws InternalException {
		try {
			adminService.checkIdentity(userName, password);
			return "/adminHome";
		}catch (InvalidCredentialException e) {
			model.addAttribute(msg, "Please enter valid Username and Password");
			return login;
		}catch (InternalException e) {
			model.addAttribute(msg, "Some Internal problem! Please try again later!");
			return login;
		}catch (SQLException e) {
			model.addAttribute(msg, "Some Internal problem! Please try again later!");
			return login;
		}
		
	}
	
	@RequestMapping("/adminHome")
		public String adminHome(Model model) {
			try {
				List<Books> topBooks = adminService.getTopSearchedBooks();
				model.addAttribute("topBooks", topBooks);
			}catch (SQLException e) {
				model.addAttribute(msg, "Some Internal problem may occur! Can't get the top searched books!");
			}
			try {
				List<Books> lowQtyBooks = adminService.getLowQuantityBooks();
				model.addAttribute("lowQtyBooks", lowQtyBooks);
			}catch (SQLException e) {
				model.addAttribute(msg, "Some Internal problem may occur! Can't get the book list which have low quantity");
			}
				
				List<Users> topUsers = adminService.getTopBuyers();
				
				
				model.addAttribute("topUsers", topUsers);
				return "adminlanding.jsp";
			
		}
	
	@PostMapping("/addBooks")
	public String insertBooks(@RequestParam("bkid") String bookId, @RequestParam("bkname") String bookName,
			@RequestParam("authorname") String author, @RequestParam("publisher") String publisher,
			@RequestParam("category") String category, @RequestParam("lang") String language,
			@RequestParam("edition") int edition, @RequestParam("quantity") int quantity,@RequestParam("price") int price, 
			@RequestParam("mrpRate") int mrpRate, @RequestParam("file") MultipartFile img, Model model) throws IOException {
		
			int actPrice = mrpRate - 5;// calculate the actual rate of the book
			String path = "C:\\eclipse\\BookSalesMgmtSystem\\src\\main\\webapp\\images\\";
			String filename = img.getOriginalFilename();
			try {
			FileInputStream fin = new FileInputStream(path+filename);
			byte[] images = fin.readAllBytes();
//			set all data of the book model
			Books books = new Books();
			books.setBookId(bookId);
			books.setBookName(bookName);
			books.setAuthor(author);
			books.setPublisher(publisher);
			books.setEdition(edition);
			books.setCategory(category);
			books.setLanguage(language);
			books.setPrice(price);
			books.setMrp(mrpRate);
			books.setActualPrice(actPrice);
			books.setAvailableQuantity(quantity);
			books.setBookImage(images);
			// check whether the data are inserted or not
			
				adminService.addBooks(books);
				model.addAttribute(msg, "Successfully Added!");
				return addBooks;
			} catch (DataAddedException e) {
				model.addAttribute(msg, "Some internal problem may occur. The data of book is not added!. Please try again later");
				return addBooks;
			} catch (SQLException e) {
				model.addAttribute(msg, "Some internal problem may occur. The data of book is not added!. Please try again later");
				return addBooks;
			}catch (IOException e) {
				model.addAttribute(msg, "The file name of the Image is invalid. Please give valid filename");
				return addBooks;
			}
	}	
	
	@GetMapping("/Users")
	public String getUserList(Model model) {
		List<Users> userList = adminService.getUser();
		model.addAttribute("users", userList);
		return "users.jsp";
	}
	
	@GetMapping("/Books")
	public String getBookList(Model model) {
		List<Books> bookList;
		try {
			bookList = adminService.getBooks();
			if(bookList != null) {
				model.addAttribute(listName, bookList);
				return booksPage;
			}
			else {
				model.addAttribute("msg", message);
				return booksPage;
			}
		} catch (SQLException e) {
			model.addAttribute(msg, "Some internal problem may occur. Can't get the Book list!");
			return booksPage;
		}
		
	}
	
	@GetMapping("getBookByCategoryAdmin")
	public String getBookByCategory(@RequestParam("category") String category, Model model) {
		List<Books> bookList;
		try {
			bookList = adminService.getBookBycategory(category);
			if(bookList != null) {
				model.addAttribute(listName, bookList);
				return booksPage;
			}
			else {
				model.addAttribute(msg, "There is no Books are available now");
				return booksPage;
			}
		} catch (SQLException e) {
			model.addAttribute(msg, "Some internal problem may occur! can't get the book list!");
			return booksPage;
		}
	}
	
	@GetMapping("/update")
	public String updateBook(@RequestParam("bookid") String id, @RequestParam("bookname") String name, @RequestParam("author") String author,
			@RequestParam("publisher") String publisher, @RequestParam("edition") int edition,
			@RequestParam("quantity") int quantity, @RequestParam("price") int price, @RequestParam("actualPrice") int actualPrice, @RequestParam("mrpRate") int mrp, Model model) {
		Books books = new Books();
		books.setBookId(id);
		books.setBookName(name);
		books.setAuthor(author);
		books.setPublisher(publisher);
		books.setEdition(edition);
		books.setAvailableQuantity(quantity);
		books.setPrice(price);
		books.setActualPrice(actualPrice);
		books.setMrp(mrp);
		try {
			adminService.updateBook(books);
			model.addAttribute(msg, "The book Details are Successfully Updated!");
			return bookPath;
		} catch (DataAddedException e) {
			model.addAttribute(msg, "Some Internal problem may occur. The book details are not updated!. Please try again later!");
			return bookPath;
		} catch (SQLException e) {
			model.addAttribute(msg, "Some Internal problem may occur. The book details are not updated!. Please try again later!");
			return bookPath;
		}
	}
	
	@GetMapping("/Orders")
	public String getOrdersList(Model model) {
		List<OrdersDetails> orderList;
		try {
			orderList = adminService.getOrders();
			if(orderList != null) {
				model.addAttribute("orderList", orderList);
				return orders;
			}
			else {
				model.addAttribute(msg, "No Orders available");
				return orders;
			}
		} catch (SQLException e) {
			model.addAttribute(msg, "Some internal problem may occur. Can't get the List of Orders!");
			return orders;
		}
		
	}
	
	@GetMapping("getUserDetailsById")
	public String getTopUserById(@RequestParam("username") String userName, Model model) {
		Users user = adminService.getUserByUserName(userName);
		try {
			List<OrderHistory> orders = adminService.getOrdersByUserName(userName);
			model.addAttribute("user", user);
			model.addAttribute("orders", orders);
			return topUser;
		} catch (SQLException e) {
			model.addAttribute("msg", "Some internal problem may occur! Can't get the list of orders of this user");
			return topUser;
		}
	}
}

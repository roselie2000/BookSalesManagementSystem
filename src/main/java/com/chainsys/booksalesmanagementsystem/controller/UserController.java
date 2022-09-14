package com.chainsys.booksalesmanagementsystem.controller;

import java.sql.Date;
import java.time.LocalDate;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.chainsys.booksalesmanagementsystem.dao.UserDao;
import com.chainsys.booksalesmanagementsystem.model.Books;
import com.chainsys.booksalesmanagementsystem.model.Cart;
import com.chainsys.booksalesmanagementsystem.model.CartDetails;
import com.chainsys.booksalesmanagementsystem.model.OrderHistory;
import com.chainsys.booksalesmanagementsystem.model.OrdersDetails;
import com.chainsys.booksalesmanagementsystem.model.Rating;
import com.chainsys.booksalesmanagementsystem.model.Users;
import com.chainsys.booksalesmanagementsystem.service.OrderService;
import com.chainsys.booksalesmanagementsystem.service.UserService;

@Controller
public class UserController {
	
	@Autowired
	UserDao userDao;
	
	@Autowired
	UserService userService;
	
	@Autowired
	OrderService orderService;
	
	String bookPath = "userBooks";
	String loginPath = "login.jsp";
	String books = "books";
	String allBookPath = "allbooks.jsp";
	String cartPath = "carts";
	
	@GetMapping("/signup")
	public String signup(@RequestParam("username") String userName, @RequestParam("email") String email, @RequestParam("pwd") String password, Model model, HttpServletRequest request) {
		
		try {
			
			if(userDao.checkUserNameAvail(userName)) {
				Users user = new Users();
				user.setUserName(userName);
				user.setPassword(password);
				user.setEmailId(email);
				int noOfRowsAffected = userDao.signup(user);
				if(noOfRowsAffected > 0) {
					HttpSession session = request.getSession();
					session.setAttribute("user", userName);
					return bookPath;
				}
				else {
					model.addAttribute("msg", "Some internal problem Please try again later");
					return "signup.jsp";
				}
			}
			else {
				model.addAttribute("msg", "Username is already exists!. Please click login! or Try with another Username");
				return "signup.jsp";
			}
			
			
		}catch (Exception e) {
			model.addAttribute("msg", "Some internal problem Please try again later");
			return "signun.jsp";
		}
	}
	
	
	@GetMapping("/userlogin")
	public String login(@RequestParam("username") String uname, @RequestParam("pwd") String pwd, Model model, HttpServletRequest request) {
		
		try {
			if(userDao.login(uname, pwd)) {
				HttpSession session = request.getSession();
				session.setAttribute("user", uname);
				return bookPath;
			}
			else {
				model.addAttribute("msg", "Invalid username or password. Please check your username and password");
				return loginPath;
			}
		}catch (Exception e) {
			model.addAttribute("msg", "Some internal problem! Please try again later!");
			return loginPath;
		}
	}
	
	@GetMapping("/changepassword")
	public String updatePassword(@RequestParam("username") String username, @RequestParam("pwd2") String password2,
			@RequestParam("pwd1") String password1, Model model) {
		if(password1.equals(password2)) {
			if(userService.updatePassword(username, password2)) {
				model.addAttribute("msg", "Your password is changed! Please login to the system!");
				return loginPath;
			}
			else {
				model.addAttribute("msg", "Invalid username! Please check your username");
				return "forgotpassword.jsp";
			}
		}
		else {
			model.addAttribute("msg", "The Change password and Conform Password should be same!");
			return "forgotpassword.jsp";
		}
		
	}
	
	@GetMapping("/userBooks")
	public String getTopBooks(Model model) {
		List<Books> topBooks = userService.getTopBooks();
		List<Books> bookList = userService.getBooks();
		model.addAttribute(books, bookList);
		model.addAttribute("topBooks", topBooks);
		return "userlanding.jsp";
	}
	
	@GetMapping("/getAllBooks")
	public String getAllBooks(Model model) {
		List<Books> bookList = userService.getBooks();
		model.addAttribute(books, bookList);
		return allBookPath;
	}
	
	@GetMapping("/getBookByCategory")
	public String getBookBycategory(@RequestParam("category") String category, Model model) {
		List<Books> bookList = userService.getBookBycategory(category);
		if(bookList != null) {
			model.addAttribute(books, bookList);
			return allBookPath;
		}
		else {
			model.addAttribute("msg", "There is no Books are available now");
			return allBookPath;
		}
	}
	
	@GetMapping("/getBooks")
	public String getBuys(@RequestParam("id") String bkId, @RequestParam("cat") String category, Model model) {
		Books books = userService.getBookById(bkId);
		List<Books> relatedBooks = userService.getBookBycategory(category);
		List<Books> topBooks = userService.getTopBooks();
		model.addAttribute("book", books);
		model.addAttribute("topBooks", topBooks);
		model.addAttribute("relatedBook", relatedBooks);
		return "viewbook.jsp";
	}
	
	@GetMapping("/searchBooks")
		public String searchBooks(@RequestParam("keyword") String keyword, Model model) {
			List<Books> searchedBooks = userService.searchBooks(keyword);
			if(searchedBooks == null || searchedBooks.isEmpty()) {
				model.addAttribute("msg", "No Books");
				return allBookPath;
			}
			else {
				model.addAttribute(books, searchedBooks);
				return allBookPath;
			}
		}
	
	@GetMapping("/user")
	public String userPage(HttpServletRequest request) {
		HttpSession session = request.getSession();
		session.setAttribute("user", null);
		return bookPath;
	}
	
	@GetMapping("/addtocart")
	public String addToCart(@RequestParam("id") String cartId, Model model, HttpServletRequest request) {
		HttpSession session = request.getSession();
		String userName = (String) session.getAttribute("user");
		if(userName == null) {
			return loginPath;
		}
		else {
			Cart cart = new Cart();
			cart.setUserName(userName);
			cart.setBookId(cartId);
			if(userService.addToCart(cart)) {
				model.addAttribute("msg", "Added Successfully");
				return "getBooks";
			}
			else {
				model.addAttribute("msg", "Some Internal Problem. Please try again later!");
				return "getBooks";
			}
		}
	}
	
	@GetMapping("/carts")
	public String getCartDetails(Model model, HttpServletRequest request) {
		HttpSession session = request.getSession();
		String userName = (String) session.getAttribute("user");
		List<CartDetails> carts = userService.getCart(userName);
		if(carts == null || carts.isEmpty()) {
			model.addAttribute("msg", "No Carts");
			return "cartpage.jsp";
		}
		else {
			model.addAttribute(cartPath, carts);
			return "cartpage.jsp";
		}
	}
	
	@GetMapping("/deletecart")
	public String deleteCart(@RequestParam("id") int cartId, Model model) {
		if(userService.deleteCart(cartId)) {
			model.addAttribute("msg", "The item is successfully removed from the cart!");
			return cartPath;
		}
		else {
			model.addAttribute("msg", "You can't remove the item now. Please try again later! ");
			return cartPath;
		}
	}
	
	@GetMapping("/getOrders")
	public String getOrder(HttpServletResponse response, HttpServletRequest request, Model model, @RequestParam("id") String bookId) {
		HttpSession session = request.getSession();
		String uname = (String) session.getAttribute("user");
		session.setAttribute("id", bookId);
		if(uname.equals(null)) {
			model.addAttribute("msg", "Please login our system to order the books");
			return loginPath;
		}
		else {
			Users user = userDao.getUserById(uname);
			model.addAttribute("userdata", user);
			model.addAttribute("msg", "Please check your personal details");
			return "profile.jsp";
		}
	}
	
	@GetMapping("/getProfile")
	public String getProfile(Model model, HttpServletRequest request) {
		HttpSession session = request.getSession();
		String uname = (String) session.getAttribute("user");
		if(uname.equals(null)) {
			model.addAttribute("msg", "Please login our system to order the books");
			return loginPath;
		}
		else {
			Users user = userDao.getUserById(uname);
			model.addAttribute("userdata", user);
			return "profile.jsp";
		}
	}
	@GetMapping("/updateUser")
	public String updateUser(@RequestParam("name") String name,@RequestParam("phno") String phno, @RequestParam("addr") String address, 
			@RequestParam("dist") String district, @RequestParam("state") String state,
			@RequestParam("pincode") int pincode, HttpServletRequest request) {
		
		HttpSession session = request.getSession();
		String username = (String) session.getAttribute("user");
		Users user = new Users();
		user.setUserName(username);
		user.setName(name);
		user.setPhoneno(phno);
		user.setAddress(address);
		user.setDistrict(district);
		user.setState(state);
		user.setPincode(pincode);
		
		userDao.upadteUser(user);
		return "placeOrders";
	}
	
	@GetMapping("/placeOrders")
	public String placeOrders(HttpServletRequest request, Model model) {
    	HttpSession session = request.getSession();
		String bookId = (String) session.getAttribute("id");
		Books book = userService.getBookById(bookId);
		model.addAttribute("book", book);
		return "buy.jsp";
	}
	
	@GetMapping("/placeOrder")
	public String addOrder(HttpServletRequest request, Model model, @RequestParam("bookid") String bookId, @RequestParam("quantity") int quantity, 
			@RequestParam("total") int totalPrice, @RequestParam("advanceAmount") int advanceAmount) {
		HttpSession session = request.getSession();
		String userName = (String) session.getAttribute("user");
		
		LocalDate localDate = LocalDate.now();
		Date orderedDate = Date.valueOf(localDate);
		
		OrdersDetails order = new OrdersDetails();
		order.setBookId(bookId);
		order.setUserName(userName);
		order.setQuantity(quantity);
		order.setOrderDate(orderedDate);
		order.setTotalPrice(totalPrice);
		order.setAdvanceAmount(advanceAmount);
		order.setStatus("Ordered");
		
		if(orderService.addOrder(order)) {
			model.addAttribute("msg", "Your Order is Placed Successfully!");
			return bookPath;
		}
		else {
			model.addAttribute("msg", "Some Internal Problem may occur. Please try again later!");
			return "buy.jsp";
		}
	}
	
	@GetMapping("/cancel")
	public String cancelBook(HttpServletRequest request, Model model) {
		HttpSession session = request.getSession();
		session.removeAttribute("id");
		return bookPath;
	}
	
	@GetMapping("/addReview")
	public String addBookReview(@RequestParam("id") String bookId, @RequestParam("rate") int rate, @RequestParam("review") String review, HttpServletRequest request, Model model) {
		HttpSession session = request.getSession();
		String userName = (String) session.getAttribute("user");
		if(userName.equals(null)) {
			model.addAttribute("msg", "Please login into the system for review the book");
			return loginPath;
		}
		else {
			Rating rating = new Rating();
			rating.setBookId(bookId);
			rating.setRating(rate);
			rating.setReview(review);
			rating.setUserName(userName);
			if(orderService.addRating(rating)) {
				return bookPath;
			}
			else {
				return bookPath;
			}
		}
	}
	
	@GetMapping("/getOrderHistory")
	public String getOrderById(Model model, HttpServletRequest request) {
		HttpSession session = request.getSession();
		String userName = (String) session.getAttribute("user");
		
		if(userName.equals(null)) {
			model.addAttribute("msg", "Please login for see your Order History");
				return loginPath;
		}
		else {
			List<OrderHistory> orderHistory = orderService.getOrderById(userName);
			model.addAttribute("orderHistory", orderHistory);
			return "orderHistory.jsp";
		}
	}
	
	@GetMapping("/getBookByPrice")
	public String getBookByPrice(@RequestParam("from") int from, @RequestParam("to") int to, Model model) {
		List<Books> booksList = userService.getBooksByPrice(from, to);
		if(booksList != null) {
			model.addAttribute(books, booksList);
			return allBookPath;
		}
		else {
			model.addAttribute("msg", "No books");
			return allBookPath;
		}
	}
	
	@GetMapping("/language")
	public String getBooksByLanguage(@RequestParam("lang") String language, Model model) {
		List<Books> booksList = userService.getBooksByLanguage(language);
		if(booksList != null) {
			model.addAttribute(books, booksList);
			return allBookPath;
		}
		else {
			model.addAttribute("msg", "No Books");
			return allBookPath;
		}
	}
	
	@GetMapping("/getMultipleOrders")
	public String getMultipleOrders(Model model, HttpServletRequest request) {
		HttpSession session = request.getSession();
		String userName = (String) session.getAttribute("user");
		List<CartDetails> cartList = userService.getCart(userName);
		model.addAttribute("cart", cartList);
		return null;
	}
}

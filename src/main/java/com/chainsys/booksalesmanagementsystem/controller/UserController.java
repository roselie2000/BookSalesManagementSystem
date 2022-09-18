package com.chainsys.booksalesmanagementsystem.controller;

import java.sql.Date;
import java.sql.SQLException;
import java.time.LocalDate;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.websocket.Session;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.chainsys.booksalesmanagementsystem.dao.UserDao;
import com.chainsys.booksalesmanagementsystem.exception.DataAddedException;
import com.chainsys.booksalesmanagementsystem.exception.DataDeletedException;
import com.chainsys.booksalesmanagementsystem.exception.InternalException;
import com.chainsys.booksalesmanagementsystem.exception.UpdateRatingException;
import com.chainsys.booksalesmanagementsystem.model.Books;
import com.chainsys.booksalesmanagementsystem.model.Cart;
import com.chainsys.booksalesmanagementsystem.model.CartDetails;
import com.chainsys.booksalesmanagementsystem.model.OrderHistory;
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
	String booksPage = "books";
	String allBookPath = "allbooks.jsp";
	String cartPath = "carts";
	String addToCart = "Add to Cart";
	String getBooks = "getBooks";
	String cartPage = "cartpage.jsp";
	String userdata = "userdata";
	String priceValue = "price";
	String quantityValue = "quantity";
	String addressValue = "address";
	String paymentPage = "payment.jsp";
	String signup = "signup.jsp";
	Users user = null;

	@PostMapping("/signup")
	public String signup(@RequestParam("username") String userName, @RequestParam("email") String email,
			@RequestParam("pwd") String password, Model model, HttpServletRequest request) {
		try {

			if (userDao.checkUserNameAvail(userName)) {
				Users users = new Users();
				users.setUserName(userName);
				users.setPassword(password);
				users.setEmailId(email);
				int noOfRowsAffected = userDao.signup(users);
				if (noOfRowsAffected > 0) {
					HttpSession session = request.getSession();
					session.setAttribute("user", userName);
					return bookPath;
				} else {
					model.addAttribute("msg", "Some internal problem Please try again later! you not added");
					return signup;
				}
			} else {
				model.addAttribute("msg", "Username is already exists!. Please click login! or Try with another Username");
				return signup;
			}
		}catch (Exception e) {
			model.addAttribute("msg", "Some internal problem Please try again later! you not added");
			return signup;
		}
	}

	@PostMapping("/userlogin")
	public String login(@RequestParam("username") String uname, @RequestParam("pwd") String pwd, Model model,
			HttpServletRequest request) {

		try {
			if (userDao.login(uname, pwd)) {
				HttpSession session = request.getSession();
				session.setAttribute("user", uname);
				return bookPath;
			} else {
				model.addAttribute("msg", "Invalid username or password. Please check your username and password");
				return loginPath;
			}
		} catch (Exception e) {
			model.addAttribute("msg", "Some internal problem! Please try again later!");
			return loginPath;
		}
	}

	@PostMapping("/changepassword")
	public String updatePassword(@RequestParam("username") String username, @RequestParam("pwd2") String password2,
			@RequestParam("pwd1") String password1, Model model) {
		if (password1.equals(password2)) {
			if (userService.updatePassword(username, password2)) {
				model.addAttribute("msg", "Your password is changed! Please login to the system!");
				return loginPath;
			} else {
				model.addAttribute("msg", "Invalid username! Please check your username");
				return "forgotpassword.jsp";
			}
		} else {
			model.addAttribute("msg", "The Change password and Conform Password should be same!");
			return "forgotpassword.jsp";
		}

	}

	@RequestMapping("/userBooks")
	public String getTopBooks(Model model, HttpServletRequest request) {
		HttpSession session = request.getSession();
		if((session.getAttribute(priceValue) != null) && (session.getAttribute(quantityValue) != null) && (session.getAttribute("id") != null)) {
			session.removeAttribute(priceValue);
			session.removeAttribute(quantityValue);
			session.removeAttribute("id");
		}else {
			try {
				List<Books> bookList = userService.getBooks();
				model.addAttribute(booksPage, bookList);
			} catch (SQLException e) {
				model.addAttribute("msg", "Some internal problem may occur!. The can't get the list of books!");
			}
			try {
				List<Books> topBooks = userService.getTopBooks();
				model.addAttribute("topBooks", topBooks);
			} catch (SQLException e) {
				model.addAttribute("msg", "Some internal problem may occur!. The can't get the list of top books!");
			}
		}
		return "userlanding.jsp";
		
	}

	@GetMapping("/getAllBooks")
	public String getAllBooks(Model model) {
		List<Books> bookList;
		try {
			bookList = userService.getBooks();
			model.addAttribute(booksPage, bookList);
		} catch (SQLException e) {
			model.addAttribute("msg", "Some internal problem may occur!. The can't get the list of top books!");
		}
		return allBookPath;
	}

	@GetMapping("/getBookByCategory")
	public String getBookBycategory(@RequestParam("category") String category, Model model) {
		List<Books> bookList;
		try {
			bookList = userService.getBookBycategory(category);
			if (bookList != null) {
				model.addAttribute(booksPage, bookList);
				return allBookPath;
			} else {
				model.addAttribute("msg", "There is no Books are available now");
				return allBookPath;
			}
		} catch (SQLException e) {
			model.addAttribute("msg", "Some internal problem may occur. Can't get the list of books!");
			return allBookPath;
		}

	}

	@GetMapping("/getBooks")
	public String getBuys(@RequestParam("id") String bkId, @RequestParam("cat") String category, Model model) throws SQLException {
		Books books = userService.getBookById(bkId);
		List<Books> relatedBooks;
		try {
			relatedBooks = userService.getBookBycategory(category);
			model.addAttribute("relatedBook", relatedBooks);
		} catch (SQLException e) {
			model.addAttribute("msg", "Some internal problem may occur. Can't get the related book list!");
		}
		List<Books> topBooks;
		try {
			topBooks = userService.getTopBooks();
			model.addAttribute("topBooks", topBooks);
		} catch (SQLException e) {
			model.addAttribute("msg", "Some internal problem may occur. Can't get the top searched book list!");
		}
		model.addAttribute("book", books);
		List<Rating> ratings = orderService.getReviewsById(bkId);
		model.addAttribute("reviews", ratings);
		return "viewbook.jsp";
	}

	@GetMapping("/searchBooks")
	public String searchBooks(@RequestParam("keyword") String keyword, Model model) {
		List<Books> searchedBooks;
		try {
			searchedBooks = userService.searchBooks(keyword);
			if (searchedBooks == null || searchedBooks.isEmpty()) {
				model.addAttribute("msg", "No Books");
				return allBookPath;
			} else {
				model.addAttribute(booksPage, searchedBooks);
				return allBookPath;
			}
		} catch (SQLException e) {
			model.addAttribute("msg", "Some internal problem may occur. Can't get the top searched books list!");
			return allBookPath;
		}

	}

	@GetMapping("/user")
	public String userPage(HttpServletRequest request) {
		HttpSession session = request.getSession();
		if (session.getAttribute("user") != null) {
			session.removeAttribute("user");
		}
		return "home.jsp";
	}

	@GetMapping("/addtocart")
	public String addToCart(@RequestParam("id") String bookId, @RequestParam("price") int price, Model model,
			HttpServletRequest request) throws SQLException {
		HttpSession session = request.getSession();
		String userName = (String) session.getAttribute("user");
		if (userName == null) {
			return loginPath;
		} else {
			Cart cart = new Cart();
			cart.setUserName(userName);
			cart.setBookId(bookId);
			cart.setPrice(price);
			cart.setQuantity(1);
			cart.setStatus(addToCart);
			try {
				userService.addToCart(cart);
				model.addAttribute("msg", "Added Successfully");
				return getBooks;
			} catch (DataAddedException e) {
				model.addAttribute("msg", "Some Internal Problem. Please try again later!");
				return getBooks;
			} catch (SQLException e) {
				model.addAttribute("msg", "Some Internal Problem. Please try again later!");
				return getBooks;
			}

		}
	}

	@GetMapping("/carts")
	public String getCartDetails(Model model, HttpServletRequest request) {
		HttpSession session = request.getSession();
		String userName = (String) session.getAttribute("user");
		String status = "Add to Catr";
		List<CartDetails> carts;
		try {
			carts = userService.getCart(userName, status);
			if (carts == null || carts.isEmpty()) {
				model.addAttribute("msg", "No Carts");
				return cartPage;
			} else {
				model.addAttribute(cartPath, carts);
				return cartPage;
			}
		} catch (SQLException e) {
			model.addAttribute("msg", "Some Internal Problem.Can't get the cart Details! Please try again later!");
			return cartPage;
		}

	}

	@GetMapping("/deletecart")
	public String deleteCart(@RequestParam("id") int cartId, Model model) throws SQLException {
		try {
			userService.deleteCart(cartId);
			model.addAttribute("msg", "The item is successfully removed from the cart!");
			return cartPath;
		} catch (DataDeletedException e) {
			model.addAttribute("msg", "You can't remove the item now. Please try again later! ");
			return cartPath;
		} catch (SQLException e) {
			model.addAttribute("msg", "You can't remove the item now. Please try again later! ");
			return cartPath;
		}

	}

	@GetMapping("/getOrders")
	public String getOrder(HttpServletResponse response, HttpServletRequest request, Model model,
			@RequestParam("id") String bookId) {
		HttpSession session = request.getSession();
		String uname = (String) session.getAttribute("user");
		session.setAttribute("id", bookId);
		if (uname.equals(null)) {
			model.addAttribute("msg", "Please login our system to order the books");
			return loginPath;
		} else {
			Books book = userService.getBookById(bookId);
			model.addAttribute("book", book);
			return "buy.jsp";
		}
	}

	@GetMapping("/getProfile")
	public String getProfile(Model model, HttpServletRequest request) {
		HttpSession session = request.getSession();
		String uname = (String) session.getAttribute("user");
		if (uname.equals(null)) {
			model.addAttribute("msg", "Please login our system to order the books");
			return loginPath;
		} else {
			user = userDao.getUserById(uname);
			model.addAttribute(userdata, user);
			return "profile.jsp";
		}
	}

	@GetMapping("/getAddress")
	public String getAddress(Model model, HttpServletRequest request, @RequestParam("price") int price,
			@RequestParam("quantity") int quantity) {
		HttpSession session = request.getSession();
		String uname = (String) session.getAttribute("user");
		session.setAttribute(priceValue, price);
		session.setAttribute(quantityValue, quantity);
		user = userDao.getUserById(uname);
		if (user.getAddress() == null) {
			model.addAttribute("msg", "Please fill your address");
			model.addAttribute(userdata, user);
			return "profile.jsp";
		} else {
			model.addAttribute(userdata, user);
			String address = user.getAddress() + ", " + user.getDistrict() + ", " + user.getState() + "- "
					+ user.getPincode();
			session.setAttribute(addressValue, address);
			return "address.jsp";
		}
	}

	@GetMapping("/updateUser")
	public String updateUser(@RequestParam("name") String name, @RequestParam("phno") String phno,
			@RequestParam("addr") String address, @RequestParam("dist") String district,
			@RequestParam("state") String state, @RequestParam("pincode") int pincode, HttpServletRequest request) {

		HttpSession session = request.getSession();
		String username = (String) session.getAttribute("user");
		Users users = new Users();
		users.setUserName(username);
		users.setName(name);
		users.setPhoneno(phno);
		users.setAddress(address);
		users.setDistrict(district);
		users.setState(state);
		users.setPincode(pincode);

		userDao.upadteUser(users);
		return bookPath;
	}

	@GetMapping("/cancel")
	public String cancelBook(HttpServletRequest request, Model model) {
		HttpSession session = request.getSession();
		session.removeAttribute("id");
		session.removeAttribute("price");
		session.removeAttribute("quantity");
		return bookPath;
	}

	@GetMapping("/addReview")
	public String addBookReview(@RequestParam("id") String bookId, @RequestParam("rate") int rate,
			@RequestParam("review") String review, HttpServletRequest request, Model model) throws SQLException {
		HttpSession session = request.getSession();
		String userName = (String) session.getAttribute("user");
		if (userName.equals(null)) {
			model.addAttribute("msg", "Please login into the system for review the book");
			return loginPath;
		} else {
			Rating rating = new Rating();
			rating.setBookId(bookId);
			rating.setRating(rate);
			rating.setReview(review);
			rating.setUserName(userName);
			try {
				orderService.addRating(rating);
				return bookPath;
			} catch (InternalException e) {
				model.addAttribute("msg",
						"Some Internal problem may occur. Your rating is not added! Please try again later");
				return bookPath;
			} catch (UpdateRatingException e) {
				e.printStackTrace();
				return bookPath;
			}
		}
	}

	@GetMapping("/getOrderHistory")
	public String getOrderById(Model model, HttpServletRequest request) throws SQLException {
		HttpSession session = request.getSession();
		String userName = (String) session.getAttribute("user");

		if (userName.equals(null)) {
			model.addAttribute("msg", "Please login for see your Order History");
			return loginPath;
		} else {
			List<OrderHistory> orderHistory = orderService.getOrderById(userName);
			model.addAttribute("orderHistory", orderHistory);
			return "orderhistory.jsp";
		}
	}

	@GetMapping("/getBookByPrice")
	public String getBookByPrice(@RequestParam("from") int from, @RequestParam("to") int to, Model model) {
		List<Books> PriceWiseBookList;
		try {
			PriceWiseBookList = userService.getBooksByPrice(from, to);
			if (PriceWiseBookList != null) {
				model.addAttribute(booksPage, PriceWiseBookList);
				return allBookPath;
			} else {
				model.addAttribute("msg", "No books");
				return allBookPath;
			}
		} catch (SQLException e) {
			model.addAttribute("msg", "Some Internal Problem. Can't get the list of books! Please try again later!");
			return allBookPath;
		}

	}

	@GetMapping("/language")
	public String getBooksByLanguage(@RequestParam("lang") String language, Model model) {
		List<Books> LangWiseBookList;
		try {
			LangWiseBookList = userService.getBooksByLanguage(language);
			if (LangWiseBookList != null) {
				model.addAttribute(booksPage, LangWiseBookList);
				return allBookPath;
			} else {
				model.addAttribute("msg", "No Books");
				return allBookPath;
			}
		} catch (SQLException e) {
			model.addAttribute("msg", "Some Internal Problem. Can't get the list of books! Please try again later!");
			return allBookPath;
		}

	}

	@GetMapping("/updateQuantity")
	public String updateQuantity(Model model, @RequestParam("id") int cartId, @RequestParam("quantity") int quantity,
			@RequestParam("price") int price) throws SQLException {
		if (orderService.updateCart(cartId, quantity, price)) {
			return "/getMultipleOrders";
		} else {
			model.addAttribute("msg",
					"Some Internal problem may occur. So you can't increase the quantity. Please try again later");
			return "/getMultipleOrders";
		}
	}

	@GetMapping("/getMultipleOrders")
	public String getMultipleOrders(Model model, HttpServletRequest request) {
		HttpSession session = request.getSession();
		String userName = (String) session.getAttribute("user");
		String status = addToCart;
		List<CartDetails> cart;
		try {
			cart = userService.getCart(userName, status);
			model.addAttribute("cart", cart);
			return "multiorders.jsp";
		} catch (SQLException e) {
			model.addAttribute("msg", "Some Internal Problem. Can't get the list of Orders! Please try again later!");
			return "multiorders.jsp";
		}

	}

	@GetMapping("/addDeliveryAddress")
	public String updateAddress(Model model, @RequestParam("addr") String address,
			@RequestParam("dist") String district, @RequestParam("state") String state,
			@RequestParam("pincode") String pincode, HttpServletRequest request) {
		HttpSession session = request.getSession();
		String deliveryAddress = address + ", " + district + ", " + state + ", " + pincode;
		session.removeAttribute(addressValue);
		session.setAttribute(addressValue, deliveryAddress);
		return "payment";
	}
	
	@GetMapping("/editAddress")
	public String editAddress(Model model, HttpServletRequest request) {
		HttpSession session = request.getSession();
		String userName = (String) session.getAttribute("user");
		user = userDao.getUserById(userName);
		model.addAttribute(userdata, user);
		return "addressedit.jsp";
	}

	@GetMapping("/payment")
	public String payment(Model model, HttpServletRequest request) {
		HttpSession session = request.getSession();
		String userName = (String) session.getAttribute("user");
		if ((session.getAttribute(priceValue) != null) && (session.getAttribute(quantityValue) != null)
				&& (session.getAttribute("id") != null)) {
			int price = (int) session.getAttribute(priceValue);
			int quantity = (int) session.getAttribute(quantityValue);
			String bookId = (String) session.getAttribute("id");
			Books book = userService.getBookById(bookId);
			model.addAttribute("book", book);
			model.addAttribute(priceValue, price);
			model.addAttribute(quantityValue, quantity);
			return paymentPage;
		} else {
			List<CartDetails> cartList;
			try {
				cartList = orderService.getCart(userName, addToCart);
				model.addAttribute("cart", cartList);
				return paymentPage;
			} catch (SQLException e) {
				model.addAttribute("msg", "Some internal problem may occur. Can't load your product details. Please try again later!");
				return paymentPage;
			}
		}

	}

	@GetMapping("/addOrder")
	public String addOrder(HttpServletRequest request, Model model) throws SQLException {
		HttpSession session = request.getSession();
		int price = (int) session.getAttribute(priceValue);
		int quantity = (int) session.getAttribute(quantityValue);
		String bookId = (String) session.getAttribute("id");
		String userName = (String) session.getAttribute("user");
		LocalDate todayDate = LocalDate.now();
		Date orderedDate = Date.valueOf(todayDate);
		String deliveryAddress = (String) session.getAttribute(addressValue);
		String status = "Ordered";
		Cart cart = new Cart();
		cart.setBookId(bookId);
		cart.setUserName(userName);
		cart.setPrice(price);
		cart.setQuantity(quantity);
		cart.setOrderedDate(orderedDate);
		cart.setStatus(status);
		cart.setAddress(deliveryAddress);

		if (orderService.addOrders(cart)) {
			session.removeAttribute(priceValue);
			session.removeAttribute(quantityValue);
			session.removeAttribute("id");
			return bookPath;
		} else {
			model.addAttribute("msg", "Some Unexpected error may occur");
			return "payment";
		}
	}

	@GetMapping("/getAddressFromcart")
	public String getAddressFromCart(HttpServletRequest request, Model model) {
		HttpSession session = request.getSession();
		String uname = (String) session.getAttribute("user");
		user = userDao.getUserById(uname);
		if (user.getAddress() == null) {
			model.addAttribute("msg", "Please fill your address");
			model.addAttribute(userdata, user);
			return "userprofile.jsp";
		} else {
			model.addAttribute(userdata, user);
			String address = user.getAddress() + ", " + user.getDistrict() + ", " + user.getState() + "- "
					+ user.getPincode();
			session.setAttribute(addressValue, address);
			return "address.jsp";
		}
	}

	@GetMapping("/addAddress")
	public String addAddress(@RequestParam("name") String name, @RequestParam("username") String userName,
			@RequestParam("emailid") String email, @RequestParam("phno") String phoneno,
			@RequestParam("addr") String address, @RequestParam("dist") String district,
			@RequestParam("state") String state, @RequestParam("pincode") int pincode, Model model) {
		Users users = new Users();
		users.setName(name);
		users.setUserName(userName);
		users.setEmailId(email);
		users.setPhoneno(phoneno);
		users.setAddress(address);
		users.setDistrict(district);
		users.setState(state);
		users.setPincode(pincode);
		int noOfRowsAffected = userDao.upadteUser(user);
		if (noOfRowsAffected > 0) {
			return "getMultipleOrders";
		} else {
			model.addAttribute("msg", "Some Internal problem may occur. please try again later");
			return "userprofile.jsp";
		}
	}

	@GetMapping("/addMultipleOrders")
	public String addMultipleOrders(HttpServletRequest request, Model model) throws SQLException {
		HttpSession session = request.getSession();
		String userName = (String) session.getAttribute("user");
		String address = (String) session.getAttribute(addressValue);
		LocalDate todayDate = LocalDate.now();
		Date orderedDate = Date.valueOf(todayDate);
		String status = "Ordered";

		Cart cart = new Cart();
		cart.setUserName(userName);
		cart.setAddress(address);
		cart.setOrderedDate(orderedDate);
		cart.setStatus(status);
		if (orderService.updateCartStatus(cart)) {
			return bookPath;
		} else {
			model.addAttribute("msg", "Some Unexpected error may occur");
			return "payment";
		}
	}

	@GetMapping("/Logout")
	public String userLogout(HttpServletRequest request) {
		return "user";
	}
}
package com.chainsys.booksalesmanagementsystem.dao;

import java.sql.SQLException;
import java.util.List;
import java.util.stream.Collectors;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.chainsys.booksalesmanagementsystem.mapper.BookMapper;
import com.chainsys.booksalesmanagementsystem.model.Books;

@Repository
public class BookDao {

	@Autowired
	JdbcTemplate jdbcTemplate;

	public int addBooks(Books books) throws SQLException {
		String insertBook = "insert into bookDetails(booksId, booksName, authors, publishers, edition, category, language, price, mrp_rate, "
				+ "act_rate, avl_quantity, book_image) values (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
		Object[] bookData = { books.getBookId(), books.getBookName(), books.getAuthor(), books.getPublisher(),
				books.getEdition(), books.getCategory(), books.getLanguage(), books.getPrice(), books.getMrp(),
				books.getActualPrice(), books.getAvailableQuantity(), books.getBookImage() };// create the object for
																								// execute the query
		int noOfRowsAffected = jdbcTemplate.update(insertBook, bookData);// execute the query
		return noOfRowsAffected;
	}

	public List<Books> getBookList() throws SQLException {
		String selectBooks = "select * from bookdetails";
		List<Books> bookList = null;
		bookList = jdbcTemplate.query(selectBooks, new BookMapper());
		return bookList;
	}

	public List<Books> getTopSaledBooks() throws SQLException {
		String selectTopSaledBooks = "select booksid from (SELECT booksid, COUNT(*)"
				+ "FROM orders GROUP BY booksid ORDER BY booksid) WHERE ROWNUM <= 4";
		List<String> topBooks = null;
		List<Books> topBookList = null;
		topBooks = jdbcTemplate.queryForList(selectTopSaledBooks, String.class);
		topBookList = topBooks.stream().map(bk -> getBookById(bk)).collect(Collectors.toList());
		return topBookList;
	}

	public Books getBookById(String bkId) {
		String selectBookById = "select * from bookdetails where booksid = ?";
		Books books = null;
		books = jdbcTemplate.queryForObject(selectBookById, new BookMapper(), bkId);
		return books;
	}

	public int updateBookDetails(Books books) throws SQLException {
		String updateBooks = "update bookdetails set booksid = ?, booksname =?, authors = ?, publishers = ?, edition = ?, price = ?, mrp_rate = ?,"
				+ "avl_quantity = ? where booksid = ?";
		Object[] bookData = { books.getBookId(), books.getBookName(), books.getAuthor(), books.getPublisher(),
				books.getEdition(), books.getPrice(), books.getMrp(), books.getAvailableQuantity(), books.getBookId() };
		int noOfRowsAffected = jdbcTemplate.update(updateBooks, bookData);
		return noOfRowsAffected;
	}

	public List<Books> searchBooks(String keyword) throws SQLException {
		String selectByKeyword = "select * from bookdetails where booksname like ? or authors like ? or publishers like ?";
		List<Books> searchedBooks = null;
		String value = "%" + keyword + "%";
		searchedBooks = jdbcTemplate.query(selectByKeyword, new BookMapper(), value, value, value);
		return searchedBooks;
	}

	public int updateQuantity(int quantity, String bookId) throws SQLException {
		String updatequantity = "update bookdetails set avl_quantity = ? where booksid = ?";
		int availableQuantity = getQuantityById(bookId);
		int updatedQuantity = availableQuantity - quantity;
		int noOfAffectedRows = jdbcTemplate.update(updatequantity, updatedQuantity, bookId);
		return noOfAffectedRows;
	}

	public int getQuantityById(String bookId) throws SQLException {
		String selectQuantity = "select avl_quantity from bookdetails where booksid = ?";
		int quantity = jdbcTemplate.queryForObject(selectQuantity, int.class, bookId);
		return quantity;
	}

	public List<Books> getBookByLanguage(String language) throws SQLException {
		String selectBookByLang = "select * from bookdetails where language = ?";
		List<Books> bookList = null;
		bookList = jdbcTemplate.query(selectBookByLang, new BookMapper(), language);
		return bookList;
	}

	public List<Books> getBookByAuthor(String author) throws SQLException {
		String selectBookByAuthor = "slect * from bookdetails where author = ?";
		List<Books> bookList = null;
		bookList = jdbcTemplate.query(selectBookByAuthor, new BookMapper(), author);
		return bookList;
	}

	public List<Books> getBookByPrice(int fromRate, int toRate) throws SQLException {
		String selectBookByPrice = "select * from bookdetails where act_rate BETWEEN ? and ?";
		List<Books> bookList = null;
		bookList = jdbcTemplate.query(selectBookByPrice, new BookMapper(), fromRate, toRate);
		return bookList;
	}

	public List<Books> getBookByCategory(String category) throws SQLException {
		String selectBookByCategory = "select * from bookdetails where category = ?";
		List<Books> bookList = null;
		bookList = jdbcTemplate.query(selectBookByCategory, new BookMapper(), category);
		return bookList;
	}

	public List<Books> getLowQuantityBooks() throws SQLException {
		String selectBookByQuantity = "select * from bookdetails where avl_quantity < 15";
		List<Books> bookList = null;
		bookList = jdbcTemplate.query(selectBookByQuantity, new BookMapper());
		return bookList;
	}
}

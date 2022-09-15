 package com.chainsys.booksalesmanagementsystem.mapper;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Base64;

import org.springframework.jdbc.core.RowMapper;

import com.chainsys.booksalesmanagementsystem.model.Books;

public class BookMapper implements RowMapper<Books>{

	@Override
	public Books mapRow(ResultSet rs, int rowNum) throws SQLException {
		
		String bkId = rs.getString("booksid");
		String bkname = rs.getString("booksname");
		String author = rs.getString("authors");
		String pub = rs.getString("publishers");
		int edition = rs.getInt("edition");
		String category = rs.getString("category");
		int price = rs.getInt("price");
		int mrpRate = rs.getInt("mrp_rate");
		int actRate = rs.getInt("act_rate");
		int qty = rs.getInt("avl_quantity");
		String lang = rs.getString("language");
		byte[] images = rs.getBytes("book_image");
		String base64Image = Base64.getEncoder().encodeToString(images);
		int rate = rs.getInt("rating");
		
		Books bk = new Books();
		bk.setBookId(bkId);
		bk.setBookName(bkname);
		bk.setAuthor(author);
		bk.setPublisher(pub);
		bk.setEdition(edition);
		bk.setCategory(category);
		bk.setPrice(price);
		bk.setMrp(mrpRate);
		bk.setActualPrice(actRate);
		bk.setAvailableQuantity(qty);
		bk.setLanguage(lang);
		bk.setBookImage(images);
		bk.setImagesPath(base64Image);
		bk.setRate(rate);
		return bk;		
	}
}

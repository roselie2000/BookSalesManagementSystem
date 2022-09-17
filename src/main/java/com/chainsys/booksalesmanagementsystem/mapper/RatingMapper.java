package com.chainsys.booksalesmanagementsystem.mapper;

import java.sql.ResultSet;
import java.sql.SQLException;
import org.springframework.jdbc.core.RowMapper;

import com.chainsys.booksalesmanagementsystem.model.Rating;

public class RatingMapper implements RowMapper<Rating> {

	@Override
	public Rating mapRow(ResultSet rs, int rowNum) throws SQLException {
		String bookId = rs.getString("bookid");
		String userName = rs.getString("username");
		int rate = rs.getInt("rating");
		String review = rs.getString("review");
		
		Rating rating = new Rating();
		rating.setBookId(bookId);
		rating.setUserName(userName);
		rating.setRating(rate);
		rating.setReview(review);
		return rating;
	}

}

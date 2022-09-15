package com.chainsys.booksalesmanagementsystem.dao;

import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.chainsys.booksalesmanagementsystem.mapper.AdminMapper;
import com.chainsys.booksalesmanagementsystem.mapper.OrderMapper;
import com.chainsys.booksalesmanagementsystem.model.Admin;
import com.chainsys.booksalesmanagementsystem.model.OrdersDetails;

@Repository
public class AdminDao {

	@Autowired
	JdbcTemplate jdbcTemplate;

	@Autowired
	Admin adm;

	public Admin adminLogin(String uname, String pwd) throws SQLException {
		String q = "select user_name, password from admin";
		Admin info = null;
		info = jdbcTemplate.queryForObject(q, new AdminMapper());
		return info;
	}

	public List<OrdersDetails> getOrderList() throws SQLException {
		String q = "select od.cartid, od.username, od.booksid, od.quantity, od.price, od.orderid, od.ordereddate, od.status, od.orderedaddress, us.emailid, us.phoneno "
				+ "from orders od inner join userdetails us on od.username = us.username";
		List<OrdersDetails> orderList = null;
		orderList = jdbcTemplate.query(q, new OrderMapper());
		return orderList;
	}
}

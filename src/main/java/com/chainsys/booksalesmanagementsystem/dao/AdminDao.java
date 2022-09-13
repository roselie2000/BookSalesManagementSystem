package com.chainsys.booksalesmanagementsystem.dao;

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
	
	public Admin adminLogin(String uname, String pwd) {
		String q = "select * from admin";
		Admin info = null;
		try {
			info = jdbcTemplate.queryForObject(q, new AdminMapper());
		}catch (Exception e) {
			e.printStackTrace();
		}		
		return info;
	}
	
	public List<OrdersDetails> getOrderList(){
		String q = "select * from orderhistory inner join userdetails on orderhistory.username = userdetails.username";
		List<OrdersDetails> orderList = null;
		try {
			orderList = jdbcTemplate.query(q, new OrderMapper());
			return orderList;
		}catch (Exception e) {
			return orderList;
		}
		
	}
}

package com.chainsys.booksalesmanagementsystem.mapper;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

import com.chainsys.booksalesmanagementsystem.model.Users;

public class UserMapper implements RowMapper<Users>{

	@Override
	public Users mapRow(ResultSet rs, int rowNum) throws SQLException {
		String userName = rs.getString("username");
		String pwd = rs.getString("password");
		String email = rs.getString("emailid");
		String name = rs.getString("name");
		String phno = rs.getString("phoneno");
		String address = rs.getString("address");
		String district = rs.getString("district");
		String state = rs.getString("state");
		int pincode = rs.getInt("pincode");
		
		Users us = new Users();
		us.setUserName(userName);
		us.setPassword(pwd);
		us.setEmailId(email);
		us.setName(name);
		us.setPhoneno(phno);
		us.setAddress(address);
		us.setDistrict(district);
		us.setState(state);
		us.setPincode(pincode);
		return us;
	}

}

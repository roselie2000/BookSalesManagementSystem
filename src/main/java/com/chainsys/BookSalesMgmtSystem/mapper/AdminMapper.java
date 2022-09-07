package com.chainsys.BookSalesMgmtSystem.mapper;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.RowMapper;

import com.chainsys.BookSalesMgmtSystem.model.Admin;

public class AdminMapper implements RowMapper<Admin> {
	
	@Override
	public Admin mapRow(ResultSet rs, int rowNum) throws SQLException {
		String uname = rs.getString("user_name");
		String pwd = rs.getString("password");
		Admin admin = new Admin();
		admin.setAdminUserName(uname);
		admin.setAdminPassword(pwd);
		return admin;
	}

	
}

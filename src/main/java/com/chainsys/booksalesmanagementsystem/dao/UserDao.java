package com.chainsys.booksalesmanagementsystem.dao;

import java.util.List;
import java.util.stream.Collectors;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.chainsys.booksalesmanagementsystem.mapper.UserMapper;
import com.chainsys.booksalesmanagementsystem.model.Users;

@Repository
public class UserDao {

	@Autowired
	JdbcTemplate jdbcTemplate;

	public int signup(Users us) {
		String insertUser = "insert into userDetails(username, password, emailid) values (?, ?, ?)";
		Object[] data = { us.getUserName(), us.getPassword(), us.getEmailId() };// create the object for execute the
																				// query
		int noOfRowsAffected = jdbcTemplate.update(insertUser, data);// execute the query
		return noOfRowsAffected;
	}

	public boolean login(String userName, String password) {

		String selectUser = "select password from userDetails where username = ?";
		String queryObject = null;
		try {
			queryObject = jdbcTemplate.queryForObject(selectUser, String.class, userName);
			if (queryObject == null) {
				return false;
			} else {
				if (queryObject.equals(password)) {
					return true;
				} else {
					return false;
				}
			}
		} catch (Exception e) {
			return false;
		}
	}

	public boolean checkUserNameAvail(String userName) {

		String selectPasswordByUserName = "select password from userDetails where username = ?";
		String queryObject = null;
		try {
			queryObject = jdbcTemplate.queryForObject(selectPasswordByUserName, String.class, userName);
			if (queryObject == null) {
				return true;
			} else {
				return false;
			}
		} catch (Exception e) {
			return true;
		}
	}

	public List<Users> getUserList() {
		String selectUserList = "select * from userDetails";
		List<Users> users = null;
		try {
			users = jdbcTemplate.query(selectUserList, new UserMapper());
			return users;
		} catch (Exception e) {
			return users;
		}

	}

	public Users getUserById(String userName) {
		String selectUserByUserName = "select * from userdetails where username = ?";
		Users queryObj = null;
		queryObj = jdbcTemplate.queryForObject(selectUserByUserName, new UserMapper(), userName);
		return queryObj;
	}

	public int updatePassword(String username, String password) {
		String updatePassword = "update userdetails set password = ? WHERE username = ?";
		Object[] userData = { password, username };
		try {
			int noOfRowsAffected = jdbcTemplate.update(updatePassword, userData);
			return noOfRowsAffected;
		} catch (Exception e) {
			return 0;
		}

	}

	public int upadteUser(Users user) {
		String updateUser = "update userdetails set name = ?, phoneno = ?, address = ?, district = ?, state = ?, pincode = ?"
				+ "where username = ?";
		Object[] userData = { user.getName(), user.getPhoneno(), user.getAddress(), user.getDistrict(), user.getState(),
				user.getPincode(), user.getUserName() };
		try {
			int noOfRowsAffected = jdbcTemplate.update(updateUser, userData);
			return noOfRowsAffected;
		} catch (Exception e) {
			return 0;
		}
	}

	public List<Users> getTopBuyers() {
		String selectTopUser = "select username from(select username, sum(price) "
				+ "from orders GROUP BY username ORDER by username desc)where ROWNUM <= 4";
		List<String> userList = null;
		List<Users> topUserList = null;
		try {
			userList = jdbcTemplate.queryForList(selectTopUser, String.class);
			topUserList = userList.stream().map(user -> getUserById(user)).collect(Collectors.toList());
			return topUserList;
		} catch (Exception e) {
			return topUserList;
		}

	}
}

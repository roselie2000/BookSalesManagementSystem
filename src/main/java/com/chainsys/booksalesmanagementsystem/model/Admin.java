package com.chainsys.booksalesmanagementsystem.model;

import org.springframework.stereotype.Repository;

@Repository
public class Admin {

	private String adminUserName;
	private String adminPassword;

	public String getAdminUserName() {
		return adminUserName;
	}

	public void setAdminUserName(String adminUserName) {
		this.adminUserName = adminUserName;
	}

	public String getAdminPassword() {
		return adminPassword;
	}

	public void setAdminPassword(String adminPassword) {
		this.adminPassword = adminPassword;
	}

}

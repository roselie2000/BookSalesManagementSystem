package com.chainsys.booksalesmanagementsystem.model;

public class OrdersDetails extends Orders {

	private String emailId;
	private String phoneno;
	private String orderedAddress;

	public String getEmailId() {
		return emailId;
	}

	public void setEmailId(String emailId) {
		this.emailId = emailId;
	}

	public String getPhoneno() {
		return phoneno;
	}

	public void setPhoneno(String phoneno) {
		this.phoneno = phoneno;
	}

	public String getOrderedAddress() {
		return orderedAddress;
	}

	public void setOrderedAddress(String orderedAddress) {
		this.orderedAddress = orderedAddress;
	}

	

}

package com.chainsys.booksalesmanagementsystem.exception;

public class DataAddedException extends Exception{

	private static final long serialVersionUID = 1L;

	public DataAddedException() {
		
		super("Some internal problem may occur. The data of book is not added!. Please try again later");
	}
   public DataAddedException(String errmsg) {
		super(errmsg);
	}
}

package br.com.pub.exception;

public class UserException extends Exception {

	/**
	 * 
	 */
	private static final long serialVersionUID = 8175041411110160851L;
	
	public UserException(){}
	
	public UserException(String message) {
		super(message);
	}

}

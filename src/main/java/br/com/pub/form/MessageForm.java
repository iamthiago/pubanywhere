package br.com.pub.form;

import java.io.Serializable;

public class MessageForm implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 8127671362379721169L;
	
	private String message;
	
	private String pubId;
	
	private int rating;
	
	public String getMessage() {
		return message;
	}
	public void setMessage(String message) {
		this.message = message;
	}
	public String getPubId() {
		return pubId;
	}
	public void setPubId(String pubId) {
		this.pubId = pubId;
	}
	public int getRating() {
		return rating;
	}
	public void setRating(int rating) {
		this.rating = rating;
	}
}

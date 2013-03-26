package br.com.pub.form;

import java.io.Serializable;

import org.hibernate.validator.constraints.Email;
import org.hibernate.validator.constraints.NotEmpty;

public class PasswordForm implements Serializable {
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1750671450454860333L;
	
	@Email
	@NotEmpty
	private String email;

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}
}

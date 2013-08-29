package br.com.pub.form;

import java.io.Serializable;

import org.hibernate.validator.constraints.Email;
import org.hibernate.validator.constraints.Length;
import org.hibernate.validator.constraints.NotEmpty;

public class ContactForm implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 3961290475450200533L;
	
	@NotEmpty
	private String name;
	
	private String subject;
	
	@NotEmpty
	@Length(max = 2000)
	private String description;
	
	@Email
	@NotEmpty
	private String from;
	
	private String to;
	
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public String getFrom() {
		return from;
	}
	public void setFrom(String from) {
		this.from = from;
	}
	public String getTo() {
		return to;
	}
	public void setTo(String to) {
		this.to = to;
	}	
}

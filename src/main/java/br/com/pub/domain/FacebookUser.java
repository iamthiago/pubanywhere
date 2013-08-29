package br.com.pub.domain;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;

@Entity
public class FacebookUser implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = -3161449697002617181L;
	
	@Id
	@Column(name = "FACEBOOK_PROFILE_ID", insertable = true, updatable = false, unique = true)
	private long facebookProfileId;
	
	@Column(name = "FIRST_NAME")
	private String firstName;
	
	@Column(name = "LAST_NAME")
	private String lastName;
	
	@Column(name = "FULL_NAME")
	private String fullName;
	
	@Column(name = "GENDER")
	private String gender;
	
	@Column(name = "EMAIL")
	private String email;

	public long getFacebookProfileId() {
		return facebookProfileId;
	}

	public void setFacebookProfileId(long facebookProfileId) {
		this.facebookProfileId = facebookProfileId;
	}

	public String getFirstName() {
		return firstName;
	}

	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}

	public String getLastName() {
		return lastName;
	}

	public void setLastName(String lastName) {
		this.lastName = lastName;
	}

	public String getFullName() {
		return fullName;
	}

	public void setFullName(String fullName) {
		this.fullName = fullName;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}
}

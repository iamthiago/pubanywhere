package com.pub.mongo.domain;

import java.io.Serializable;

import org.bson.types.ObjectId;
import org.springframework.data.annotation.Id;
import org.springframework.data.mongodb.core.index.Indexed;

public class FacebookUser implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = -5770421558270153223L;

	@Id
	private ObjectId id;
	
	@Indexed(unique = true)
	private long facebookProfileId;
	
	private String firstName;
	private String lastName;
	private String fullName;
	private String gender;
	private String email;
	
	public FacebookUser(){}

	public FacebookUser(long facebookProfileId, String firstName,
			String lastName, String fullName, String gender, String email) {
		this.facebookProfileId = facebookProfileId;
		this.firstName = firstName;
		this.lastName = lastName;
		this.fullName = fullName;
		this.gender = gender;
		this.email = email;
	}
	
	public ObjectId getId() {
		return id;
	}

	public void setId(ObjectId id) {
		this.id = id;
	}

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

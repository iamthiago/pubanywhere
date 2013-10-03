package com.pub.mongo.domain;

import java.io.Serializable;
import java.util.List;

import org.bson.types.ObjectId;
import org.springframework.data.annotation.Id;
import org.springframework.data.mongodb.core.index.Indexed;

public class Users implements Serializable {
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 7481521174588616004L;

	@Id
	private ObjectId id;
	
	@Indexed(unique = true)
	private String username;
	
	private String password;
	private boolean enabled;
	private List<Authorities> authorities;
	private FacebookUser facebookUser;
	private int reviews;
	private int rank;
	
	public Users(){}
	
	public Users(String username, String password, boolean enabled,
			List<Authorities> authorities, FacebookUser facebookUser, int reviews) {
		this.username = username;
		this.password = password;
		this.enabled = enabled;
		this.authorities = authorities;
		this.facebookUser = facebookUser;
		this.reviews = reviews;
	}
	
	public ObjectId getId() {
		return id;
	}

	public void setId(ObjectId id) {
		this.id = id;
	}

	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public boolean isEnabled() {
		return enabled;
	}
	public void setEnabled(boolean enabled) {
		this.enabled = enabled;
	}
	public List<Authorities> getAuthorities() {
		return authorities;
	}
	public void setAuthorities(List<Authorities> authorities) {
		this.authorities = authorities;
	}
	public FacebookUser getFacebookUser() {
		return facebookUser;
	}
	public void setFacebookUser(FacebookUser facebookUser) {
		this.facebookUser = facebookUser;
	}
	public int getReviews() {
		return reviews;
	}
	public void setReviews(int reviews) {
		this.reviews = reviews;
	}
	public int getRank() {
		return rank;
	}
	public void setRank(int rank) {
		this.rank = rank;
	}
}

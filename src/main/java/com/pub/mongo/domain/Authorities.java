package com.pub.mongo.domain;

import java.io.Serializable;

import org.bson.types.ObjectId;
import org.springframework.data.annotation.Id;
import org.springframework.data.mongodb.core.index.Indexed;

public class Authorities implements Serializable {
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 3071529895160816910L;

	@Id
	private ObjectId id;
	
	@Indexed(unique = true)
	private Long authoritiesId;
	
	private String authority;
	
	public Authorities(){}
	
	public Authorities(Long authoritiesId, String authority) {
		this.authoritiesId = authoritiesId;
		this.authority = authority;
	}

	public ObjectId getId() {
		return id;
	}

	public void setId(ObjectId id) {
		this.id = id;
	}

	public Long getAuthoritiesId() {
		return authoritiesId;
	}

	public void setAuthoritiesId(Long authoritiesId) {
		this.authoritiesId = authoritiesId;
	}

	public String getAuthority() {
		return authority;
	}

	public void setAuthority(String authority) {
		this.authority = authority;
	}
}

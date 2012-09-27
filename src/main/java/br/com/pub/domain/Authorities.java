package br.com.pub.domain;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity
public class Authorities implements Serializable {
	
	/**
	 * 
	 */
	private static final long serialVersionUID = -3958781416943538081L;

	@Id
	@GeneratedValue(strategy = GenerationType.TABLE)
	@Column(name = "AUTHORITIES_ID")
	private Long authoritiesId;
	
	@Column(name = "AUTHORITY")
	private String authority;

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

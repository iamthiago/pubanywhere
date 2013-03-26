package br.com.pub.domain;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import org.springframework.format.annotation.DateTimeFormat;

@Entity
public class PubUser implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = -7760383559131014036L;

	@Id
	@GeneratedValue(strategy = GenerationType.TABLE)
	@Column(name = "PUB_USER_ID")
	private Long pubUserId;
	
	@Column(name = "NAME")
	private String name;
	
	@Column(name = "EMAIL", unique = true)
	private String email;
	
	@Column(name = "EMAIL_HASH")
	private String emailHash;
	
	@Column(name = "HASH")
	private String hash;
	
	@Temporal(TemporalType.TIMESTAMP)
	@DateTimeFormat(pattern="dd/MM/yyyy hh:mm:ss")
	@Column(name = "SINCE")
	private Date since;

	public Long getPubUserId() {
		return pubUserId;
	}

	public void setPubUserId(Long pubUserId) {
		this.pubUserId = pubUserId;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getEmailHash() {
		return emailHash;
	}

	public void setEmailHash(String emailHash) {
		this.emailHash = emailHash;
	}

	public String getHash() {
		return hash;
	}

	public void setHash(String hash) {
		this.hash = hash;
	}

	public Date getSince() {
		return since;
	}

	public void setSince(Date since) {
		this.since = since;
	}
}

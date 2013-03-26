package br.com.pub.domain;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import org.springframework.format.annotation.DateTimeFormat;

@Entity
public class PubMessages  implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = -4308545791064483757L;
	
	@Id
	@GeneratedValue(strategy = GenerationType.TABLE)
	@Column(name = "PUB_MESSAGE_ID")
	private Long id;
	
	@ManyToOne
	@JoinColumn(name = "PUB_ID")
	private Pub pub;
	
	@ManyToOne
	@JoinColumn(name = "USERNAME")
	private Users users;
	
	@Column(name = "MESSAGE_RATING")
	private int messageRating;
	
	@Column(name = "MESSAGE_REVIEW")
	private String messageReview;
	
	@Temporal(TemporalType.TIMESTAMP)
	@DateTimeFormat(pattern="dd/MM/yyyy hh:mm:ss")
	@Column(name = "CREATED")
	private Date created;

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public Pub getPub() {
		return pub;
	}

	public void setPub(Pub pub) {
		this.pub = pub;
	}

	public Users getUsers() {
		return users;
	}

	public void setUsers(Users users) {
		this.users = users;
	}

	public int getMessageRating() {
		return messageRating;
	}

	public void setMessageRating(int messageRating) {
		this.messageRating = messageRating;
	}

	public String getMessageReview() {
		return messageReview;
	}

	public void setMessageReview(String messageReview) {
		this.messageReview = messageReview;
	}

	public Date getCreated() {
		return created;
	}

	public void setCreated(Date created) {
		this.created = created;
	}
}

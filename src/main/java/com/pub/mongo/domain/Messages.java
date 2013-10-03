package com.pub.mongo.domain;

import java.io.Serializable;
import java.util.Date;

import org.bson.types.ObjectId;
import org.springframework.data.annotation.Id;
import org.springframework.data.mongodb.core.index.Indexed;

public class Messages implements Serializable {

	
	/**
	 * 
	 */
	private static final long serialVersionUID = -9186410358057773293L;

	@Id
	@Indexed(unique = true)
	private ObjectId id;
	
	private int messageRating;
	private Date created;
	
	@Indexed
	private Users user;

	public ObjectId getId() {
		return id;
	}
	public void setId(ObjectId id) {
		this.id = id;
	}
	public int getMessageRating() {
		return messageRating;
	}
	public void setMessageRating(int messageRating) {
		this.messageRating = messageRating;
	}
	public Date getCreated() {
		return created;
	}
	public void setCreated(Date created) {
		this.created = created;
	}
	public Users getUser() {
		return user;
	}
	public void setUser(Users user) {
		this.user = user;
	}
}

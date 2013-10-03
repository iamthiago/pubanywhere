package com.pub.mongo.domain;

import java.io.Serializable;

import org.bson.types.ObjectId;
import org.springframework.data.annotation.Id;
import org.springframework.data.mongodb.core.index.Indexed;

public class RegisteredCountry implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 8414651768966957061L;

	@Id
	private ObjectId id;
	
	@Indexed(unique = true)
	private String springCode;
	
	private String name;
	private String imgName;
	
	public ObjectId getId() {
		return id;
	}
	public void setId(ObjectId id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getImgName() {
		return imgName;
	}
	public void setImgName(String imgName) {
		this.imgName = imgName;
	}
	public String getSpringCode() {
		return springCode;
	}
	public void setSpringCode(String springCode) {
		this.springCode = springCode;
	}
}

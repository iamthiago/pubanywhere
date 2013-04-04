package br.com.pub.domain;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;

@Entity
public class RegisteredCountry implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 3940261183041764938L;
	
	@Id
	@Column(name = "COUNTRY_ID", insertable = true, updatable = false, unique = true)
	private Long id;
	
	@Column(name = "NAME")
	private String name;
	
	@Column(name = "IMG_NAME")
	private String imgName;
	
	@Column(name = "SPRING_CODE")
	private String springCode;
	
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
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

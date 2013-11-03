package com.pub.mongo.domain;

import java.io.Serializable;
import java.util.Date;
import java.util.List;

import org.bson.types.ObjectId;
import org.hibernate.validator.constraints.Email;
import org.hibernate.validator.constraints.Length;
import org.hibernate.validator.constraints.NotEmpty;
import org.springframework.data.annotation.Id;
import org.springframework.data.mongodb.core.index.GeoSpatialIndexed;
import org.springframework.data.mongodb.core.index.Indexed;

public class Pub implements Serializable {
	
	/**
	 * 
	 */
	private static final long serialVersionUID = -5693036738886608411L;

	public Pub() {}
	
	public Pub(String name, String local, String phone, String website) {
		this.name = name;
		this.local = local;
		this.phone = phone;
		this.website = website;
	}
	
	@Id
	private ObjectId id;
	
	@Indexed(unique = true)
	private String pubId;

	@Indexed
	@NotEmpty
	private String name;
	
	@Indexed
	private String city;
	
	@Indexed
	private String country;
	
	@Indexed
	private double rating;
	
	@GeoSpatialIndexed
	private double [] location;
	
	@NotEmpty
	private String local;
	
	private String state;
	
	@NotEmpty
	@Length(max = 3000)
	private String descricao;
	
	@Email
	private String email;

	private String phone;
	private String website;
	private String facebook;
	private String twitter;
	private Date desde;
	private Double lat;
	private Double lng;
	private boolean enabled;
	private long pubViews;
	private double pubValueRating;
	private int pubCountRating;
	private double pubTotalRating;
	private int pubImages;
	
	private List<Messages> messages;
	
	public ObjectId getId() {
		return id;
	}
	public void setId(ObjectId id) {
		this.id = id;
	}
	public String getPubId() {
		return pubId;
	}
	public void setPubId(String pubId) {
		this.pubId = pubId;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getLocal() {
		return local;
	}
	public void setLocal(String local) {
		this.local = local;
	}
	public String getCity() {
		return city;
	}
	public void setCity(String city) {
		this.city = city;
	}
	public String getState() {
		return state;
	}
	public void setState(String state) {
		this.state = state;
	}
	public String getCountry() {
		return country;
	}
	public void setCountry(String country) {
		this.country = country;
	}
	public String getDescricao() {
		return descricao;
	}
	public void setDescricao(String descricao) {
		this.descricao = descricao;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getWebsite() {
		return website;
	}
	public void setWebsite(String website) {
		this.website = website;
	}
	public String getFacebook() {
		return facebook;
	}
	public void setFacebook(String facebook) {
		this.facebook = facebook;
	}
	public String getTwitter() {
		return twitter;
	}
	public void setTwitter(String twitter) {
		this.twitter = twitter;
	}
	public Date getDesde() {
		return desde;
	}
	public void setDesde(Date desde) {
		this.desde = desde;
	}
	public Double getLat() {
		return lat;
	}
	public void setLat(Double lat) {
		this.lat = lat;
	}
	public Double getLng() {
		return lng;
	}
	public void setLng(Double lng) {
		this.lng = lng;
	}
	public boolean isEnabled() {
		return enabled;
	}
	public void setEnabled(boolean enabled) {
		this.enabled = enabled;
	}
	public long getPubViews() {
		return pubViews;
	}
	public void setPubViews(long pubViews) {
		this.pubViews = pubViews;
	}
	public double getPubValueRating() {
		return pubValueRating;
	}
	public void setPubValueRating(double pubValueRating) {
		this.pubValueRating = pubValueRating;
	}
	public int getPubCountRating() {
		return pubCountRating;
	}
	public void setPubCountRating(int pubCountRating) {
		this.pubCountRating = pubCountRating;
	}
	public double getPubTotalRating() {
		return pubTotalRating;
	}
	public void setPubTotalRating(double pubTotalRating) {
		this.pubTotalRating = pubTotalRating;
	}
	public List<Messages> getMessages() {
		return messages;
	}
	public void setMessages(List<Messages> messages) {
		this.messages = messages;
	}
	public double getRating() {
		return rating;
	}
	public void setRating(double rating) {
		this.rating = rating;
	}
	public double[] getLocation() {
		return location;
	}
	public void setLocation(double[] location) {
		this.location = location;
	}
	public int getPubImages() {
		return pubImages;
	}
	public void setPubImages(int pubImages) {
		this.pubImages = pubImages;
	}
}

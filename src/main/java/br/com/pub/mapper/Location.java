package br.com.pub.mapper;

import java.io.Serializable;

import com.google.gson.annotations.SerializedName;

public class Location implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = -6169630928685364933L;
	
	@SerializedName("lat")
	private Double lat;
	
	@SerializedName("lng")
	private Double lng;
	
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
}

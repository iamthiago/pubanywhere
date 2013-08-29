package br.com.pub.mapper;

import java.io.Serializable;

import com.google.gson.annotations.SerializedName;

public class Geometry implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 2595373599682057513L;
	
	@SerializedName("location")
	private Location location;

	public Location getLocation() {
		return location;
	}

	public void setLocation(Location location) {
		this.location = location;
	}
}

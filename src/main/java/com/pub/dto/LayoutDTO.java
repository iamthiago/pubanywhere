package com.pub.dto;

import java.io.Serializable;
import java.util.List;

public class LayoutDTO implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 8408659040629904626L;
	
	private List<Object> objects;

	public List<Object> getObjects() {
		return objects;
	}

	public void setObjects(List<Object> objects) {
		this.objects = objects;
	}
}

package com.pub.enumeration;

public enum StaticImage {
	
	USER("user_75x75.gif"),
	PUB("no_image_large.jpg");
	
	private String path;

	private StaticImage(String path) {
		this.path = path;
	}

	public String getPath() {
		return path;
	}

	public void setPath(String path) {
		this.path = path;
	}
}

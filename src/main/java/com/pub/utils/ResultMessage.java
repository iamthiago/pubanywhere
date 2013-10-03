package com.pub.utils;

import java.io.Serializable;

public class ResultMessage implements Serializable {
	
	/**
	 * 
	 */
	private static final long serialVersionUID = -9202700350523724571L;
	
	private String key;
	private Object value;
	
	public ResultMessage(){}
	
	public ResultMessage(String key, Object value) {
		super();
		this.key = key;
		this.value = value;
	}
	
	public String getKey() {
		return key;
	}
	public void setKey(String key) {
		this.key = key;
	}
	public Object getValue() {
		return value;
	}
	public void setValue(Object value) {
		this.value = value;
	}
}
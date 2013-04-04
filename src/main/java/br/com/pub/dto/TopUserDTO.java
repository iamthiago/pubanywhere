package br.com.pub.dto;

import java.io.Serializable;

public class TopUserDTO implements Serializable {
	
	/**
	 * 
	 */
	private static final long serialVersionUID = -4893139041681367034L;
	
	private String username;
	private Integer qtdMsg;
	
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public Integer getQtdMsg() {
		return qtdMsg;
	}
	public void setQtdMsg(Integer qtdMsg) {
		this.qtdMsg = qtdMsg;
	}
}

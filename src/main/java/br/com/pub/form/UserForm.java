package br.com.pub.form;

import java.io.Serializable;

public class UserForm implements Serializable {
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1374279725861510025L;
	
	private String username;
	private String senha;
	private String confirmarSenha;
	
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getSenha() {
		return senha;
	}
	public void setSenha(String senha) {
		this.senha = senha;
	}
	public String getConfirmarSenha() {
		return confirmarSenha;
	}
	public void setConfirmarSenha(String confirmarSenha) {
		this.confirmarSenha = confirmarSenha;
	}	
}

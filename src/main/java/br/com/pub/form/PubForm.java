package br.com.pub.form;

import java.io.Serializable;


public class PubForm implements Serializable {
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 5106942228189740232L;
	
	private String nome;
	private Double lat;
	private Double lng;
	
	public String getNome() {
		return nome;
	}
	public void setNome(String nome) {
		this.nome = nome;
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
}

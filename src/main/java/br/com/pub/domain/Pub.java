package br.com.pub.domain;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

import org.hibernate.validator.constraints.NotEmpty;

@Entity
public class Pub implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = -2798520271567297643L;
	
	@Id
	@GeneratedValue(strategy = GenerationType.TABLE)
	@Column(name = "PUB_ID", insertable = true, updatable = false)
	private Long pubId;
	
	@NotEmpty
	@Column(name = "NOME")
	private String nome;
	
	@NotEmpty
	@Column(name = "LOCAL")
	private String local;
	
	@NotEmpty
	@Column(name = "DESCRICAO")
	private String descricao;
	
	@Column(name = "PHONE")
	private String phone;
	
	@Column(name = "EMAIL")
	private String email;
	
	@Column(name = "LAT", precision = 15, scale = 20)
	private Double lat;
	
	@Column(name = "LNG", precision = 15, scale = 20)
	private Double lng;

	public Long getPubId() {
		return pubId;
	}

	public void setPubId(Long pubId) {
		this.pubId = pubId;
	}

	public String getNome() {
		return nome;
	}

	public void setNome(String nome) {
		this.nome = nome;
	}

	public String getLocal() {
		return local;
	}

	public void setLocal(String local) {
		this.local = local;
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
